import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:getapi/model/get_data.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'get_data_state.dart';

class GetDataCubit extends Cubit<GetDataState> {
  GetDataCubit() : super(GetDataInitial());

  getData() async {
    try {
      final uri = Uri.parse(
          "https://4r4iwhot12.execute-api.ap-south-1.amazonaws.com/auth/group/getByGroupId/1703228300417");
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        var jsonresponse = jsonDecode(response.body);
        GetResponse getResponse = GetResponse.fromjson(jsonresponse);
        emit(GetDataLoaded(getResponse: getResponse));
      }
    } catch (e) {
      emit(GetDataError(error: e.toString()));
    }
  }
}
