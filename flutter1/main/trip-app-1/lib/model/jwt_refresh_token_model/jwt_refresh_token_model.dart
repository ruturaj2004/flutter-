// To parse this JSON data, do
//
//     final jwtRefreshToken = jwtRefreshTokenFromJson(jsonString);

import 'dart:convert';

JwtRefreshToken jwtRefreshTokenFromJson(String str) => JwtRefreshToken.fromJson(json.decode(str));

String jwtRefreshTokenToJson(JwtRefreshToken data) => json.encode(data.toJson());

class JwtRefreshToken {
    String? status;
    String? message;
    Data? data;
    String? token;

    JwtRefreshToken({
        this.status,
        this.message,
        this.data,
        this.token,
    });

    factory JwtRefreshToken.fromJson(Map<String, dynamic> json) => JwtRefreshToken(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
        "token": token,
    };
}

class Data {
    bool? userExists;
    bool? customerExists;
    bool? memberExists;

    Data({
        this.userExists,
        this.customerExists,
        this.memberExists,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userExists: json["userExists"],
        customerExists: json["customerExists"],
        memberExists: json["memberExists"],
    );

    Map<String, dynamic> toJson() => {
        "userExists": userExists,
        "customerExists": customerExists,
        "memberExists": memberExists,
    };
}
