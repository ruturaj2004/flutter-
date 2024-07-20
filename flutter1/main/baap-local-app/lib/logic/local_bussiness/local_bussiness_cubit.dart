import 'package:baapapp/utils/preferences/local_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/local_bussiness_response_model/local_bussiness_response_model.dart';
import '../../repositories/home_page_repo.dart';

part 'local_bussiness_state.dart';

class LocalBussinessCubit extends Cubit<LocalBussinessState> {
  final HomePageRepo _homePageRepo = HomePageRepo();
  LocalBussinessCubit() : super(LocalBussinessInitial());

  void getLocalBussies({int? categoryId}) async {
    var latGetStorage = GetStorage().read('latitude');
    var lonGetStorage = GetStorage().read('longitude');
    var distance = LocalStorageUtils.getDistance();
    try {
      emit(LocalBussinessLoading());
      var data = await _homePageRepo.getLocalBussiess(
        categoryId: categoryId,
        lat: latGetStorage,
        lon: lonGetStorage,
        distance: distance,
      );
      data.fold((error) {
        emit(LocalBussinessError(errorMessage: error.message));
      }, (data) {
        emit(LocalBussinessLoaded(localBussiness: data.data?.items ?? []));
      });
    } catch (e) {
      emit(LocalBussinessError(errorMessage: e.toString()));
    }
  }

  void searchLocalBussines({String? value}) async {
    try {
      emit(LocalBussinessLoading());
      var latGetStorage = GetStorage().read('latitude');
      var lonGetStorage = GetStorage().read('longitude');
      var distance = LocalStorageUtils.getDistance();
      var data = await _homePageRepo.searchLocalBussiness(
        value: value,
        lat: latGetStorage,
        lon: lonGetStorage,
        distance: distance,
      );
      data.fold((error) {
        emit(LocalBussinessError(errorMessage: error.message));
      }, (data) {
        emit(LocalBussinessLoaded(localBussiness: data.data?.items ?? []));
      });
    } catch (e) {
      emit(LocalBussinessError(errorMessage: e.toString()));
    }
  }
}
