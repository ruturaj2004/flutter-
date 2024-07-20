class AddProductModel {
  String? status;
  Data? data;

  AddProductModel({
    this.status,
    this.data,
  });

  factory AddProductModel.fromJson(Map<String, dynamic> json) =>
      AddProductModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  String? name;
  int? groupId;
  int? categoryId;
  List<String>? tags;
  int? productcode;
  String? model;
  int? serialNumber;
  bool? isPaymentOffline;
  bool? isPaymentOnline;
  int? gst;
  int? igst;
  int? cgst;
  int? sgst;
  int? hsnNo;
  String? id;
  int? bussinesId;
  int? parentId;
  Value? value;
  List<String>? pictures;
  String? productSlug;
  int? buyingPrice;
  int? memberPrice;
  int? regularPrice;
  int? marketPrice;
  List<dynamic>? characteristics;
  String? category;
  String? subCategory;
  int? rating;
  List<RatingsReview>? ratingsReview;
  List<Variant>? variants;
  List<PriceList>? priceList;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.name,
    this.groupId,
    this.categoryId,
    this.tags,
    this.productcode,
    this.model,
    this.serialNumber,
    this.isPaymentOffline,
    this.isPaymentOnline,
    this.gst,
    this.igst,
    this.cgst,
    this.sgst,
    this.hsnNo,
    this.id,
    this.bussinesId,
    this.parentId,
    this.value,
    this.pictures,
    this.productSlug,
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
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        groupId: json["groupId"],
        categoryId: json["categoryId"],
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        productcode: json["productcode"],
        model: json["model"],
        serialNumber: json["serialNumber"],
        isPaymentOffline: json["isPaymentOffline"],
        isPaymentOnline: json["isPaymentOnline"],
        gst: json["gst"],
        igst: json["igst"],
        cgst: json["cgst"],
        sgst: json["sgst"],
        hsnNo: json["hsnNo"],
        id: json["_id"],
        bussinesId: json["bussinesId"],
        parentId: json["parentId"],
        value: json["value"] == null ? null : Value.fromJson(json["value"]),
        pictures: json["pictures"] == null
            ? []
            : List<String>.from(json["pictures"]!.map((x) => x)),
        productSlug: json["productSlug"],
        buyingPrice: json["buyingPrice"],
        memberPrice: json["memberPrice"],
        regularPrice: json["regularPrice"],
        marketPrice: json["marketPrice"],
        characteristics: json["characteristics"] == null
            ? []
            : List<dynamic>.from(json["characteristics"]!.map((x) => x)),
        category: json["category"],
        subCategory: json["subCategory"],
        rating: json["rating"],
        ratingsReview: json["ratingsReview"] == null
            ? []
            : List<RatingsReview>.from(
                json["ratingsReview"]!.map((x) => RatingsReview.fromJson(x))),
        variants: json["variants"] == null
            ? []
            : List<Variant>.from(
                json["variants"]!.map((x) => Variant.fromJson(x))),
        priceList: json["priceList"] == null
            ? []
            : List<PriceList>.from(
                json["priceList"]!.map((x) => PriceList.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "groupId": groupId,
        "categoryId": categoryId,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "productcode": productcode,
        "model": model,
        "serialNumber": serialNumber,
        "isPaymentOffline": isPaymentOffline,
        "isPaymentOnline": isPaymentOnline,
        "gst": gst,
        "igst": igst,
        "cgst": cgst,
        "sgst": sgst,
        "hsnNo": hsnNo,
        "_id": id,
        "bussinesId": bussinesId,
        "parentId": parentId,
        "value": value?.toJson(),
        "pictures":
            pictures == null ? [] : List<dynamic>.from(pictures!.map((x) => x)),
        "productSlug": productSlug,
        "buyingPrice": buyingPrice,
        "memberPrice": memberPrice,
        "regularPrice": regularPrice,
        "marketPrice": marketPrice,
        "characteristics": characteristics == null
            ? []
            : List<dynamic>.from(characteristics!.map((x) => x)),
        "category": category,
        "subCategory": subCategory,
        "rating": rating,
        "ratingsReview": ratingsReview == null
            ? []
            : List<dynamic>.from(ratingsReview!.map((x) => x.toJson())),
        "variants": variants == null
            ? []
            : List<dynamic>.from(variants!.map((x) => x.toJson())),
        "priceList": priceList == null
            ? []
            : List<dynamic>.from(priceList!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class PriceList {
  String? model;
  int? buyingPrice;
  int? memberPrice;
  int? regularPrice;
  int? marketPrice;
  List<dynamic>? characteristics;
  String? company;
  String? description;

  PriceList({
    this.model,
    this.buyingPrice,
    this.memberPrice,
    this.regularPrice,
    this.marketPrice,
    this.characteristics,
    this.company,
    this.description,
  });

  factory PriceList.fromJson(Map<String, dynamic> json) => PriceList(
        model: json["model"],
        buyingPrice: json["buyingPrice"],
        memberPrice: json["memberPrice"],
        regularPrice: json["regularPrice"],
        marketPrice: json["marketPrice"],
        characteristics: json["characteristics"] == null
            ? []
            : List<dynamic>.from(json["characteristics"]!.map((x) => x)),
        company: json["Company"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "buyingPrice": buyingPrice,
        "memberPrice": memberPrice,
        "regularPrice": regularPrice,
        "marketPrice": marketPrice,
        "characteristics": characteristics == null
            ? []
            : List<dynamic>.from(characteristics!.map((x) => x)),
        "Company": company,
        "description": description,
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

  Value({
    this.description,
  });

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
      };
}

class Variant {
  List<String>? color;
  List<String>? weight;

  Variant({
    this.color,
    this.weight,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        color: json["Color"] == null
            ? []
            : List<String>.from(json["Color"]!.map((x) => x)),
        weight: json["weight"] == null
            ? []
            : List<String>.from(json["weight"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Color": color == null ? [] : List<dynamic>.from(color!.map((x) => x)),
        "weight":
            weight == null ? [] : List<dynamic>.from(weight!.map((x) => x)),
      };
}
