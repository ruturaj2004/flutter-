part of 'get_cubit.dart';

@immutable
sealed class GetState {
  final GetResponse? getResponse;

  GetState({ this.getResponse});
}

final class GetInitial extends GetState {}
final class GetLoading extends GetState {}
final class GetLoaded extends GetState {
  GetLoaded({super.getResponse});
}

final class GetError extends GetState {
  final String? error;
  GetError({this.error});
}
