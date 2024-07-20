// To parse this JSON data, do
//
//     final updateLocationModel = updateLocationModelFromJson(jsonString);

import 'dart:convert';

UpdateLocationModel updateLocationModelFromJson(String str) => UpdateLocationModel.fromJson(json.decode(str));

String updateLocationModelToJson(UpdateLocationModel data) => json.encode(data.toJson());

class UpdateLocationModel {
    String? message;
    UpdatedTrip? updatedTrip;

    UpdateLocationModel({
        this.message,
        this.updatedTrip,
    });

    factory UpdateLocationModel.fromJson(Map<String, dynamic> json) => UpdateLocationModel(
        message: json["message"],
        updatedTrip: json["updatedTrip"] == null ? null : UpdatedTrip.fromJson(json["updatedTrip"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "updatedTrip": updatedTrip?.toJson(),
    };
}

class UpdatedTrip {
    String? id;
    int? tripId;
    int? groupId;
    int? memberId;
    DateTime? startTime;
    String? from;
    List<double>? fromLatLong;
    List<List<double>>? destinationLatLong;
    List<String>? destination;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    double? distance;

    UpdatedTrip({
        this.id,
        this.tripId,
        this.groupId,
        this.memberId,
        this.startTime,
        this.from,
        this.fromLatLong,
        this.destinationLatLong,
        this.destination,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.distance,
    });

    factory UpdatedTrip.fromJson(Map<String, dynamic> json) => UpdatedTrip(
        id: json["_id"],
        tripId: json["tripId"],
        groupId: json["groupId"],
        memberId: json["memberId"],
        startTime: json["startTime"] == null ? null : DateTime.parse(json["startTime"]),
        from: json["from"],
        fromLatLong: json["fromLatLong"] == null ? [] : List<double>.from(json["fromLatLong"]!.map((x) => x?.toDouble())),
        destinationLatLong: json["destinationLatLong"] == null ? [] : List<List<double>>.from(json["destinationLatLong"]!.map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
        destination: json["destination"] == null ? [] : List<String>.from(json["destination"]!.map((x) => x)),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        distance: json["distance"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "tripId": tripId,
        "groupId": groupId,
        "memberId": memberId,
        "startTime": startTime?.toIso8601String(),
        "from": from,
        "fromLatLong": fromLatLong == null ? [] : List<dynamic>.from(fromLatLong!.map((x) => x)),
        "destinationLatLong": destinationLatLong == null ? [] : List<dynamic>.from(destinationLatLong!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "destination": destination == null ? [] : List<dynamic>.from(destination!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "distance": distance,
    };
}
