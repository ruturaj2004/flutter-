// To parse this JSON data, do
//
//     final getDurationModel = getDurationModelFromJson(jsonString);

import 'dart:convert';

GetDurationModel getDurationModelFromJson(String str) =>
    GetDurationModel.fromJson(json.decode(str));

String getDurationModelToJson(GetDurationModel data) =>
    json.encode(data.toJson());

class GetDurationModel {
  String? tripId;
  String? groupId;
  DateTime? endTime;
  Duration? duration;

  GetDurationModel({
    this.tripId,
    this.groupId,
    this.endTime,
    this.duration,
  });

  factory GetDurationModel.fromJson(Map<String, dynamic> json) =>
      GetDurationModel(
        tripId: json["tripId"],
        groupId: json["groupId"],
        endTime:
            json["endTime"] == null ? null : DateTime.parse(json["endTime"]),
        duration: json["duration"] == null
            ? null
            : Duration.fromJson(json["duration"]),
      );

  Map<String, dynamic> toJson() => {
        "tripId": tripId,
        "groupId": groupId,
        "endTime": endTime?.toIso8601String(),
        "duration": duration?.toJson(),
      };
}

class Duration {
  int? hours;
  int? minutes;
  int? seconds;

  Duration({
    this.hours,
    this.minutes,
    this.seconds,
  });

  factory Duration.fromJson(Map<String, dynamic> json) => Duration(
        hours: json["hours"],
        minutes: json["minutes"],
        seconds: json["seconds"],
      );

  Map<String, dynamic> toJson() => {
        "hours": hours,
        "minutes": minutes,
        "seconds": seconds,
      };
}
