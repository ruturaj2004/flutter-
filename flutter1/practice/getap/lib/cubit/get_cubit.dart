import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:getap/model/get_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'get_state.dart';

class GetCubit extends Cubit<GetState> {
  GetCubit() : super(GetInitial());
}

getData() async {
  
  try {
    final url = Uri.parse("");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonresponse = jsonDecode(response.body);
      GetResponse getResponse = GetResponse.fromjson(jsonresponse);
      
      emit(GetLoaded(getResponse: getResponse));
    }
  } catch (e) {
   emit ;
  }
}

void emit(GetLoaded getLoaded) {
}


