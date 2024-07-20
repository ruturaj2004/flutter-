part of 'search_customer_cubit.dart';

abstract class SearchCustomerState {
  List<searchedItem>? searchCustomer;
  SearchCustomerState({this.searchCustomer});
}

class SearchCustomerInitial extends SearchCustomerState {
  SearchCustomerInitial({super.searchCustomer});
}

class SearchCustomerLoding extends SearchCustomerState {
  SearchCustomerLoding({super.searchCustomer});
}

class SearchCustomerLoaded extends SearchCustomerState {
  SearchCustomerLoaded({super.searchCustomer});
}

class SearchCustomerError extends SearchCustomerState {
  final String? error;
  SearchCustomerError({this.error, super.searchCustomer});
}
