import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:trip_app/utils/peferance/peferance.dart';
import '../../model/update_location_model/update_location_model.dart';
import '../../repositories/auth/auth_repo.dart';
part 'update_location_state.dart';

class UpdateLocationCubit extends Cubit<UpdateLocationState> {
  final AuthRepo _authRepo = AuthRepo();

  UpdateLocationCubit() : super(UpdateLocationInitial());

  void updateLocationData({
    List<double>? destinationLatLong,
    String? destination,
  }) async {
    emit(UpdateLocationLoading());

    if (destinationLatLong == null) {
      emit(UpdateLocationError("Invalid destinationLatLong"));
      return;
    }
    var response =
        await _authRepo.updateLocation(destination, destinationLatLong);
    response.fold((error) => emit(UpdateLocationError(error.message)),
        (data) async {
      emit(UpdateLocationLoaded(updateLocationModel: data));
      try {
        final updatelocation = jsonEncode(data.toJson());
        await LocalStorageUtils.instance
            .setString('updatelocation', updatelocation);
        print("updatelocation saved to storage");
      } catch (error) {
        print("Error saving updatelocation: $error");
      }
    });
  }
}
