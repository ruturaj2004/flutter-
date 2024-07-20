// To parse this JSON data, do
//
//     final verificationResponseModel = verificationResponseModelFromJson(jsonString);

import 'dart:convert';

VerificationResponseModel verificationResponseModelFromJson(String str) => VerificationResponseModel.fromJson(json.decode(str));

String verificationResponseModelToJson(VerificationResponseModel data) => json.encode(data.toJson());

class VerificationResponseModel {
    String? status;
    Data? data;
    String? message;
    String? token;

    VerificationResponseModel({
        this.status,
        this.data,
        this.message,
        this.token,
    });

    factory VerificationResponseModel.fromJson(Map<String, dynamic> json) => VerificationResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "message": message,
        "token": token,
    };
}

class Data {
    bool? userExists;

    Data({
        this.userExists,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userExists: json["userExists"],
    );

    Map<String, dynamic> toJson() => {
        "userExists": userExists,
    };
}
