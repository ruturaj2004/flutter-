import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:getalldata/cubit/demo_cubit.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'postdata_state.dart';

class PostdataCubit extends Cubit<PostdataState> {
  PostdataCubit() : super(PostdataInitial());

//   postData(String? message) async {
//     String url =
//         "https://rt0vu6tjkl.execute-api.ap-south-1.amazonaws.com/academic-service/communication/send-customer";

//     Map<String, String> headers = {
//       "content-type": "application/json",
//     };

//     var jsonBody = json.encode({
//       "sender": "Rutu",
//       "receiver": "Suraj",
//       "message": message,
//       "receiverId": 2238746,
//       "senderId": 248623847,
//       "groupId": 1709987550657,
//     });

//     try {
//       emit(PostdataLoading());
//       final response =
//           await http.post(Uri.parse(url), headers: headers, body: jsonBody);

//       if (response.statusCode == 200) {
//         emit(PostdataSuccess());
//       } else {
//         emit(PostdataError());
//       }
//     } catch (e) {
//       emit(PostdataError());
//     }
//   }
// }

// postDaa(String? message)async{
//   String url="";
//   Map<String,String> headers={
//     "content-type":"application/json"
//   };

//   var jsonBody=json.encode({
//     "sender": "Rutu",
//       "receiver": "Suraj",
//       "message": message,
//       "receiverId": 2238746,
//       "senderId": 248623847,
//       "groupId": 1709987550657,

//   })
//   ;

//   try {
//   emit(PostdataLoading());
//     final response=await http.post(Uri.parse(url),headers: headers,body: jsonBody);
//     if (response.statusCode==200) {
//       emit(PostdataSuccess());
//     }
//   } catch (e) {
//     DemoError();
//   }
// }

  postData(String? message) async {
    String url = "";
    Map<String, String> headers = {"content-type": "application/json"};
    var jsonBody={
      "sender": "Rutu",
      "receiver": "Suraj",
      "message": message,
      "receiverId": 2238746,
      "senderId": 248623847,
      "groupId": 1709987550657,
    
    };
    try {
      final response=await http.post(Uri.parse(url),headers: headers,body: jsonBody);
      if (response.statusCode==200) {
        emit(PostdataSuccess());
      }
    } catch (e) {
      emit(PostdataError());
    }
  }
}
