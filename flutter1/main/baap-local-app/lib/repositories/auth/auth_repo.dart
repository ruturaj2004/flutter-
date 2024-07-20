
import 'package:dartz/dartz.dart';
import '../../constants/api_end_points.dart';
import '../../models/refresh_token_response_model/refresh_token_response_model.dart';
import '../../models/save_user_response_model/save_user_response_model.dart';
import '../../models/send_otp_response_model/send_otp_response_model.dart';
import '../../models/verify_otp_response_model.dart/verify_otp_response_model.dart';
import '../../utils/api/api_exceptions.dart';
import '../../utils/api/api_manager.dart';
import '../../utils/api/failure.dart';

class AuthRepo {
  final _apiManager = ApiManager();

  Future<Either<Failure, SendOtpResponseModel>> sendOtp(
      {required Map data}) async {
    try {
      var jsonResponse = await _apiManager.post(
          "${ApiEndPoints.commerceBaseUrl}${ApiEndPoints.authGateway}${ApiEndPoints.sendOtp}",
          data);
      var response = SendOtpResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, VerificationResponseModel>> verifyOtp(
      {required Map data}) async {
    try {
      var jsonResponse = await _apiManager.post(
          "${ApiEndPoints.authBaseUrl}${ApiEndPoints.auth}${ApiEndPoints.verifyOtp}",
          data);
      var response = VerificationResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, SaveUserResponseModel>> saveCustomer(
      {required Map data}) async {
    try {
      var jsonResponse = await _apiManager.post(
          "${ApiEndPoints.commerceBaseUrl}${ApiEndPoints.saveCustomer}",
          data);
      var response = SaveUserResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, RefreshTokenResponseModel>> refreshToken(
      {required Map data}) async {
    try {
      var jsonResponse = await _apiManager.post(
          "${ApiEndPoints.authBaseUrl}${ApiEndPoints.refreshToken}",
          data);
      var response = RefreshTokenResponseModel.fromJson(jsonResponse);
      return right(response); 
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
}
