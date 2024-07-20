// verify_otp_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:salesman_app/logic/verify_otp_logic/verify_otp_state.dart';
import 'package:salesman_app/main.dart';
import 'package:salesman_app/model/verify_otp_model/verify_otp_model.dart';
import 'package:salesman_app/utils/api/api_base.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/jwt_token_response_model/jwt_token_response_model.dart';
import '../../utils/preferences/local_preferences.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final ApiBase _apiBase = ApiBase();

  VerifyOtpCubit() : super(VerifyOtpInitial());

  void verifyOtp({required String phoneNumber, int? otp}) async {
    var data = {"phoneNumber": phoneNumber, "otp": otp};

    try {
      emit(VerifyOtpLoading());

      await _apiBase.post(apiEndpoints.verifyOtp, data, (data) {
        var jsonData = VerifyOtpResponseModel.fromJson(data);
        if (jsonData.data?.userExists != true) {
          emit(VerifyOtpUserNotExists(phoneNumber: phoneNumber));
        } else {
          String token = jsonData.token ?? "";
          GetStorage().write("token", token);
          emit(UserLoggedIn());
          fatchToken(jsonData.token, userNotExists: false);
        }
      }, (error) {
        emit(VerifyOtpError(errorMessage: error));
      });
    } catch (e) {
      emit(VerifyOtpError(errorMessage: e.toString()));
    }
  }

  void fatchToken(String? token, {bool? userNotExists}) async {
    var data = {"token": token, "groupId": apiEndpoints.groupId};

    if (userNotExists ?? false) {
      emit(CustomerInfoLoading());
    } else {
      emit(VerifyOtpLoading());
    }

    await _apiBase.post(apiEndpoints.refreshToken, data, (data) async {
      var jsonData = JwtTokeResponseModel.fromJson(data);

      var tokenResponse = jsonData.token;
      print("\x1B[32mresponse token............................$tokenResponse\x1B[0m");
      SharedPreferences tokenPref = await SharedPreferences.getInstance();
      await tokenPref.setString('refreshToken', tokenResponse!);
      if (userNotExists ?? false) {
        emit(CustomerInfoSuccess());
      }
      emit(UserLoggedIn());
      LocalStorageUtils.saveUserDetails(tokenResponse);
    }, (error) {
      if (userNotExists ?? false) {
        emit(CustomerInfoError(error));
      } else {
        emit(VerifyOtpError(errorMessage: error));
      }
    });
  }
}
