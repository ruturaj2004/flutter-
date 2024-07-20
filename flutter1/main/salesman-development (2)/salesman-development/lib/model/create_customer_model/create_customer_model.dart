class CreateCustomerModel {
    Customer? customer;
    User? user;

    CreateCustomerModel({
        this.customer,
        this.user,
    });

    factory CreateCustomerModel.fromJson(Map<String, dynamic> json) => CreateCustomerModel(
        customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "customer": customer?.toJson(),
        "user": user?.toJson(),
    };
}

class Customer {
    int? groupId;
    int? phoneNumber;
    int? custId;
    int? userId;
    List<AccountDetail>? accountDetails;
    List<AddressElement>? addresses;
    String? id;
    String? password;
    String? name;
    String? gender;
    int? pinCode;
    String? location;
    int? roleId;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Customer({
        this.groupId,
        this.phoneNumber,
        this.custId,
        this.userId,
        this.accountDetails,
        this.addresses,
        this.id,
        this.password,
        this.name,
        this.gender,
        this.pinCode,
        this.location,
        this.roleId,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        groupId: json["groupId"],
        phoneNumber: json["phoneNumber"],
        custId: json["custId"],
        userId: json["userId"],
        accountDetails: json["accountDetails"] == null ? [] : List<AccountDetail>.from(json["accountDetails"]!.map((x) => AccountDetail.fromJson(x))),
        addresses: json["addresses"] == null ? [] : List<AddressElement>.from(json["addresses"]!.map((x) => AddressElement.fromJson(x))),
        id: json["_id"],
        password: json["password"],
        name: json["name"],
        gender: json["gender"],
        pinCode: json["pinCode"],
        location: json["location"],
        roleId: json["roleId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "groupId": groupId,
        "phoneNumber": phoneNumber,
        "custId": custId,
        "userId": userId,
        "accountDetails": accountDetails == null ? [] : List<dynamic>.from(accountDetails!.map((x) => x.toJson())),
        "addresses": addresses == null ? [] : List<dynamic>.from(addresses!.map((x) => x.toJson())),
        "_id": id,
        "password": password,
        "name": name,
        "gender": gender,
        "pinCode": pinCode,
        "location": location,
        "roleId": roleId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class AccountDetail {
    String? id;
    int? accountId;
    AccountDetails? accountDetails;

    AccountDetail({
        this.id,
        this.accountId,
        this.accountDetails,
    });

    factory AccountDetail.fromJson(Map<String, dynamic> json) => AccountDetail(
        id: json["_id"],
        accountId: json["accountId"],
        accountDetails: json["accountDetails"] == null ? null : AccountDetails.fromJson(json["accountDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "accountId": accountId,
        "accountDetails": accountDetails?.toJson(),
    };
}

class AccountDetails {
    int? phoneNumber;

    AccountDetails({
        this.phoneNumber,
    });

    factory AccountDetails.fromJson(Map<String, dynamic> json) => AccountDetails(
        phoneNumber: json["phoneNumber"],
    );

    Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
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

    AddressAddress({
        this.locality,
        this.state,
        this.country,
        this.city,
        this.zip,
        this.billingAddress,
        this.shippingAddress,
        this.addressDefault,
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
    };
}

class User {
    String? name;
    int? userId;
    String? password;
    String? phoneNumber;
    String? id;
    String? gender;
    String? token;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    User({
        this.name,
        this.userId,
        this.password,
        this.phoneNumber,
        this.id,
        this.gender,
        this.token,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        userId: json["userId"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        id: json["_id"],
        gender: json["gender"],
        token: json["token"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "userId": userId,
        "password": password,
        "phoneNumber": phoneNumber,
        "_id": id,
        "gender": gender,
        "token": token,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}
