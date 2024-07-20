class OrderListResponseModel {
  String? message;
  Data? data;
  int? totalItemsCount;
  int? totalPages;

  OrderListResponseModel({
    this.message,
    this.data,
    this.totalItemsCount,
    this.totalPages,
  });

  factory OrderListResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderListResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        totalItemsCount: json["totalItemsCount"],
        totalPages: json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
        "totalItemsCount": totalItemsCount,
        "totalPages": totalPages,
      };
}

class Data {
  List<OrderData>? items;

  Data({
    this.items,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        items: json["items"] == null
            ? []
            : List<OrderData>.from(
                json["items"]!.map((x) => OrderData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class OrderData {
  String? id;
  int? phoneNumber;
  int? servicerequestId;
  Location? location;
  String? name;
  UserId? userId;
  int? groupId;
  String? status;
  int? serviceResponsesCount;
  int? handledById;
  int? orderId;
  int? totalPrice;
  String? event;
  DateTime? dateTime;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  CategoryId? categoryId;
  SubcategoryId? subcategoryId;
  int? quantity;
  String? source;

  OrderData({
    this.id,
    this.phoneNumber,
    this.servicerequestId,
    this.location,
    this.name,
    this.userId,
    this.groupId,
    this.status,
    this.serviceResponsesCount,
    this.handledById,
    this.orderId,
    this.totalPrice,
    this.event,
    this.dateTime,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.categoryId,
    this.subcategoryId,
    this.quantity,
    this.source,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        id: json["_id"],
        phoneNumber: json["phoneNumber"],
        servicerequestId: json["servicerequestId"],
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        name: json["name"],
        userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
        groupId: json["groupId"],
        status: json["status"],
        serviceResponsesCount: json["serviceResponsesCount"],
        handledById: json["handledById"],
        orderId: json["orderId"],
        totalPrice: json["totalPrice"],
        event: json["event"],
        dateTime:
            json["DateTime"] == null ? null : DateTime.parse(json["DateTime"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        categoryId: json["categoryId"] == null
            ? null
            : CategoryId.fromJson(json["categoryId"]),
        subcategoryId: json["subcategoryId"] == null
            ? null
            : SubcategoryId.fromJson(json["subcategoryId"]),
        quantity: json["quantity"],
        source: json["source"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "phoneNumber": phoneNumber,
        "servicerequestId": servicerequestId,
        "location": location?.toJson(),
        "name": name,
        "userId": userId?.toJson(),
        "groupId": groupId,
        "status": status,
        "serviceResponsesCount": serviceResponsesCount,
        "handledById": handledById,
        "orderId": orderId,
        "totalPrice": totalPrice,
        "event": event,
        "DateTime": dateTime?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "categoryId": categoryId?.toJson(),
        "subcategoryId": subcategoryId?.toJson(),
        "quantity": quantity,
        "source": source,
      };
}

class CategoryId {
  String? categoryId;
  String? name;

  CategoryId({
    this.categoryId,
    this.name,
  });

  factory CategoryId.fromJson(Map<String, dynamic> json) => CategoryId(
        categoryId: json["categoryId"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "name": name,
      };
}

class Location {
  List<double?>? coordinates;
  String? type;

  Location({
    this.coordinates,
    this.type,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        coordinates: json["coordinates"] == null
            ? []
            : List<double?>.from(
                json["coordinates"]!.map((x) => x?.toDouble())),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "coordinates": coordinates == null
            ? []
            : List<dynamic>.from(coordinates!.map((x) => x)),
        "type": type,
      };
}

class SubcategoryId {
  String? name;
  String? subcategoryId;
  String? categoryId;
  String? desc;

  SubcategoryId({
    this.name,
    this.subcategoryId,
    this.categoryId,
    this.desc,
  });

  factory SubcategoryId.fromJson(Map<String, dynamic> json) => SubcategoryId(
        name: json["name"],
        subcategoryId: json["subcategoryId"],
        categoryId: json["categoryId"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "subcategoryId": subcategoryId,
        "categoryId": categoryId,
        "desc": desc,
      };
}

class UserId {
  int? phoneNumber;
  String? name;
  int? userId;
  List<Membership?>? membership;

  UserId({
    this.phoneNumber,
    this.name,
    this.userId,
    this.membership,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        phoneNumber: json["phoneNumber"],
        name: json["name"],
        userId: json["userId"],
        membership: json["membership"] == null
            ? []
            : List<Membership>.from(
                json["membership"]!.map((x) => Membership?.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "name": name,
        "userId": userId,
        "membership": membership == null
            ? []
            : List<dynamic>.from(membership!.map((x) => x?.toJson())),
      };
}

class Membership {
  String? membershipPremium;
  String? startDate;
  String? endDate;
  String? id;
  int? totalRewardsEarned;
  int? smartCardId;
  int? membershipId;
  String? barcodeImageUrl;

  Membership({
    this.membershipPremium,
    this.startDate,
    this.endDate,
    this.id,
    this.totalRewardsEarned,
    this.smartCardId,
    this.membershipId,
    this.barcodeImageUrl,
  });

  factory Membership.fromJson(Map<String, dynamic> json) => Membership(
        membershipPremium: json["membershipPremium"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        id: json["_id"],
        totalRewardsEarned: json["totalRewardsEarned"],
        smartCardId: json["smartCardId"],
        membershipId: json["membershipId"],
        barcodeImageUrl: json["barcodeImageURL"],
      );

  Map<String, dynamic> toJson() => {
        "membershipPremium": membershipPremium,
        "startDate": startDate,
        "endDate": endDate,
        "_id": id,
        "totalRewardsEarned": totalRewardsEarned,
        "smartCardId": smartCardId,
        "membershipId": membershipId,
        "barcodeImageURL": barcodeImageUrl,
      };
}
