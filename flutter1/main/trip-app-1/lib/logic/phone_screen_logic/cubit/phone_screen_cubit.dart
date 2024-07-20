import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:trip_app/repositories/auth/auth_repo.dart';
import 'package:trip_app/utils/routes/app_utils/snackbar/snackbar.dart';

part 'phone_screen_state.dart';

class SendOtpCubit extends Cubit<PhoneScreenState> {
  final AuthRepo _authRepo = AuthRepo();
  SendOtpCubit() : super(PhoneScreenInitial());

  void sendOtp(String number, BuildContext context) async {
    var data = {"phoneNumber": number, "groupId": 1703228300417};
    try {
      emit(SendOtpLoading());
      var response = await _authRepo.sendOtp(data: data);
      response.fold((error) {
        emit(SendOtpError(error.message));
      }, (data) {
        emit(SendOtpSuccess());
        SnackBarWidget.showSnackbar(context, 'OTP sent successfully!');
      });
    } catch (e) {
      emit(SendOtpError(e.toString()));
    }
  }
}
