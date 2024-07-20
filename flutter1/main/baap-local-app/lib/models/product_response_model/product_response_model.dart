
class ProductListResponseModel {
  String? status;
  Data? data;

  ProductListResponseModel({
    this.status,
    this.data,
  });

  factory ProductListResponseModel.fromJson(Map<String, dynamic> json) => ProductListResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  List<ProductList>? items;
  int? totalItemsCount;

  Data({
    this.items,
    this.totalItemsCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        items: json["items"] == null ? [] : List<ProductList>.from(json["items"]!.map((x) => ProductList.fromJson(x))),
        totalItemsCount: json["totalItemsCount"],
      );

  Map<String, dynamic> toJson() => {
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
        "totalItemsCount": totalItemsCount,
      };
}

class ProductList {
  String? id;
  String? name;
  int? groupId;
  int? categoryId;
  int? subcategoryId;
  List<String>? tags;
  Value? value;
  List<String>? pictures;
  String? productSlug;
  int? serialNumber;
  String? model;
  int? buyingPrice;
  int? memberPrice;
  int? regularPrice;
  int? marketPrice;
  List<String>? characteristics;
  String? category;
  String? subCategory;
  int? rating;
  List<RatingsReview>? ratingsReview;
  List<Variant>? variants;
  List<PriceList>? priceList;
  int? productcode;
  int? v;
  String? icon;
  bool? isOffinePayment;
  bool? isPaymentOffline;
  bool? isPaymentOnline;
  bool? isOnlinePayment;
  int? parentId;
  int? gst;
  dynamic igst;
  int? sgst;
  int? cgst;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductList({
    this.id,
    this.name,
    this.groupId,
    this.categoryId,
    this.subcategoryId,
    this.tags,
    this.value,
    this.pictures,
    this.productSlug,
    this.serialNumber,
    this.model,
    this.buyingPrice,
    this.memberPrice,
    this.regularPrice,
    this.marketPrice,
    this.characteristics,
    this.category,
    this.subCategory,
    this.rating,
    this.ratingsReview,
    this.variants,
    this.priceList,
    this.productcode,
    this.v,
    this.icon,
    this.isOffinePayment,
    this.isOnlinePayment,
    this.isPaymentOffline,
    this.isPaymentOnline,
    this.parentId,
    this.gst,
    this.igst,
    this.sgst,
    this.cgst,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        id: json["_id"],
        name: json["name"],
        groupId: json["groupId"],
        categoryId: json["categoryId"],
        subcategoryId: json["subcategoryId"],
        tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
        value: json["value"] == null ? null : Value.fromJson(json["value"]),
        pictures: json["pictures"] == null ? [] : List<String>.from(json["pictures"]!.map((x) => x)),
        productSlug: json["productSlug"],
        serialNumber: json["serialNumber"],
        model: json["model"],
        buyingPrice: json["buyingPrice"],
        memberPrice: json["memberPrice"],
        regularPrice: json["regularPrice"],
        marketPrice: json["marketPrice"],
        characteristics: json["characteristics"] == null ? [] : List<String>.from(json["characteristics"]!.map((x) => x)),
        category: json["category"],
        subCategory: json["subCategory"],
        rating: json["rating"],
        ratingsReview: json["ratingsReview"] == null ? [] : List<RatingsReview>.from(json["ratingsReview"]!.map((x) => RatingsReview.fromJson(x))),
        variants: json["variants"] == null ? [] : List<Variant>.from(json["variants"]!.map((x) => Variant.fromJson(x))),
        priceList: json["priceList"] == null ? [] : List<PriceList>.from(json["priceList"]!.map((x) => PriceList.fromJson(x))),
        productcode: json["productcode"],
        v: json["__v"],
        isOffinePayment: json["isOffinePayment"],
        isOnlinePayment: json["isOnlinePayment"],
        isPaymentOffline: json["isPaymentOffline"],
        isPaymentOnline: json["isPaymentOnline"],
        parentId: json["parentId"],
        gst: json["gst"],
        igst: json["igst"],
        sgst: json["sgst"],
        cgst: json["cgst"],
        icon: json["icon"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "groupId": groupId,
        "categoryId": categoryId,
        "subcategoryId": subcategoryId,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "value": value?.toJson(),
        "pictures": pictures == null ? [] : List<dynamic>.from(pictures!.map((x) => x)),
        "productSlug": productSlug,
        "serialNumber": serialNumber,
        "model": model,
        "buyingPrice": buyingPrice,
        "memberPrice": memberPrice,
        "regularPrice": regularPrice,
        "marketPrice": marketPrice,
        "characteristics": characteristics == null ? [] : List<dynamic>.from(characteristics!.map((x) => x)),
        "category": category,
        "subCategory": subCategory,
        "rating": rating,
        "ratingsReview": ratingsReview == null ? [] : List<dynamic>.from(ratingsReview!.map((x) => x.toJson())),
        "variants": variants == null ? [] : List<dynamic>.from(variants!.map((x) => x.toJson())),
        "priceList": priceList == null ? [] : List<dynamic>.from(priceList!.map((x) => x.toJson())),
        "productcode": productcode,
        "__v": v,
        "isPaymentOffline": isPaymentOffline,
        "isPaymentOnline": isPaymentOnline,
        "isOffinePayment": isOffinePayment,
        "isOnlinePayment": isOnlinePayment,
        "parentId": parentId,
        "gst": gst,
        "igst": igst,
        "sgst": sgst,
        "cgst": cgst,
        "icon": icon,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class PriceList {
  int? buyingPrice;
  int? memberPrice;
  int? regularPrice;
  int? marketPrice;
  String? color;
  String? varierty;
  String? company;
  String? description;
  String? size;
  String? seedType;
  String? model;

  PriceList({
    this.buyingPrice,
    this.memberPrice,
    this.regularPrice,
    this.marketPrice,
    this.color,
    this.varierty,
    this.company,
    this.description,
    this.size,
    this.seedType,
    this.model,
  });

  factory PriceList.fromJson(Map<String, dynamic> json) => PriceList(
        buyingPrice: json["buyingPrice"],
        memberPrice: json["memberPrice"],
        regularPrice: json["regularPrice"],
        marketPrice: json["marketPrice"],
        color: json["Color"],
        varierty: json["Varierty"],
        company: json["Company"],
        description: json["description"],
        size: json["Size"],
        seedType: json["Seed type"],
        model: json["model"],
      );

  Map<String, dynamic> toJson() => {
        "buyingPrice": buyingPrice,
        "memberPrice": memberPrice,
        "regularPrice": regularPrice,
        "marketPrice": marketPrice,
        "Color": color,
        "Varierty": varierty,
        "Company": company,
        "description": description,
        "Size": size,
        "Seed type": seedType,
        "model": model,
      };
}

class RatingsReview {
  int? rating;
  String? review;

  RatingsReview({
    this.rating,
    this.review,
  });

  factory RatingsReview.fromJson(Map<String, dynamic> json) => RatingsReview(
        rating: json["rating"],
        review: json["review"],
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "review": review,
      };
}

class Value {
  String? description;
  String? termsAndConditions;

  Value({
    this.description,
    this.termsAndConditions,
  });

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        description: json["description"],
        termsAndConditions: json["termsAndConditions"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "termsAndConditions": termsAndConditions,
      };
}

class Variant {
  List<String>? color;
  List<String>? size;
  List<String>? seedType;
  List<String>? weight;

  Variant({
    this.color,
    this.size,
    this.seedType,
    this.weight,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        color: json["Color"] == null ? [] : List<String>.from(json["Color"]!.map((x) => x)),
        weight: json["weight"] == null ? [] : List<String>.from(json["weight"]!.map((x) => x)),
        size: json["Size"] == null ? [] : List<String>.from(json["Size"]!.map((x) => x)),
        seedType: json["Seed type"] == null ? [] : List<String>.from(json["Seed type"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Color": color == null ? [] : List<dynamic>.from(color!.map((x) => x)),
        "Size": size == null ? [] : List<dynamic>.from(size!.map((x) => x)),
        "Seed type":seedType == null ? [] : List<dynamic>.from(seedType!.map((x) => x)),
        "weight": weight == null ? [] : List<dynamic>.from(weight!.map((x) => x)),
      };
}