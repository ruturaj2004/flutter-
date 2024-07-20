// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetResponse _$GetResponseFromJson(Map<String, dynamic> json) => GetResponse(
      data: json['data'] == null
          ? null
          : Data.fromjson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetResponseToJson(GetResponse instance) =>
    <String, dynamic>{
      'data': instance.data?.tojson(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'name': instance.name,
    };
