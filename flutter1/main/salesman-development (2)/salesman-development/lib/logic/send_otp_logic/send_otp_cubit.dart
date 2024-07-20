import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:salesman_app/main.dart';
import 'package:salesman_app/model/send_otp_model/send_otp_model.dart';
import 'package:salesman_app/utils/api/api_base.dart';

import '../../utils/snackbar/snackbar.dart';

part 'send_otp_state.dart';

class SendOtpCubit extends Cubit<SendOtpState> {
  final ApiBase _apiBase = ApiBase();
  SendOtpCubit() : super(SendOtpInitial());

  void sendOtp(String number, BuildContext context) async {
    var data = {
      "phoneNumber": number,
    };

    try {
      emit(SendOtpLoading());

      // ignore: unused_local_variable
      var response = await _apiBase.post(apiEndpoints.sendOTP, data, (data) {
        emit(SendOtpSuccess());

        SnackBarWidget.showSnackbar(context, 'OTP sent successfully!');
      }, (error) {
        emit(SendOtpError(errorMesage: error));
      });
    } catch (e) {
      emit(SendOtpError(errorMesage: e.toString()));
    }
  }
}
