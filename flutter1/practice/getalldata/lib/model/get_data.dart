import 'package:json_annotation/json_annotation.dart';

part 'get_data.g.dart';

@JsonSerializable(explicitToJson: true)
class GetResponse {
  Data? data;
  GetResponse({this.data});
  factory GetResponse.fromjson(Map<String, dynamic> json) =>
      _$GetResponseFromJson(json);
  Map<String, dynamic> tojson() => _$GetResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
List<Items>?items;
  Data({this.items});
  factory Data.fromjson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> tojson() => _$DataToJson(this);
}

// @JsonSerializable(explicitToJson: true)
// class GetResponse {
// Data? data;
// GetResponse({this.data});
// factory GetResponse.fromjson(Map<String,dynamic>json)=>_$GetResponseFromJson(json);
// Map<String,dynamic>json()=>_$GetResponseToJson(this);
// }

// @JsonSerializable(explicitToJson: true)
// class Data {
//   String?name ;
//   Data({this.name});
//   factory Data.fromjson(Map<String,dynamic>json)=>_$DataFromJson(json);
//   Map<String,dynamic>json()=>_$DataToJson(this);
// }


// class GetData{
// Data? data;
// GetData({this.data});
// factory GetData.fromjson(Map<String,dynamic>json)=>_$GetDataFromJson(json);
// Map<String,dynamic>json()=>_$GetDataToJson(this);
// }


// class Data{
//   Data?name;
//   Data({this.name});
//   factory Data.fromjson(Map<String,dynamic>json)=>_$DataFromJson(json);
//   Map<String,dynamic>json()=>_$DataToJson(this);

// }