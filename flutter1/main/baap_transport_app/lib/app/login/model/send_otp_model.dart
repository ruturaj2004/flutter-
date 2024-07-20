import 'package:json_annotation/json_annotation.dart';

part 'send_otp_model.g.dart';

 
@JsonSerializable(explicitToJson: true)
class SendOtpResponse {
  final String status;
  final int data;
  final String message;

  SendOtpResponse({
    required this.status,
    required this.data,
    required this.message,
  });

 
  factory SendOtpResponse.fromJson(Map<String, dynamic> json) => _$SendOtpResponseFromJson(json);
 
  Map<String, dynamic> toJson() => _$SendOtpResponseToJson(this);
}
