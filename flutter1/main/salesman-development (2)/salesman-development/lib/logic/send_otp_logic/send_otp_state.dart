part of 'send_otp_cubit.dart';

@immutable
sealed class SendOtpState {}

final class SendOtpInitial extends SendOtpState {}

final class SendOtpLoaded extends SendOtpState {}

final class SendOtpLoading extends SendOtpState {}

final class SendOtpSuccess extends SendOtpState {
  // final SendOtpResponseModel sendOtpResponseModel;

  // SendOtpSuccess({required this.sendOtpResponseModel});
}

final class SendOtpError extends SendOtpState {
  final String? errorMesage;

  SendOtpError({required this.errorMesage});
}

