import 'package:meta/meta.dart';
import '../../model/get_group_model/get_group_model.dart';

abstract class GetGroupsState {
  final GetGroupsModel? getGroupsModel;
  const GetGroupsState({this.getGroupsModel});
}

class GetGroupsInitial extends GetGroupsState {}

class GetGroupsLoading extends GetGroupsState {}

class GetGroupsLoaded extends GetGroupsState {
  GetGroupsLoaded({required this.getGroupsModel}) ;

  @override
  final GetGroupsModel getGroupsModel;
}

class GetGroupsError extends GetGroupsState {
  final String? errorMessage;
  GetGroupsError( this.errorMessage);
}
