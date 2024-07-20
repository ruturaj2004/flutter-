part of 'update_location_cubit.dart';

abstract class UpdateLocationState {
  const UpdateLocationState();
}

class UpdateLocationInitial extends UpdateLocationState {}

class UpdateLocationLoading extends UpdateLocationState {}

class UpdateLocationLoaded extends UpdateLocationState {
  final UpdateLocationModel? updateLocationModel;
  UpdateLocationLoaded({this.updateLocationModel});
}

class UpdateLocationError extends UpdateLocationState {
  UpdateLocationError(this.errorMessage);
  final String errorMessage;
}
