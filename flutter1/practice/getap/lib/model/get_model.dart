import 'package:json_annotation/json_annotation.dart';
part 'get_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetResponse{
Data? data;
GetResponse({this.data});
factory GetResponse.fromjson(Map<String,dynamic>json)=>_$GetResponseFromJson(json);
Map<String,dynamic>tojson()=>_$GetResponseToJson(this);

}

@JsonSerializable(explicitToJson: true)
class Data{
  String?name;
  Data({this.name});
  factory Data.fromjson(Map<String,dynamic>json)=>_$DataFromJson(json);
  Map<String,dynamic>tojson()=>_$DataToJson(this);
}