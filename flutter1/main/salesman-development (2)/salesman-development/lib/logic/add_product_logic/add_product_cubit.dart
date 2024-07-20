import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salesman_app/main.dart';
import 'package:salesman_app/utils/api/api_base.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final ApiBase _apiBase = ApiBase();
  AddProductCubit() : super(AddProductInitial());
  addproduct(
    String? name,
    int? regularPrice,
    int? buyingPrice,
    int? marketPrice,
    int? gst,
    int? igst,
    int? cgst,
  ) async {
    var data = {
      "name": name,
      "groupId": apiEndpoints.groupId,
      "regularPrice": regularPrice ?? 0,
      "buyingPrice": buyingPrice ?? 0,
      "marketPrice": marketPrice ?? 0,
      "gst": gst ?? 0,
      "igst": igst ?? 0,
      "cgst": cgst ?? 0,
      "pictures": [
        "https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg"
      ]
    };

    try {
      emit(AddProductLoading());

      // ignore: unused_local_variable
      var response = await _apiBase.post(apiEndpoints.addproduct, data, (data) {
        emit(AddProductSuccess());
      }, (error) {
        emit(AddProductError(errorMessage: error));
      });
    } catch (e) {
      emit(AddProductError(errorMessage: e.toString()));
    }
  }
}
