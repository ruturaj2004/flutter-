// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendOtpResponse _$SendOtpResponseFromJson(Map<String, dynamic> json) =>
    SendOtpResponse(
      status: json['status'] as String,
      data: (json['data'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$SendOtpResponseToJson(SendOtpResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
