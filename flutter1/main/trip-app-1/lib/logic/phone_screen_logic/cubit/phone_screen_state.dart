part of 'phone_screen_cubit.dart';

@immutable
sealed class PhoneScreenState {}

final class PhoneScreenInitial extends PhoneScreenState {}

class SendOtpError extends PhoneScreenState {
  final String? errorMesage;
  SendOtpError(this.errorMesage);
}

class SendOtpLoading extends PhoneScreenState {}

class SendOtpSuccess extends PhoneScreenState {}

// class VerifyOtpInitial extends PhoneScreenState {}

// class VerifyOtpSuccess extends PhoneScreenState {}

// class VerifyOtpLoading extends PhoneScreenState {}

class VerifyOtpError extends PhoneScreenState {
  final String? errorMesage;

  VerifyOtpError(this.errorMesage);
}
