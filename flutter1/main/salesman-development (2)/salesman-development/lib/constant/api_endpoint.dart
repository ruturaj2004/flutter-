import '../model/api_base_model.dart';

class ApiEndPoints {
  ApiBaseModel? apiBaseModel;

  ApiEndPoints({this.apiBaseModel}) {
    if (apiBaseModel == null) {}
  }

  late String baseUrl = apiBaseModel?.commerceUrl ?? "";
  late String authBaseUrl = apiBaseModel?.authUrl ?? "";
  late String gatewayBaseUrl = apiBaseModel?.gatewayUrl ?? "";
  late String memberBaseUrl = apiBaseModel?.memberUrl ?? "";
  late String paymentBaseUrl = apiBaseModel?.paymentUrl ?? "";
  late String imageUploadBaseUrl = apiBaseModel?.imageUploadUrl ?? "";
  late String imageResizeBaseUrl = apiBaseModel?.imageResizeUrl ?? "";
  late String version = apiBaseModel?.version ?? "";
  late int groupId = apiBaseModel?.groupId ?? 1703228300417;

  // Send OTP
  late String sendOTP = "$gatewayBaseUrl/auth/auth/sendOtp";
  // Verify OTP
  late String verifyOtp = "$authBaseUrl/auth/validateOtp";
  //refresh  token
  late String refreshToken = "$gatewayBaseUrl/authgw/refresh-token";
  //get groups
  late String getGroup = "$authBaseUrl/usergroup/all/";
// search customer
  late String searchCustomer = "$baseUrl/customer/all/getByGroupId/";
  //search Products
  late String searchProducts = "$baseUrl/products/all/group/";
  // add customer
  late String createCustomer = "$gatewayBaseUrl/commerce-gw/customer/save";
  //add product
  late String cartUrl = "$baseUrl/cart/";
  //place order
  late String placeOrder = "/getProductByUserId/";
  // add product
  late String addproduct = "$baseUrl/products/";
}
