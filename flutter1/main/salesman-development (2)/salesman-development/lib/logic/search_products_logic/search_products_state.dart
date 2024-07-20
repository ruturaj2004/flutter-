// ignore_for_file: must_be_immutable

part of 'search_products_cubit.dart';

@immutable
sealed class SearchProductsState {
  List<searchProducts>? searchproducts;

  SearchProductsState({this.searchproducts});
}

final class SearchProductsInitial extends SearchProductsState {
  SearchProductsInitial({super.searchproducts});
}

final class SearchProductsLoading extends SearchProductsState {
  SearchProductsLoading({super.searchproducts});
}

final class SearchProductsLoaded extends SearchProductsState {
  SearchProductsLoaded({super.searchproducts});

  void loadLastSearchProducts(String lastSearchProducts) {}
}

final class SearchProductsError extends SearchProductsState {
  final String? error;
  SearchProductsError({this.error, super.searchproducts});
}
