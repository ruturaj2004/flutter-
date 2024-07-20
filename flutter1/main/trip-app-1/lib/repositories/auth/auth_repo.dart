import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip_app/constants/api_endpoint.dart';
import 'package:trip_app/model/get_duration_model/get_duration_model.dart';
import 'package:trip_app/model/group_data_model/group_data_model.dart';
import 'package:trip_app/model/jwt_refresh_token_model/jwt_refresh_token_model.dart';
import 'package:trip_app/model/send_otp_response_model/send_otp_response_model.dart';
import 'package:trip_app/model/start_trip_model/start_trip_model.dart';
import 'package:trip_app/model/update_location_model/update_location_model.dart';
import 'package:trip_app/model/verify_otp_response_model/verify_otp_response_model.dart';
import 'package:trip_app/utils/routes/api/api_exceptions.dart';
import 'package:trip_app/utils/routes/api/api_manger.dart';
import 'package:trip_app/utils/routes/api/failure.dart';
import 'package:dartz/dartz.dart';

class AuthRepo {
  final _apiManager = ApiManager();

  Future<Either<Failure, SendOtpResponseModel>> sendOtp(
      {required Map data}) async {
    try {
      var jsonResponse = await _apiManager.post(ApiEndPoints.sendOtpUrl, data);
      print(jsonResponse);
      var response = SendOtpResponseModel.fromJson(jsonResponse);
      print(response);
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
      var jsonResponse =
          await _apiManager.post(ApiEndPoints.verifyOtpUrl, data);
      print("json response of api verifyOTP $jsonResponse");

      var response = VerificationResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<void> saveToken(String token) async {
    GetStorage().write("token", token);
  }

  Future<Either<Failure, StartTripModel>> startTrip(
    List<double> fromLatLong,
    List<double> destinationLatLong,
    String from,
    List<String>? destination,
    int? groupId,
  ) async {
    final Map<String, dynamic> data = {
      "fromLatLong": fromLatLong,
      "destinationLatLong": destinationLatLong,
      "from": from,
      "destination": destination,
      "groupId":groupId
    };
    print("the data is $data");
    try {
      final jsonResponse = await _apiManager.post(
          ApiEndPoints.startTripUrl, data,
          contentType: 'application/json');
      final startTripModel = StartTripModel.fromJson(jsonResponse);
      print("The response of start trip model  $startTripModel, $jsonResponse");
      int? tripId = startTripModel.newTrip?.tripId;
      print("Trip Id of user of post api$tripId");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('tripId', tripId!);

      return Right(startTripModel);
    } on AppException catch (error) {
      return Left(ApiFailure(message: error.message));
    } catch (error) {
      return Left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, UpdateLocationModel>> updateLocation(
    String? destination,
    List<double>? destinationLatLong,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tripId = prefs.getInt('tripId');
    print("tripId of updatelocation api $tripId");

    Map<String, dynamic> data = {
      "destination": destination,
      "destinationLatLong": destinationLatLong,
    };

    try {
      print("-------------- $tripId");
      var jsonResponse = await _apiManager.put(
          "${ApiEndPoints.updateLocationApi}/${ApiEndPoints.groupId}/$tripId", data,
          contentType: 'application/json');
      var response = UpdateLocationModel.fromJson(jsonResponse);
      print(" Response of updateLocation $response");
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, GetDurationModel>> getDurationData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var tripId = prefs.getInt('tripId');
      print("trip id for get api $tripId");
      var jsonResponse =
          await _apiManager.get("${ApiEndPoints.getDurationApi}/${ApiEndPoints.groupId}/${ApiEndPoints.trip}/$tripId");
      print(jsonResponse);
      var response = GetDurationModel.fromJson(jsonResponse);
      print(response);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, GroupDataModel>> gropudata() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? refreshToken = prefs.getString('refreshToken');
      Map<String, dynamic>? decodedToken = JwtDecoder.decode(refreshToken!);
      int groupId = decodedToken['groupId'];
      print("GroupId of UserData  $groupId");
      var jsonResponse =
          await _apiManager.get("${ApiEndPoints.getgroupdata}/$groupId");
      print("\x1B[32m. API Response$jsonResponse\x1B[0m");
      var response = GroupDataModel.fromJson(jsonResponse);

      print("\x1B[32m. API Response$response\x1B[0m");
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, JwtRefreshToken>> refreshToken(
      {required Map data}) async {
    try {
      var jsonResponse =
          await _apiManager.post(ApiEndPoints.refreshUserToken, data);
      var response = JwtRefreshToken.fromJson(jsonResponse);
      print("\x1B[32m. Token Response $response\x1B[0m");

      var tokenResponse = response.token;
      print("Refresh Token $tokenResponse");
      SharedPreferences tokenPref = await SharedPreferences.getInstance();
      await tokenPref.setString('refreshToken', tokenResponse!);

      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
}
