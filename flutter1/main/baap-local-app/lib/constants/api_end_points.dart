class ApiEndPoints {
  // static const int groupId = 1695232348474; //current
  static const int groupId = 1698658253245;
  static const int experienceGroupId = 1703228300417;
  // static const int groupId = 1697789152088; // for deployement
  static const int roleId = 1701427961185;
  static const String version = '13.0.0';

  static const String baseUrl =
      "https://mbcut2mq36.execute-api.ap-south-1.amazonaws.com/commerce/";

  static const String commerceBaseUrl =
      "https://gxppcdmn7h.execute-api.ap-south-1.amazonaws.com/";

  static const String authBaseUrl =
      "https://4r4iwhot12.execute-api.ap-south-1.amazonaws.com/auth/";

  static const String memberBaseUrl =
      "https://qitinnxwl2.execute-api.us-east-2.amazonaws.com/peopleManagement/members/";

  static const String imageUploadBaseUrl =
      'https://mzdj9zyo62.execute-api.ap-south-1.amazonaws.com/doc-upload/';

  static const String paymentGateway =
      'https://h3gr9lo7kb.execute-api.ap-south-1.amazonaws.com/payment/v1/api/';

  static const String getCategoryByGroupId = "category/all/getByGroupId/";
  static const String getBussinessByCategoryId = "bussiness/all/getByGroupId/";
  static const String getBussinessBySubGroupId = "/bussiness/all/getByGroupId/";
  static const String getSubCategoryByCategoryId = "services/all/getByGroupId/";
  static const String searchSubCategory = "services/search/";
  static const String searchLocalBussiness = "bussiness/search/";
  static const String getSubCategoryListBySubCategoryId =
      "services/all/getByGroupId/";
  static const String serviceAction = "serviceaction/service/action";
  static const String serviceActionByCustomer =
      "serviceaction/customer/service/request";
  static const String imageUpload = 'signed-url';
  static const String checkVersion = 'appVersion/gateway/getAppVersion';

  static const String auth = "auth";
  static const String authGateway = "authgw";
  static const String commerceGateway = "commerce-gw/";

  static const String sendOtp = "/sendotp";
  static const String verifyOtp = "/validateOtp";
  static const String saveCustomer = "commerce-gw/customer/save";

  static const String serviceRequest = "servicerequest/group/";
  static const String serviceresponse = "serviceresponse/group/";
  static const String serviceResponse =
      "serviceaction/customer/service/responses";
  //profile
  static const String refreshToken = "auth/refresh-token";
  static const String getCustomer = "customer/getByCustomerByUserId/";
  static const String updateCustomer = "customer/updateByUserId/";
  static const String updateCustomerUPI = "customer/accountDetails/";
  static const String getCustomerUPI = "customer/upis/";
  static const String updateAddress = "customer/updateAddress/";
  static const String deleteAddress = "customer/deleteAddress/";

  //Product
  static const String getGroup = "group/getByGroupId/";
  static const String getProduct = "products/all/group/";
  static const String cart = "cart/";
  static const String cartdeleteAll = "cart/deleteAll/";
  static const String getCartByUserId = "cart/getProductByUserId/";
  static const String getDefaultAddress = "customer/getDefaultAddress";
  static const String order = "products/order";
  static const String getOrderDetailsByGroupId = "order/all/getByGroupId/";
  static const String getOrderList = "/servicerequest/order/group/";

  // Payment
  static const String checkVPA = "vpa/check";
  static const String collectVPA = "vpa/collect";
  static const String checkPaymentStatus = "vpa/fetch/transaction/status";
}
