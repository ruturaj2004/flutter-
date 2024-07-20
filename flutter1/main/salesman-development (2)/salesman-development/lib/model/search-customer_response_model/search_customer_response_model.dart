class SearchCustomerResponseModel {
    String? status;
    Data? data;
    int? totalItemsCount;
    int? totalPages;

    SearchCustomerResponseModel({
        this.status,
        this.data,
        this.totalItemsCount,
        this.totalPages,
    });

    factory SearchCustomerResponseModel.fromJson(Map<String, dynamic> json) => SearchCustomerResponseModel(
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
    List<searchedItem>? searcheditem;

    Data({
        this.searcheditem,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        searcheditem: json["items"] == null ? [] : List<searchedItem>.from(json["items"]!.map((x) => searchedItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        // ignore: unnecessary_null_comparison
        "items": searchedItem == null ? [] : List<dynamic>.from(searcheditem!.map((x) => x.toJson())),
    };
}

class searchedItem {
    String? id;
    int? groupId;
    int? phoneNumber;
    int? custId;
    int? userId;
    List<AccountDetail>? accountDetails;
    List<AddressElement>? addresses;
    String? panCard;
    String? aadharNumber;
    String? name;
    String? location;
    dynamic pinCode;
    String? email;
    int? roleId;
    String? password;
    String? source;
    double? latitude;
    double? longitude;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    int? serviceCount;
    int? orderCount;
    String? gender;

    searchedItem({
        this.id,
        this.groupId,
        this.phoneNumber,
        this.custId,
        this.userId,
        this.accountDetails,
        this.addresses,
        this.panCard,
        this.aadharNumber,
        this.name,
        this.location,
        this.pinCode,
        this.email,
        this.roleId,
        this.password,
        this.source,
        this.latitude,
        this.longitude,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.serviceCount,
        this.orderCount,
        this.gender,
    });

    factory searchedItem.fromJson(Map<String, dynamic> json) => searchedItem(
        id: json["_id"],
        groupId: json["groupId"],
        phoneNumber: json["phoneNumber"],
        custId: json["custId"],
        userId: json["userId"],
        accountDetails: json["accountDetails"] == null ? [] : List<AccountDetail>.from(json["accountDetails"]!.map((x) => AccountDetail.fromJson(x))),
        addresses: json["addresses"] == null ? [] : List<AddressElement>.from(json["addresses"]!.map((x) => AddressElement.fromJson(x))),
        panCard: json["panCard"],
        aadharNumber: json["aadharNumber"],
        name: json["name"],
        location: json["location"],
        pinCode: json["pinCode"],
        email: json["email"],
        roleId: json["roleId"],
        password: json["password"],
        source: json["source"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        serviceCount: json["serviceCount"],
        orderCount: json["orderCount"],
        gender: json["gender"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "groupId": groupId,
        "phoneNumber": phoneNumber,
        "custId": custId,
        "userId": userId,
        "accountDetails": accountDetails == null ? [] : List<dynamic>.from(accountDetails!.map((x) => x.toJson())),
        "addresses": addresses == null ? [] : List<dynamic>.from(addresses!.map((x) => x.toJson())),
        "panCard": panCard,
        "aadharNumber": aadharNumber,
        "name": name,
        "location": location,
        "pinCode": pinCode,
        "email": email,
        "roleId": roleId,
        "password": password,
        "source": source,
        "latitude": latitude,
        "longitude": longitude,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "serviceCount": serviceCount,
        "orderCount": orderCount,
        "gender": gender,
    };
}

class AccountDetail {
    String? id;
    int? accountId;
    AccountDetailAccountDetails? accountDetails;

    AccountDetail({
        this.id,
        this.accountId,
        this.accountDetails,
    });

    factory AccountDetail.fromJson(Map<String, dynamic> json) => AccountDetail(
        id: json["_id"],
        accountId: json["accountId"],
        accountDetails: json["accountDetails"] == null ? null : AccountDetailAccountDetails.fromJson(json["accountDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "accountId": accountId,
        "accountDetails": accountDetails?.toJson(),
    };
}

class AccountDetailAccountDetails {
    AccountDetailsAccountDetails? accountDetails;
    String? phoneNumber;

    AccountDetailAccountDetails({
        this.accountDetails,
        this.phoneNumber,
    });

    factory AccountDetailAccountDetails.fromJson(Map<String, dynamic> json) => AccountDetailAccountDetails(
        accountDetails: json["accountDetails"] == null ? null : AccountDetailsAccountDetails.fromJson(json["accountDetails"]),
        phoneNumber: json["phoneNumber"],
    );

    Map<String, dynamic> toJson() => {
        "accountDetails": accountDetails?.toJson(),
        "phoneNumber": phoneNumber,
    };
}

class AccountDetailsAccountDetails {
    Upi? upi;

    AccountDetailsAccountDetails({
        this.upi,
    });

    factory AccountDetailsAccountDetails.fromJson(Map<String, dynamic> json) => AccountDetailsAccountDetails(
        upi: json["upi"] == null ? null : Upi.fromJson(json["upi"]),
    );

    Map<String, dynamic> toJson() => {
        "upi": upi?.toJson(),
    };
}

class Upi {
    String? upi;

    Upi({
        this.upi,
    });

    factory Upi.fromJson(Map<String, dynamic> json) => Upi(
        upi: json["upi"],
    );

    Map<String, dynamic> toJson() => {
        "upi": upi,
    };
}

class AddressElement {
    String? id;
    int? addressId;
    AddressAddress? address;

    AddressElement({
        this.id,
        this.addressId,
        this.address,
    });

    factory AddressElement.fromJson(Map<String, dynamic> json) => AddressElement(
        id: json["_id"],
        addressId: json["addressId"],
        address: json["address"] == null ? null : AddressAddress.fromJson(json["address"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "addressId": addressId,
        "address": address?.toJson(),
    };
}

class AddressAddress {
    String? locality;
    String? state;
    String? country;
    String? city;
    String? zip;
    bool? billingAddress;
    bool? shippingAddress;
    bool? addressDefault;
    String? line1;
    String? line2;
    String? tag;

    AddressAddress({
        this.locality,
        this.state,
        this.country,
        this.city,
        this.zip,
        this.billingAddress,
        this.shippingAddress,
        this.addressDefault,
        this.line1,
        this.line2,
        this.tag,
    });

    factory AddressAddress.fromJson(Map<String, dynamic> json) => AddressAddress(
        locality: json["locality"],
        state: json["state"],
        country: json["country"],
        city: json["city"],
        zip: json["zip"],
        billingAddress: json["billingAddress"],
        shippingAddress: json["shippingAddress"],
        addressDefault: json["default"],
        line1: json["line1"],
        line2: json["line2"],
        tag: json["tag"],
    );

    Map<String, dynamic> toJson() => {
        "locality": locality,
        "state": state,
        "country": country,
        "city": city,
        "zip": zip,
        "billingAddress": billingAddress,
        "shippingAddress": shippingAddress,
        "default": addressDefault,
        "line1": line1,
        "line2": line2,
        "tag": tag,
    };
}
