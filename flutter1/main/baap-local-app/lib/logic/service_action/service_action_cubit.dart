import 'dart:developer';

import 'package:baapapp/constants/api_end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

import '../../repositories/service_action_repo.dart';

part 'service_action_state.dart';

class ServiceActionCubit extends Cubit<ServiceActionState> {
  final ServiceActionRepo _serviceActionRepo = ServiceActionRepo();
  ServiceActionCubit() : super(ServiceActionInitital());

  void serviceAction({
    int? subCategoryId,
    int? userId,
    int? groupId,
    int? bussinessId,
    int? categoryId,
    String? image,
  }) async {
    var latGetStorage = GetStorage().read('latitude');
    var lonGetStorage = GetStorage().read('longitude');

    var payload = {
      "groupId": ApiEndPoints.experienceGroupId,
      "userId": userId,
      "categoryId": categoryId,
      "image": image,
      'lat': latGetStorage,
      'lon': lonGetStorage
    };
    if (subCategoryId != null) {
      payload['subcategoryId'] = subCategoryId;
    }
    if (bussinessId != null) {
      payload['businessId'] = bussinessId;
    }
    log(payload.toString());
    try {
      emit(ServiceActionLoading());
      var json = await _serviceActionRepo.createService(payload);
      json.fold((error) {
        emit(ServiceActionError(error: error.message));
      }, (data) {
        emit(ServiceActionLoaded());
        Future.delayed(const Duration(seconds: 2), () {
          emit(ServiceActionStateCheck());
        });
      });
    } catch (e) {
      emit(ServiceActionError(error: e.toString()));
    }
  }

  void serviceActionByUserId(
      {int? userId, String? image, int? subGroupId}) async {
    var latGetStorage = GetStorage().read('latitude');
    var lonGetStorage = GetStorage().read('longitude');
    var locationName = GetStorage().read('locationName');
    var locationPin = GetStorage().read('locationPin');
    var payload = {
      "groupId": ApiEndPoints.experienceGroupId,
      "userId": userId,
      "image": image,
      'lat': latGetStorage,
      'lon': lonGetStorage,
      "locationName": locationName,
      "locationPin": locationPin,
    };
    try {
      emit(ServiceActionLoading());
      var json = await _serviceActionRepo.createServiceUsingUserId(payload);
      json.fold((error) {
        emit(ServiceActionError(error: error.message));
      }, (data) {
        emit(ServiceActionLoaded());
        Future.delayed(const Duration(seconds: 2), () {
          emit(ServiceActionStateCheck());
        });
      });
    } catch (e) {
      emit(ServiceActionError(error: e.toString()));
    }
  }
}