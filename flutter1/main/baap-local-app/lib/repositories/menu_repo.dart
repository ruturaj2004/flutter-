import 'package:baapapp/constants/api_end_points.dart';
import 'package:baapapp/models/service_request_detail_model/service_request_detail_model.dart';
import 'package:baapapp/models/service_request_response_model/close_service_request_response_model.dart';
import 'package:baapapp/models/service_request_response_model/service_request_response_model.dart';
import 'package:baapapp/utils/api/api_exceptions.dart';
import 'package:baapapp/utils/api/api_manager.dart';
import 'package:baapapp/utils/api/failure.dart';
import 'package:dartz/dartz.dart';

class MenuRepo {
  final ApiManager _apiManager = ApiManager();

  Future<Either<Failure, ServiceRequestResponseModel>> getServiceRequest(
      int? userId) async {
    try {
      var jsonResponse = await _apiManager.get(
        "${ApiEndPoints.baseUrl}${ApiEndPoints.serviceRequest}${ApiEndPoints.experienceGroupId}?userId=$userId",
        isTokenMandatory: true,
      );
      var json = ServiceRequestResponseModel.fromJson(jsonResponse);
      return right(json);
    } on AppException catch (e) {
      return left(ApiFailure(message: e.message));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, CloseServiceRequestResponseModel>> putServiceRequest(
      int? serviceRequestId, data) async {
    try {
      var jsonResponse = await _apiManager.put(
          "${ApiEndPoints.baseUrl}${ApiEndPoints.serviceRequest}${ApiEndPoints.groupId}/$serviceRequestId",
          data);
      var json = CloseServiceRequestResponseModel.fromJson(jsonResponse);
      return right(json);
    } on AppException catch (e) {
      return left(ApiFailure(message: e.message));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, ServiceRequestDetailResponseModel>>
      getDetailServiceRequests(int? servicerequestId) async {
    try {
      var jsonResponse = await _apiManager.get(
          "${ApiEndPoints.baseUrl}${ApiEndPoints.serviceresponse}${ApiEndPoints.experienceGroupId}?servicerequestId=$servicerequestId");
      var json = ServiceRequestDetailResponseModel.fromJson(jsonResponse);
      return right(json);
    } on AppException catch (e) {
      return left(ApiFailure(message: e.message));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, ServiceRequestDetailResponseModel>>
      postServiceRequestsResponse(data) async {
    try {
      var jsonResponse = await _apiManager.post(
          "${ApiEndPoints.commerceBaseUrl}${ApiEndPoints.serviceResponse}",
          data,
          isTokenMandatory: true);
      var json = ServiceRequestDetailResponseModel.fromJson(jsonResponse);
      return right(json);
    } on AppException catch (e) {
      return left(ApiFailure(message: e.message));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }
}
