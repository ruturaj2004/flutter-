import 'dart:convert';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip_app/model/start_trip_model/start_trip_model.dart';
import 'package:trip_app/utils/peferance/peferance.dart';

import '../../repositories/auth/auth_repo.dart';
import 'start_trip_logic_state.dart';

class StartTripLogicCubit extends Cubit<StartTripLogicState> {
  final AuthRepo _authRepo = AuthRepo();

  StartTripLogicCubit() : super(StartTripLogicInitial());

  void startTrip({
    required List<double> fromLatLong,
    required List<double> destinationLatLong,
    required String from,
    required List<String> destination,
    int groupId = 1698658253245,
  }) async {
    emit(StartTripLoading());
    try {
      final response = await _authRepo.startTrip(
          fromLatLong, destinationLatLong, from, destination, groupId);
      response.fold(
        (failure) {
          emit(StartTripError(failure.message));
        },
        (data) async {
          emit(StartTripSuccess(startTripModel: data));
          print("data is  $data");
          try {
            final startTripModelString = jsonEncode(data.toJson());
            await LocalStorageUtils.instance
                .setString('startTripModel', startTripModelString);
            print("StartTripModel saved to storage");
          } catch (error) {
            print("Error saving StartTripModel: $error");
          }
        },
      );
    } catch (error) {
      emit(StartTripError(error.toString()));
    }
  }
}
