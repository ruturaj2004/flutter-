// verify_otp_state.dart

import 'package:meta/meta.dart';
import 'package:salesman_app/model/verify_otp_model/verify_otp_model.dart'; // Import the meta package

@immutable
abstract class VerifyOtpState {}

class VerifyOtpInitial extends VerifyOtpState {}

class VerifyOtpSuccess extends VerifyOtpState {
  final VerifyOtpResponseModel verifyOtpResponseModel;

  VerifyOtpSuccess(this.verifyOtpResponseModel);
}

class VerifyOtpLoading extends VerifyOtpState {}

class VerifyOtpError extends VerifyOtpState {
  final String? errorMessage;

  VerifyOtpError({ required this.errorMessage});
}

class VerifyOtpUserExists extends VerifyOtpState {}

class VerifyOtpUserNotExists extends VerifyOtpState {
  final String phoneNumber;

  VerifyOtpUserNotExists({required this.phoneNumber});
}

class UserLoggedIn extends VerifyOtpState {}

class UserLoggedOut extends VerifyOtpState {}

class CustomerInfoError extends VerifyOtpState {
  final String message;

  CustomerInfoError(this.message);
}

class CustomerInfoLoading extends VerifyOtpState {}

class CustomerInfoSuccess extends VerifyOtpState {}
