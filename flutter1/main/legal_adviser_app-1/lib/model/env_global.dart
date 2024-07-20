import 'dart:convert';

ApiBaseUrlModel apiBaseUrlModelFromJson(String str) =>
    ApiBaseUrlModel.fromJson(json.decode(str));

class ApiBaseUrlModel {
  int? groupId;
  int? roleId;
  String? baseUrl;
  String? gatewayUrl;
  String? authBaseUrl;
  String? peopleMngtUrl;
  String? imageUploadBaseUrl;
  String? paymentGateway;

  ApiBaseUrlModel({
    this.groupId,
    this.roleId,
    this.baseUrl,
    this.gatewayUrl,
    this.authBaseUrl,
    this.peopleMngtUrl,
    this.imageUploadBaseUrl,
    this.paymentGateway,
  });

  factory ApiBaseUrlModel.fromJson(Map<String, dynamic> json) =>
      ApiBaseUrlModel(
        groupId: json["groupId"],
        roleId: json["roleId"],
        baseUrl: json["baseUrl"],
        gatewayUrl: json["gatewayUrl"],
        authBaseUrl: json["authBaseUrl"],
        peopleMngtUrl: json["peopleMngtUrl"],
        imageUploadBaseUrl: json["imageUploadBaseUrl"],
        paymentGateway: json["paymentGateway"],
      );
}
