part of 'group_data_cubit.dart';

sealed class GroupDataState extends Equatable {
  const GroupDataState();

  @override
  List<Object> get props => [];
}

final class GroupDataInitial extends GroupDataState {}

final class GroupDataLoading extends GroupDataState {}

final class GroupDataLoaded extends GroupDataState {
  final GroupDataModel? gropuDataModel;

  const GroupDataLoaded({this.gropuDataModel});
}

final class GroupDataError extends GroupDataState {
  final String? errorMessage;

  const GroupDataError({required this.errorMessage});
}
