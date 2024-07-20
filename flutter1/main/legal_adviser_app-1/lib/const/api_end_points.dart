import '../model/env_global.dart';

class ApiEndpoints {
  ApiBaseUrlModel? apiBaseUrlModel;

  ApiEndpoints({this.apiBaseUrlModel}) {
    if (apiBaseUrlModel == null) {}
  }

  late String baseUrl = apiBaseUrlModel?.baseUrl ?? "";
  late String authBaseUrl = apiBaseUrlModel?.authBaseUrl ?? "";

  late String getAllCategory = "${baseUrl}category/all/category";
  late String getProductByGroupId = "${baseUrl}products/all/group";

  late String getAllProducts = "products/all/products";
}
