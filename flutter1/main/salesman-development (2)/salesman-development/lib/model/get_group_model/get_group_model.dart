class GetGroupsModel {
  String? message;
  List<Datum>? data;
  int? totalItemsCount;
  int? page;
  int? size;

  GetGroupsModel({
    this.message,
    this.data,
    this.totalItemsCount,
    this.page,
    this.size,
  });

  factory GetGroupsModel.fromJson(Map<String, dynamic> json) => GetGroupsModel(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        totalItemsCount: json["totalItemsCount"],
        page: json["page"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "totalItemsCount": totalItemsCount,
        "page": page,
        "size": size,
      };
}

class Datum {
  String? id;
  int? userGroupId;
  GroupId? groupId;
  User? user;
  Role? role;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.id,
    this.userGroupId,
    this.groupId,
    this.user,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        userGroupId: json["user_group_id"],
        groupId:
            json["groupId"] == null ? null : GroupId.fromJson(json["groupId"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        role: json["role"] == null ? null : Role.fromJson(json["role"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user_group_id": userGroupId,
        "groupId": groupId?.toJson(),
        "user": user?.toJson(),
        "role": role?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class GroupId {
  String? id;
  int? groupId;
  String? name;
  String? type;
  String? shortName;
  String? logoUrl;
  String? mobileLogoUrl;

  GroupId({
    this.id,
    this.groupId,
    this.name,
    this.type,
    this.shortName,
    this.logoUrl,
    this.mobileLogoUrl,
  });

  factory GroupId.fromJson(Map<String, dynamic> json) => GroupId(
        id: json["_id"],
        groupId: json["groupId"],
        name: json["name"],
        type: json["type"],
        shortName: json["shortName"],
        logoUrl: json["logo_url"],
        mobileLogoUrl: json["mobile_logo_url"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "groupId": groupId,
        "name": name,
        "type": type,
        "shortName": shortName,
        "logo_url": logoUrl,
        "mobile_logo_url": mobileLogoUrl,
      };
}

class Role {
  int? roleId;
  String? name;
  String? code;

  Role({
    this.roleId,
    this.name,
    this.code,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        roleId: json["roleId"],
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "roleId": roleId,
        "name": name,
        "code": code,
      };
}

class User {
  String? id;
  int? userId;
  String? name;
  String? email;
  String? phoneNumber;

  User({
    this.id,
    this.userId,
    this.name,
    this.email,
    this.phoneNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        userId: json["userId"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
      };
}
