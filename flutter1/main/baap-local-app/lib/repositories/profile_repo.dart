import 'package:baapapp/constants/api_end_points.dart';
import 'package:baapapp/models/profile_response_model/customer_response_model.dart';

import 'package:baapapp/utils/api/api_exceptions.dart';
import 'package:baapapp/utils/api/api_manager.dart';
import 'package:baapapp/utils/api/failure.dart';
import 'package:dartz/dartz.dart';

class ProfileRepo {
  final ApiManager _apiManager = ApiManager();

  Future<Either<Failure, CustomerResponseModel>> getCustomerData(
      int? userId) async {
    try {
      var jsonResponse = await _apiManager
          .get("${ApiEndPoints.baseUrl}${ApiEndPoints.getCustomer}$userId");
      var json = CustomerResponseModel.fromJson(jsonResponse);
      return right(json);
    } on AppException catch (e) {
      return left(ApiFailure(message: e.message));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, CustomerResponseModel>> updateCustomerData(
      int? userId, data) async {
    try {
      var jsonResponse = await _apiManager.put(
          "${ApiEndPoints.baseUrl}${ApiEndPoints.updateCustomer}$userId", data);
      var json = CustomerResponseModel.fromJson(jsonResponse);
      return right(json);
    } on AppException catch (e) {
      return left(ApiFailure(message: e.message));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, CustomerResponseModel>> updateCustomerUpi(
      int? userId, data) async {
    try {
      var jsonResponse = await _apiManager.put(
          "${ApiEndPoints.baseUrl}${ApiEndPoints.updateCustomerUPI}$userId",
          data);
      var json = CustomerResponseModel.fromJson(jsonResponse);
      return right(json);
    } on AppException catch (e) {
      return left(ApiFailure(message: e.message));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, CustomerResponseModel>> updateAddress(
      {int? addressId, int? userId, data}) async {
    try {
      var jsonResponse = await _apiManager.put(
          "${ApiEndPoints.baseUrl}${ApiEndPoints.updateAddress}${ApiEndPoints.experienceGroupId}/$userId/$addressId",
          data);
      var json = CustomerResponseModel.fromJson(jsonResponse);
      return right(json);
    } on AppException catch (e) {
      return left(ApiFailure(message: e.message));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, CustomerResponseModel>> deleteAddress(
      {int? addressId, int? userId}) async {
    try {
      var jsonResponse = await _apiManager.delete(
          "${ApiEndPoints.baseUrl}${ApiEndPoints.deleteAddress}/${ApiEndPoints.experienceGroupId}/$userId/$addressId");
      var json = CustomerResponseModel.fromJson(jsonResponse);
      return right(json);
    } on AppException catch (e) {
      return left(ApiFailure(message: e.message));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, CustomerResponseModel>> deleteUPIAddress({
    int? accountId,
    int? userId,
  }) async {
    try {
      var jsonResponse = await _apiManager.delete(
          "${ApiEndPoints.baseUrl}${ApiEndPoints.updateCustomerUPI}/${ApiEndPoints.experienceGroupId}/$userId/$accountId");
      var json = CustomerResponseModel.fromJson(jsonResponse);
      return right(json);
    } on AppException catch (e) {
      return left(ApiFailure(message: e.message));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }
}
