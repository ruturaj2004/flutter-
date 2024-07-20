// To parse this JSON data, do
//
//     final startTripModel = startTripModelFromJson(jsonString);

import 'dart:convert';

StartTripModel startTripModelFromJson(String str) => StartTripModel.fromJson(json.decode(str));

String startTripModelToJson(StartTripModel data) => json.encode(data.toJson());

class StartTripModel {
    String? message;
    NewTrip? newTrip;

    StartTripModel({
        this.message,
        this.newTrip,
    });

    factory StartTripModel.fromJson(Map<String, dynamic> json) => StartTripModel(
        message: json["message"],
        newTrip: json["newTrip"] == null ? null : NewTrip.fromJson(json["newTrip"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "newTrip": newTrip?.toJson(),
    };
}

class NewTrip {
    int? tripId;
    int? groupId;
    int? memberId;
    DateTime? startTime;
    String? from;
    List<double>? fromLatLong;
    List<dynamic>? destinationLatLong;
    List<String>? destination;
    String? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    NewTrip({
        this.tripId,
        this.groupId,
        this.memberId,
        this.startTime,
        this.from,
        this.fromLatLong,
        this.destinationLatLong,
        this.destination,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory NewTrip.fromJson(Map<String, dynamic> json) => NewTrip(
        tripId: json["tripId"],
        groupId: json["groupId"],
        memberId: json["memberId"],
        startTime: json["startTime"] == null ? null : DateTime.parse(json["startTime"]),
        from: json["from"],
        fromLatLong: json["fromLatLong"] == null ? [] : List<double>.from(json["fromLatLong"]!.map((x) => x?.toDouble())),
        destinationLatLong: json["destinationLatLong"] == null ? [] : List<dynamic>.from(json["destinationLatLong"]!.map((x) => x)),
        destination: json["destination"] == null ? [] : List<String>.from(json["destination"]!.map((x) => x)),
        id: json["_id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "tripId": tripId,
        "groupId": groupId,
        "memberId": memberId,
        "startTime": startTime?.toIso8601String(),
        "from": from,
        "fromLatLong": fromLatLong == null ? [] : List<dynamic>.from(fromLatLong!.map((x) => x)),
        "destinationLatLong": destinationLatLong == null ? [] : List<dynamic>.from(destinationLatLong!.map((x) => x)),
        "destination": destination == null ? [] : List<dynamic>.from(destination!.map((x) => x)),
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}
