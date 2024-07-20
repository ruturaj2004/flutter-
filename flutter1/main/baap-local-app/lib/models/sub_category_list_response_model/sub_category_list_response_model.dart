// To parse this JSON data, do
//
//     final subCategoryListResponseModel = subCategoryListResponseModelFromJson(jsonString);

import 'dart:convert';

SubCategoryListResponseModel subCategoryListResponseModelFromJson(String str) => SubCategoryListResponseModel.fromJson(json.decode(str));

String subCategoryListResponseModelToJson(SubCategoryListResponseModel data) => json.encode(data.toJson());

class SubCategoryListResponseModel {
    String? status;
    Data? data;

    SubCategoryListResponseModel({
        this.status,
        this.data,
    });

    factory SubCategoryListResponseModel.fromJson(Map<String, dynamic> json) => SubCategoryListResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class Data {
    List<SubCategoryListModel>? items;
    int? totalItemsCount;

    Data({
        this.items,
        this.totalItemsCount,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        items: json["items"] == null ? [] : List<SubCategoryListModel>.from(json["items"]!.map((x) => SubCategoryListModel.fromJson(x))),
        totalItemsCount: json["totalItemsCount"],
    );

    Map<String, dynamic> toJson() => {
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
        "totalItemsCount": totalItemsCount,
    };
}

class SubCategoryListModel {
    Location? location;
    String? id;
    String? name;
    int? groupId;
    int? parentServiceId;
    int? subcategoryId;
    int? categoryId;
    List<String>? tags;
    String? desc;
    String? action;
    List<int>? listener;
    String? url;
    String? lat;
    String? lon;
    Theme? theme;
    String? icon;
    String? template;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    SubCategoryListModel({
        this.location,
        this.id,
        this.name,
        this.groupId,
        this.parentServiceId,
        this.subcategoryId,
        this.categoryId,
        this.tags,
        this.desc,
        this.action,
        this.listener,
        this.url,
        this.lat,
        this.lon,
        this.theme,
        this.icon,
        this.template,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory SubCategoryListModel.fromJson(Map<String, dynamic> json) => SubCategoryListModel(
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        id: json["_id"],
        name: json["name"],
        groupId: json["groupId"],
        parentServiceId: json["parentServiceId"],
        subcategoryId: json["subcategoryId"],
        categoryId: json["categoryId"],
        tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
        desc: json["desc"],
        action: json["action"],
        listener: json["listener"] == null ? [] : List<int>.from(json["listener"]!.map((x) => x)),
        url: json["url"],
        lat: json["lat"],
        lon: json["lon"],
        theme: json["theme"] == null ? null : Theme.fromJson(json["theme"]),
        icon: json["icon"],
        template: json["template"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "_id": id,
        "name": name,
        "groupId": groupId,
        "parentServiceId": parentServiceId,
        "subcategoryId": subcategoryId,
        "categoryId": categoryId,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "desc": desc,
        "action": action,
        "listener": listener == null ? [] : List<dynamic>.from(listener!.map((x) => x)),
        "url": url,
        "lat": lat,
        "lon": lon,
        "theme": theme?.toJson(),
        "icon": icon,
        "template": template,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class Location {
    String? type;
    List<dynamic>? coordinates;

    Location({
        this.type,
        this.coordinates,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: json["type"],
        coordinates: json["coordinates"] == null ? [] : List<dynamic>.from(json["coordinates"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => x)),
    };
}

class Theme {
    String? background;
    String? color;
    String? cover;

    Theme({
        this.background,
        this.color,
        this.cover,
    });

    factory Theme.fromJson(Map<String, dynamic> json) => Theme(
        background: json["background"],
        color: json["color"],
        cover: json["cover"],
    );

    Map<String, dynamic> toJson() => {
        "background": background,
        "color": color,
        "cover": cover,
    };
}
