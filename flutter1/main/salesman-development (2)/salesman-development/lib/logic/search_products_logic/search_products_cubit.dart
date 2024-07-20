import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salesman_app/main.dart';
import 'package:salesman_app/model/search_products_model/search_products_res_model.dart';
import 'package:salesman_app/utils/api/api_base.dart';

import '../../model/product_response_model/product_response_model.dart';

part 'search_products_state.dart';

class SearchProductsCubit extends Cubit<SearchProductsState> {
  final ApiBase _apiBase = ApiBase();
  SearchProductsCubit() : super(SearchProductsInitial());

  void searchProducts({String? value, int? groupId}) async {
    try {
      emit(SearchProductsLoading());
      (
        _apiBase.get(
            "${apiEndpoints.searchProducts}${apiEndpoints.groupId}?search=$value&groupId=$groupId",
            (data) {
          var jsonData = SearchProductsModel.fromJson(data);
          emit(
            SearchProductsLoaded(searchproducts: jsonData.data?.searchproducts),
          );
        }, (error) {
          emit(SearchProductsError(error: error.toString()));
        }),
      );
    } catch (e) {
      emit(SearchProductsError(error: e.toString()));
    }
  }
}
