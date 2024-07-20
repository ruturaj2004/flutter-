part of 'get_data_cubit.dart';

@immutable
sealed class GetDataState {
  final GetResponse? getResponse;

  const GetDataState({this.getResponse});
}

final class GetDataInitial extends GetDataState {}

final class GetDataLoading extends GetDataState {}

final class GetDataLoaded extends GetDataState {
  const GetDataLoaded({super.getResponse});
}

final class GetDataError extends GetDataState {
  final String? error;

  const GetDataError({this.error});
}
