import 'package:bloc/bloc.dart';
import 'package:salesman_app/main.dart';
import 'package:salesman_app/model/search-customer_response_model/search_customer_response_model.dart';
import 'package:salesman_app/utils/api/api_base.dart';
part 'search_customer_state.dart';

class SearchCustomerCubit extends Cubit<SearchCustomerState> {
  final ApiBase _apiBase = ApiBase();

  SearchCustomerCubit() : super(SearchCustomerInitial());

  void searchCustomer({String? value, int? groupId}) async {
    try {
      emit(SearchCustomerLoding());
      (
        _apiBase.get(
            "${apiEndpoints.searchCustomer}${apiEndpoints.groupId}?search=$value&groupId=$groupId",
            (data) {
          var jsonData = SearchCustomerResponseModel.fromJson(data);

          emit(SearchCustomerLoaded(
              searchCustomer: jsonData.data?.searcheditem));
        }, (error) {
          emit(SearchCustomerError(error: error.toString()));
        }),
      );
    } catch (e) {
      emit(
        SearchCustomerError(
          error: e.toString(),
        ),
      );
    }
  }

  // Add the clearSearchResults method
  clearSearchResults() {
    emit(SearchCustomerInitial());
  }
}

 