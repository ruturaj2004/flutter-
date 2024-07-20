import 'package:baap_trasport_app/main.dart';
import 'package:baap_trasport_app/utils/api/api_base.dart';
import 'package:baap_trasport_app/widgets/snackbar_widget.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'send_otp_state.dart';

class SendOtpCubit extends Cubit<SendOtpState> {
  final ApiBase _apibase = ApiBase();

  SendOtpCubit() : super(SendOtpInitial());

  void sendOtp(String? number, BuildContext context) {
    var data = {
      "phoneNumber": number,
    };
    try {
      emit(SendOtpLoading());

      _apibase.post(apiEndPoints.sendOTP, data, (data) {
        emit(SendOtpSuccess());
        SnackBarWidget.showSnackbar(context, "OTP Send successfully!");
      }, (error) {
        emit(SendOtpError(errorMesage: error));
      });
    } catch (e) {
      emit(
        SendOtpError(errorMesage: e.toString()),
      );
    }
  }
}
