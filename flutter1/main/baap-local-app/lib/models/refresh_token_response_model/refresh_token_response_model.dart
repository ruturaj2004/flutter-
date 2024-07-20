class RefreshTokenResponseModel {
    String? message;
    String? data;

    RefreshTokenResponseModel({
        this.message,
        this.data,
    });

    factory RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) => RefreshTokenResponseModel(
        message: json["message"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data,
    };
}
