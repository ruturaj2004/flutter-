import 'package:baapapp/models/payment_services/check_payment_status_response_model.dart';
import 'package:baapapp/models/payment_services/check_vpa_response_model.dart';
import 'package:baapapp/models/payment_services/collect_vap_response_model.dart';
import 'package:baapapp/models/upi_response_model/upi_response_model.dart';
import 'package:baapapp/utils/api/api_manager.dart';
import 'package:baapapp/constants/api_end_points.dart';
import 'package:baapapp/utils/api/failure.dart';
import 'package:dartz/dartz.dart';

import '../../utils/api/api_exceptions.dart';

class PaymentRepo {
  final _apiManager = ApiManager();

  Future<Either<Failure, CheckVpaResponseModel>> checkVPA(payload) async {
    try {
      final jsonResponse = await _apiManager.post(
          '${ApiEndPoints.paymentGateway}${ApiEndPoints.checkVPA}', payload);
      var response = CheckVpaResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, CollectVpaResponseModel>> collectVPA(payload) async {
    try {
      final jsonResponse = await _apiManager.post(
          '${ApiEndPoints.paymentGateway}${ApiEndPoints.collectVPA}', payload);
      var response = CollectVpaResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, CheckPaymentStatusResponseModel>> checkPaymentStatus(
      payload) async {
    try {
      final jsonResponse = await _apiManager.post(
          '${ApiEndPoints.paymentGateway}${ApiEndPoints.checkPaymentStatus}',
          payload);
      var response = CheckPaymentStatusResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, UpiResponseModel>> getUPILIst(
    int? userId,
  ) async {
    try {
      final jsonResponse = await _apiManager.get(
          '${ApiEndPoints.baseUrl}${ApiEndPoints.getCustomerUPI}${ApiEndPoints.experienceGroupId}/$userId');
      var response = UpiResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
}
