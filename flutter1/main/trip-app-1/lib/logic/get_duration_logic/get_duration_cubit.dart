import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip_app/repositories/auth/auth_repo.dart';
import 'package:trip_app/utils/peferance/peferance.dart';

import '../../model/get_duration_model/get_duration_model.dart';

part 'get_duration_state.dart';

class GetDurationCubit extends Cubit<GetDurationState> {
  final AuthRepo _authRepo = AuthRepo();
  GetDurationCubit() : super(GetDurationInitial());

  void getDurationTime() async {
    try {
      emit(GetDurationLoading());
      var data = await _authRepo.getDurationData();
      data.fold(
        (error) {
          emit(GetDurationError(error.message));
        },
        (data) async {
          emit(GetDurationLoaded(getDurationModel: data));
        //  try {
        //     final getDurationModelString = jsonEncode(data.toJson());
        //     await LocalStorageUtils.instance
        //         .setString('getDurationModel', getDurationModelString);
        //     print("getDurationModel saved to storage");
        //   } catch (error) {
        //     print("Error saving getDurationModel: $error");
        //   }
        },
      );
    } catch (e) {
      emit(GetDurationError(e.toString()));
    }
  }
}
