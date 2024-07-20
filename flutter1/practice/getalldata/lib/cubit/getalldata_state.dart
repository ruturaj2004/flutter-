part of 'getalldata_cubit.dart';

// @immutable
// sealed class GetalldataState {
//   final GetResponse? getResponse;

//   GetalldataState({ this.getResponse});

// }

// final class GetalldataInitial extends GetalldataState {}
// final class GetalldataLoading extends GetalldataState {}

// final class GetalldataLoaded extends GetalldataState{
//    GetalldataLoaded ({super.getResponse});
// }


// final class GetalldataError extends GetalldataState{
//   final String? error;

//   GetalldataError({this.error});

// }



sealed class GetalldataState{
  final GetResponse? getResponse;
  GetalldataState({this.getResponse});

}

final class GetalldataInitial extends GetalldataState{}
final class GetalldataLoading extends GetalldataState{}
final class GetalldataLoaded extends GetalldataState{
  GetalldataLoaded({super.getResponse});
}
final class GetalldataError extends GetalldataState{
  String ? error;
  GetalldataError({this.error});
}