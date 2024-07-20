import 'package:flutter/widgets.dart';
import '../../model/start_trip_model/start_trip_model.dart';

@immutable
abstract class StartTripLogicState {
  const StartTripLogicState();
}

class StartTripLogicInitial extends StartTripLogicState {}

class StartTripSuccess extends StartTripLogicState {
  final StartTripModel? startTripModel;

  StartTripSuccess({this.startTripModel});
}

class StartTripError extends StartTripLogicState {
  final String errorMessage;

  StartTripError(this.errorMessage);
}

class StartTripLoading extends StartTripLogicState {}
