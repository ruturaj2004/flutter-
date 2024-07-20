part of 'get_duration_cubit.dart';

abstract class GetDurationState {
  const GetDurationState();
}

class GetDurationInitial extends GetDurationState {}

class GetDurationLoading extends GetDurationState {}

class GetDurationLoaded extends GetDurationState {
  final GetDurationModel? getDurationModel;

  GetDurationLoaded({this.getDurationModel});
}

class GetDurationError extends GetDurationState {
  final String? errorMessage;
  GetDurationError(
    this.errorMessage,
  );
}
