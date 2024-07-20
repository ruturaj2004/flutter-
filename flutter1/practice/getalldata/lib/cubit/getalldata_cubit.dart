import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/physics.dart';
import 'package:getalldata/cubit/postdata_cubit.dart';
import 'package:getalldata/model/get_data.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'getalldata_state.dart';
// class GetalldataCubit extends Cubit<GetalldataState> {
//   GetalldataCubit() : super(GetalldataInitial());
//  getData()async{
//   try{
//     final url = Uri.parse(
//       "https://4r4iwhot12.execute-api.ap-south-1.amazonaws.com/auth/group/getByGroupId/1703228300417"
//     );
//     final response=await http.get(url);
//     if (response.statusCode == 200) {
//       var jsonresponse=jsonDecode(response.body);
//       GetResponse getResponse= GetResponse.fromjson(jsonresponse);
//       emit(GetalldataLoaded(getResponse: getResponse));
//     }
//   }catch(e){
//     emit(GetalldataError(error: e.toString()));
//   }
//  }
// }

// class GetalldataCubit extends Cubit<GetalldataState>{
//   GetalldataCubit():super (GetalldataInitial());
//   getData()async{
//     try {
//       final url=Uri.parse("vncmvn,cmvn");
//       final response=await http.get(url);
//       var jsonresponse=jsonDecode(response.body);
//       GetResponse getResponse=GetResponse.fromjson(jsonresponse);
//       emit(GetalldataLoaded(getResponse: getResponse));
//     } catch (e) {
//       emit(GetalldataError(error: e.toString()));
//     }
//   }
// }

class GetalldataCubit extends Cubit<GetalldataState> {
  GetalldataCubit() : super(GetalldataInitial());

  // getData() async {
  //   try {
  //     final url = Uri.parse("");
  //     final response = await http.get(url);
  //     var jsonresponse = jsonDecode(response.body);
  //     GetResponse getResponse = GetResponse.fromjson(jsonresponse);
  //     emit(GetalldataLoaded(getResponse: getResponse));
  //   } catch (e) {
  //     emit(GetalldataError(error: e.toString()));
  //   }
  // }


getDta()async{
  try {
    final url=Uri.parse("");
    final response=await http.get(url);
    var jsonresponse=jsonDecode(response.body);
    GetResponse getResponse=GetResponse.fromjson(jsonresponse);
emit(GetalldataLoaded(getResponse: getResponse));
  } catch (e) {
    emit(GetalldataError(error: e.toString()));
  }
}
}
