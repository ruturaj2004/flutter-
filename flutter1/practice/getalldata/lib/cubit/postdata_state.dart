part of 'postdata_cubit.dart';

@immutable
sealed class PostdataState {

}

final class PostdataInitial extends PostdataState {}
final class PostdataLoading extends PostdataState {}
final class PostdataError extends PostdataState {}
final class PostdataSuccess extends PostdataState {}

