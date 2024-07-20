part of 'add_product_cubit.dart';

@immutable
sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}

final class AddProductSuccess extends AddProductState {}

final class AddProductLoading extends AddProductState {}

final class AddProductError extends AddProductState {
  final String? errorMessage;

  AddProductError({required this.errorMessage});
}
