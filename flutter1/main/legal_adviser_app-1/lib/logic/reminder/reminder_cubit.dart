import 'package:flutter_bloc/flutter_bloc.dart';

class ReminderCubit extends Cubit<bool> {
  ReminderCubit() : super(false);

  void toggleLight(bool value) {
    emit(value);
  }
}

