class SendOtpResponseModel {
  String? status;
  int? data;
  String? message;

  SendOtpResponseModel({
    this.status,
    this.data,
    this.message,
  });

  factory SendOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      SendOtpResponseModel(
        status: json["status"],
        data: json["data"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data,
        "message": message,
      };
}
