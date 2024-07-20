import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_adviser/logic/dropdown/dropdowncubit_state.dart';

class DropdownCubit extends Cubit<DropdownState> {
  DropdownCubit() : super(DropdownState(casedetail: 'Living Alone'));

  void updateCaseType(String newValue) {
    emit(DropdownState(casedetail: newValue));
  }

  // Method to programmatically select a value in the dropdown
  void selectCaseType(String selectedValue) {
    updateCaseType(selectedValue);
  }
}
