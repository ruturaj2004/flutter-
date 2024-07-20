part of 'verify_otp_logic_cubit.dart';

@immutable
sealed class VerifyOtpLogicState {}

final class VerifyOtpLogicInitial extends VerifyOtpLogicState {}

class VerifyOtpSuccess extends VerifyOtpLogicState {}

class VerifyOtpLoading extends VerifyOtpLogicState {}

class VerifyOtpError extends VerifyOtpLogicState {
  final String? errorMesage;

  VerifyOtpError(this.errorMesage);
}

class VerifyOtpUserExists extends VerifyOtpLogicState {}

class VerifyOtpUserNotExists extends VerifyOtpLogicState {
  final String phoneNumber;
  VerifyOtpUserNotExists({required this.phoneNumber, String? token});
}

class UserLoggedIn extends VerifyOtpLogicState {
  UserLoggedIn();
}

class UserLoggedOut extends VerifyOtpLogicState {}

class CustomerInfoError extends VerifyOtpLogicState {
  final String error;
  CustomerInfoError(this.error);
}

class CustomerInfoLoading extends VerifyOtpLogicState {}

class CustomerInfoSuccess extends VerifyOtpLogicState {}
