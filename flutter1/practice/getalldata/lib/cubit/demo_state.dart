part of 'demo_cubit.dart';

@immutable
sealed class DemoState {}

final class DemoInitial extends DemoState {}

final class DemoLoading extends DemoState {}

final class DemoSuccess extends DemoState {}

final class DemoError extends DemoState {

  
}
