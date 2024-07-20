import 'package:bloc/bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';
import 'package:trip_app/constants/api_endpoint.dart';
import 'package:trip_app/repositories/auth/auth_repo.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trip_app/utils/peferance/peferance.dart';

part 'verify_otp_logic_state.dart';

class VerifyOtpLogicCubit extends Cubit<VerifyOtpLogicState> {
  final AuthRepo _authRepo = AuthRepo();
  VerifyOtpLogicCubit() : super(VerifyOtpLogicInitial());

  void verifyOtp({required String phoneNumber, int? otp}) async {
    var data = {"phoneNumber": phoneNumber, "otp": otp};
    emit(VerifyOtpLoading());
    var response = await _authRepo.verifyOtp(data: data);
    print(response);
    response.fold((error) {
      emit(VerifyOtpError(error.message));
    }, (data) {
      emit(VerifyOtpSuccess());
      if (data.data?.userExists != true) {
        emit(VerifyOtpUserNotExists(phoneNumber: phoneNumber));
      } else {
        String token = data.token ?? "";
        GetStorage().write("token", token);
        emit(UserLoggedIn());
        fatchToken(data.token, userNotExists: false);
      }
    });
  }

  void fatchToken(String? token, {bool? userNotExists}) async {
    var groupId = ApiEndPoints.roleId;
    var data = {"token": token, "groupId": groupId};
    if (userNotExists ?? false) {
      emit(CustomerInfoLoading());
    } else {
      emit(VerifyOtpLoading());
    }
    var response = await _authRepo.refreshToken(data: data);

    response.fold((error) {
      if (userNotExists ?? false) {
        emit(CustomerInfoError(error.message));
      } else {
        emit(VerifyOtpError(error.message));
      }
    }, (data) async {
      if (userNotExists ?? false) {
        emit(CustomerInfoSuccess());
      }
      emit(UserLoggedIn());
      LocalStorageUtils.saveUserDetails(data.token ?? "");
    });
  }
}
