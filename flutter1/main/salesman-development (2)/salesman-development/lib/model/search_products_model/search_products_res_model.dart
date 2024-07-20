class SearchProductsModel {
  String? status;
  Data? data;

  SearchProductsModel({
    this.status,
    this.data,
  });

  factory SearchProductsModel.fromJson(Map<String, dynamic> json) =>
      SearchProductsModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  List<searchProducts>? searchproducts;
  int? totalItemsCount;

  Data({
    this.searchproducts,
    this.totalItemsCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        searchproducts: json["items"] == null
            ? []
            : List<searchProducts>.from(
                json["items"]!.map((x) => searchProducts.fromJson(x))),
        totalItemsCount: json["totalItemsCount"],
      );

  Map<String, dynamic> toJson() => {
        "items": searchproducts == null
            ? []
            : List<dynamic>.from(searchproducts!.map((x) => x.toJson())),
        "totalItemsCount": totalItemsCount,
      };
}

class searchProducts {
  String? id;
  String? name;
  int? groupId;
  int? categoryId;
  int? subcategoryId;
  List<String>? tags;
  int? productcode;
  String? model;
  int? serialNumber;
  Value? value;
  List<String>? pictures;
  String? productSlug;
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
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  bool? isOffinePayment;
  bool? isOnlinePayment;
  int? parentId;
  int? cgst;
  int? gst;
  int? hsnNo;
  int? igst;
  bool? isPaymentOffline;
  bool? isPaymentOnline;
  int? sgst;
  int? skuNumber;

  searchProducts({
    this.id,
    this.name,
    this.groupId,
    this.categoryId,
    this.subcategoryId,
    this.tags,
    this.productcode,
    this.model,
    this.serialNumber,
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
    this.isOffinePayment,
    this.isOnlinePayment,
    this.parentId,
    this.cgst,
    this.gst,
    this.hsnNo,
    this.igst,
    this.isPaymentOffline,
    this.isPaymentOnline,
    this.sgst,
    this.skuNumber,
  });

  factory searchProducts.fromJson(Map<String, dynamic> json) => searchProducts(
        id: json["_id"],
        name: json["name"],
        groupId: json["groupId"],
        categoryId: json["categoryId"],
        subcategoryId: json["subcategoryId"],
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        productcode: json["productcode"],
        model: json["model"],
        serialNumber: json["serialNumber"],
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
            : List<String>.from(json["characteristics"]!.map((x) => x)),
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
        isOffinePayment: json["isOffinePayment"],
        isOnlinePayment: json["isOnlinePayment"],
        parentId: json["parentId"],
        cgst: json["cgst"],
        gst: json["gst"],
        hsnNo: json["hsnNo"],
        igst: json["igst"],
        isPaymentOffline: json["isPaymentOffline"],
        isPaymentOnline: json["isPaymentOnline"],
        sgst: json["sgst"],
        skuNumber: json["skuNumber"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "groupId": groupId,
        "categoryId": categoryId,
        "subcategoryId": subcategoryId,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "productcode": productcode,
        "model": model,
        "serialNumber": serialNumber,
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
        "isOffinePayment": isOffinePayment,
        "isOnlinePayment": isOnlinePayment,
        "parentId": parentId,
        "cgst": cgst,
        "gst": gst,
        "hsnNo": hsnNo,
        "igst": igst,
        "isPaymentOffline": isPaymentOffline,
        "isPaymentOnline": isPaymentOnline,
        "sgst": sgst,
        "skuNumber": skuNumber,
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

  PriceList({
    this.buyingPrice,
    this.memberPrice,
    this.regularPrice,
    this.marketPrice,
    this.color,
    this.varierty,
    this.company,
    this.description,
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
