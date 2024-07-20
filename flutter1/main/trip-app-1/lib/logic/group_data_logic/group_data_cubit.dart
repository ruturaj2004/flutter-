import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trip_app/model/group_data_model/group_data_model.dart';
import 'package:trip_app/repositories/auth/auth_repo.dart';

part 'group_data_state.dart';

class GroupDataCubit extends Cubit<GroupDataState> {
  final AuthRepo _authRepo = AuthRepo();

  GroupDataCubit() : super(GroupDataInitial());

  void groupDataDetail() async {
    try {
      emit(GroupDataLoading());
      var data = await _authRepo.gropudata();
      data.fold(
        (error) {
          emit(GroupDataError(errorMessage: error.message));
        },
        (data) {
          emit(GroupDataLoaded(gropuDataModel: data));
        },
      );
    } catch (e) {
      emit(GroupDataError(errorMessage: e.toString()));
    }
  }
}
