class OrderDetailsResponseModel {
  String? status;
  Data? data;
  int? totalItemsCount;
  int? totalPages;

  OrderDetailsResponseModel({
    this.status,
    this.data,
    this.totalItemsCount,
    this.totalPages,
  });

  factory OrderDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        totalItemsCount: json["totalItemsCount"],
        totalPages: json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "totalItemsCount": totalItemsCount,
        "totalPages": totalPages,
      };
}

class Data {
  List<OrderDetailsModel>? items;

  Data({
    this.items,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        items: json["items"] == null
            ? []
            : List<OrderDetailsModel>.from(
                json["items"]!.map((x) => OrderDetailsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class OrderDetailsModel {
  String? id;
  int? groupId;
  List<OrderDetail>? orderDetails;
  int? orderId;
  String? status;
  String? event;
  UserId? userId;
  int? subtotal;
  int? taxes;
  int? saving;
  int? totalCartPrice;
  int? totalProductQuantity;
  String? currency;
  String? source;
  DeliveryInfo? deliveryInfo;
  PaymentInfo? paymentInfo;
  String? lat;
  String? lon;
  DateTime? orderData;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  OrderDetailsModel({
    this.id,
    this.groupId,
    this.orderDetails,
    this.orderId,
    this.status,
    this.event,
    this.userId,
    this.subtotal,
    this.taxes,
    this.saving,
    this.totalProductQuantity,
    this.totalCartPrice,
    this.currency,
    this.source,
    this.deliveryInfo,
    this.paymentInfo,
    this.lat,
    this.lon,
    this.orderData,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        id: json["_id"],
        groupId: json["groupId"],
        orderDetails: json["orderDetails"] == null
            ? []
            : List<OrderDetail>.from(
                json["orderDetails"]!.map((x) => OrderDetail.fromJson(x))),
        orderId: json["orderId"],
        status: json["status"],
        event: json["event"],
        userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
        subtotal: json["subtotal"],
        saving: json["saving"],
        taxes: json["taxes"],
        totalProductQuantity: json["totalProductQuantity"],
        totalCartPrice: json["totalCartPrice"],
        currency: json["currency"],
        source: json["source"],
        deliveryInfo: json["delivery_info"] == null
            ? null
            : DeliveryInfo.fromJson(json["delivery_info"]),
        paymentInfo: json["paymentInfo"] == null
            ? null
            : PaymentInfo.fromJson(json["paymentInfo"]),
        lat: json["lat"],
        lon: json["lon"],
        orderData: json["orderData"] == null
            ? null
            : DateTime.parse(json["orderData"]),
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
        "groupId": groupId,
        "orderDetails": orderDetails == null
            ? []
            : List<dynamic>.from(orderDetails!.map((x) => x.toJson())),
        "orderId": orderId,
        "status": status,
        "event": event,
        "userId": userId?.toJson(),
        "subtotal": subtotal,
        "saving": saving,
        "taxes": taxes,
        "totalProductQuantity": totalProductQuantity,
        "totalCartPrice": totalCartPrice,
        "currency": currency,
        "source": source,
        "delivery_info": deliveryInfo?.toJson(),
        "paymentInfo": paymentInfo?.toJson(),
        "lat": lat,
        "lon": lon,
        "orderData": orderData?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class DeliveryInfo {
  ShippingAddress? shippingAddress;

  DeliveryInfo({
    this.shippingAddress,
  });

  factory DeliveryInfo.fromJson(Map<String, dynamic> json) => DeliveryInfo(
        shippingAddress: json["shipping_address"] == null
            ? null
            : ShippingAddress.fromJson(json["shipping_address"]),
      );

  Map<String, dynamic> toJson() => {
        "shipping_address": shippingAddress?.toJson(),
      };
}

class ShippingAddress {
  String? street;
  String? locality;
  String? city;
  String? state;
  String? zip;

  ShippingAddress({
    this.street,
    this.locality,
    this.city,
    this.state,
    this.zip,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      ShippingAddress(
        street: json["street"],
        locality: json["locality"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "locality": locality,
        "city": city,
        "state": state,
        "zip": zip,
      };
}

class OrderDetail {
  Product? product;
  int? quantity;
  int? totalProductPrice;

  OrderDetail({
    this.product,
    this.quantity,
    this.totalProductPrice,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
        quantity: json["quantity"],
        totalProductPrice: json["totalProductPrice"],
      );

  Map<String, dynamic> toJson() => {
        "product": product?.toJson(),
        "quantity": quantity,
        "totalProductPrice": totalProductPrice,
      };
}

class Product {
  int? productcode;
  String? name;
  int? buyingPrice;
  int? memberPrice;
  int? regularPrice;
  int? marketPrice;
  int? tax;

  Product({
    this.productcode,
    this.name,
    this.buyingPrice,
    this.memberPrice,
    this.regularPrice,
    this.marketPrice,
    this.tax,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productcode: json["productcode"],
        name: json["name"],
        buyingPrice: json["buyingPrice"],
        memberPrice: json["memberPrice"],
        regularPrice: json["regularPrice"],
        marketPrice: json["marketPrice"],
        tax: json["tax"],
      );

  Map<String, dynamic> toJson() => {
        "productcode": productcode,
        "name": name,
        "buyingPrice": buyingPrice,
        "memberPrice": memberPrice,
        "regularPrice": regularPrice,
        "marketPrice": marketPrice,
        "tax": tax,
      };
}

class PaymentInfo {
  String? mode;
  String? paymentStatus;
  dynamic txnId;

  PaymentInfo({
    this.mode,
    this.paymentStatus,
    this.txnId,
  });

  factory PaymentInfo.fromJson(Map<String, dynamic> json) => PaymentInfo(
        mode: json["mode"],
        paymentStatus: json["paymentStatus"],
        txnId: json["txnId"],
      );

  Map<String, dynamic> toJson() => {
        "mode": mode,
        "paymentStatus": paymentStatus,
        "txnId": txnId,
      };
}

class UserId {
  int? userId;
  int? phoneNumber;
  String? name;
  List<Membership>? membership;

  UserId({
    this.userId,
    this.phoneNumber,
    this.name,
    this.membership,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        userId: json["userId"],
        phoneNumber: json["phoneNumber"],
        name: json["name"],
        membership: json["membership"] == null
            ? []
            : List<Membership>.from(
                json["membership"]!.map((x) => Membership.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "phoneNumber": phoneNumber,
        "name": name,
        "membership": membership == null
            ? []
            : List<dynamic>.from(membership!.map((x) => x.toJson())),
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
