import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'demo_state.dart';

class DemoCubit extends Cubit<DemoState> {
  DemoCubit() : super(DemoInitial());
  postData(String? message) async {
    String url = "";

    Map<String, String> headers = {
      "content-type": "Application/json",
    };
    var jsonBody = json.encode({
      "sender": "Rutu",
      "receiver": "Suraj",
      "message": message,
      "receiverId": 2238746,
      "senderId": 248623847,
      "groupId": 1709987550657,
    });

    try {
      emit(DemoLoading());
      final response =
          await http.post(Uri.parse(url), headers: headers, body: jsonBody);
      if (response.statusCode == 200) {
        emit(DemoSuccess());
      }
    } catch (e) {
      emit(DemoError());
    }
  }
}
