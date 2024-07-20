import 'package:bloc/bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:salesman_app/logic/get_group_logic/get_groups_state.dart';
import 'package:salesman_app/main.dart';
import '../../model/get_group_model/get_group_model.dart';
import '../../utils/api/api_base.dart';
import '../../utils/preferences/local_preferences.dart';

class GetGroupsCubit extends Cubit<GetGroupsState> {
  final ApiBase _apiBase = ApiBase();
  GetGroupsCubit() : super(GetGroupsInitial());
  String _phoneNumber = '';

  void getGroups() async {
    final token = await LocalStorageUtils.fetchToken();
    if (token!.isNotEmpty) {
      final userData = JwtDecoder.decode(token);
      _phoneNumber = userData['phoneNumber'];
    }
    try {
      emit(GetGroupsLoading());
      (await _apiBase.get("${apiEndpoints.getGroup}/$_phoneNumber",
          isTokenMandatory: true, (data) {
        var groupsModel = GetGroupsModel.fromJson(data);
        emit(
          GetGroupsLoaded(getGroupsModel: groupsModel),
        );
      }, (error) {
        emit(
          GetGroupsError(error.toString()),
        );
      }));
    } catch (e) {
      emit(
        GetGroupsError(e.toString()),
      );
    }
  }
}
