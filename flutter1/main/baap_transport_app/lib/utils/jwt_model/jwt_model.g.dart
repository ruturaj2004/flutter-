// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JwtTokeResponseModel _$JwtTokeResponseModelFromJson(
        Map<String, dynamic> json) =>
    JwtTokeResponseModel(
      name: json['name'] as String?,
      userId: (json['userId'] as num?)?.toInt(),
      phoneNumber: json['phoneNumber'] as String?,
      role: json['role'] == null
          ? null
          : Role.fromJson(json['role'] as Map<String, dynamic>),
      iat: (json['iat'] as num?)?.toInt(),
      exp: (json['exp'] as num?)?.toInt(),
    );

Map<String, dynamic> _$JwtTokeResponseModelToJson(
        JwtTokeResponseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'userId': instance.userId,
      'phoneNumber': instance.phoneNumber,
      'role': instance.role?.toJson(),
      'iat': instance.iat,
      'exp': instance.exp,
    };

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
      roleId: (json['roleId'] as num?)?.toInt(),
      name: json['name'] as String?,
      permissions: (json['permissions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'roleId': instance.roleId,
      'name': instance.name,
      'permissions': instance.permissions,
    };
