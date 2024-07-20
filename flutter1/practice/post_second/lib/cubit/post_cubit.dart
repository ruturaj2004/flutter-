import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  // postData(String? message) async {
  //   String url =
  //       "https://rt0vu6tjkl.execute-api.ap-south-1.amazonaws.com/academic-service/communication/send-customer";

  //   Map<String, String> headers = {
  //     "content-type": "application/json",
  //   };
postData(String? message)async{
  String url="";
  Map<String, String> headers={
    "content-type":"application/json",
  };
  var jsonBody=json.encode({
    "name":"ruturaj",
    "age":19,
    "phoneNumber":9527311402,
  });
  try {
    emit(PostLoading());
    final response= await http.post(Uri.parse(url),headers: headers,body: jsonBody);
    if (response.statusCode==200) {
      emit(PostSuccess());
    }else{
      emit(PostError());
    }
  } catch (e) {
    
  }
}
}