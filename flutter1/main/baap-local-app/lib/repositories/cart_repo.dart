import 'package:baapapp/models/cart_model/add_cart_response_model.dart';
import 'package:baapapp/utils/api/api_exceptions.dart';
import 'package:baapapp/utils/api/api_manager.dart';
import 'package:baapapp/utils/api/failure.dart';
import 'package:dartz/dartz.dart';
import '../../constants/api_end_points.dart';
import '../models/cart_model/get_cart_response_model.dart';
import '../models/cart_model/update_cart_response_model.dart';
import '../models/default_address_response_model/default_address_response_model.dart';

class CartRepo {
  final _apiManager = ApiManager();

  Future<Either<Failure, CartResponseModel>> getCartByGroupIdAndUserId(
      {required int? groupId, required int? userId}) async {
    try {
      var jsonResponse = await _apiManager.get(
          "${ApiEndPoints.baseUrl}${ApiEndPoints.getCartByUserId}$groupId/$userId");
      var response = CartResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }  

  Future<Either<Failure, DefalutAddressResponseModel>> getDefaultByUserId(
      {required int? groupId, required int? userId}) async {
    try {
      var jsonResponse = await _apiManager.get(
          "${ApiEndPoints.baseUrl}${ApiEndPoints.getDefaultAddress}/$groupId/$userId");
      var response = DefalutAddressResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, AddCartResponseModel>> addToCart(    
      Map<String, Object?> data) async {
    try {
      var jsonResponse = await _apiManager.post(
          "${ApiEndPoints.baseUrl}${ApiEndPoints.cart}", data);
      var response = AddCartResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, UpdateCartResponseModel>> updateCartProduct(
    int? groupId,
    Map<String, Object?> data,
    int? userId,
    int? productCode,
  ) async {
    try {
      var jsonResponse = await _apiManager.put(
          "${ApiEndPoints.baseUrl}${ApiEndPoints.cart}$groupId/$userId/$productCode",
          data);
      var response = UpdateCartResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, dynamic>> deleteCartByProductId(
      {int? groupId, int? cartId, int? productCode}) async {
    try {
      var jsonResponse = await _apiManager.delete(
          "${ApiEndPoints.baseUrl}${ApiEndPoints.cart}/$groupId/$cartId/$productCode");
      var response = AddCartResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

    Future<Either<Failure, dynamic>> deleteCartByCartId(
      {int? cartId}) async {
    try {
      var jsonResponse = await _apiManager.delete(
          "${ApiEndPoints.baseUrl}${ApiEndPoints.cartdeleteAll}${ApiEndPoints.groupId}/$cartId/");
      var response = AddCartResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
}
