// state.dart
import '../../model/cart_model/get_cart_response_model.dart';

abstract class CartState {
  final CartResponseModel? data;
  const CartState(this.data);
}

class CartInitial extends CartState {
  const CartInitial(CartResponseModel? cartResponseModel)
      : super(cartResponseModel);

  List<Object?> get props => [];
}

class CartLoading extends CartState {
  const CartLoading(CartResponseModel? cartResponseModel)
      : super(cartResponseModel);

  List<Object?> get props => [];
}

class CartLoaded extends CartState {
  const CartLoaded(CartResponseModel? cartResponseModel)
      : super(cartResponseModel);

  List<Object?> get props => [super.data];
}

class CartError extends CartState {
  final String error;
  const CartError(CartResponseModel? cartResponseModel, this.error)
      : super(cartResponseModel);

  List<Object?> get props => [];
}

class CartAddSuccess extends CartState {
  CartAddSuccess(CartResponseModel? data) : super(data);
}

class CartQuantityIncrement extends CartState {
  final int? value;
  const CartQuantityIncrement(CartResponseModel? cartResponseModel, this.value)
      : super(cartResponseModel);

  List<Object?> get props => [];
}

class CartQuantityDecrement extends CartState {
  final int? value;
  const CartQuantityDecrement(CartResponseModel? cartResponseModel, this.value)
      : super(cartResponseModel);

  List<Object?> get props => [];
}

class QuantityLoading extends CartState {
  const QuantityLoading(CartResponseModel? cartResponseModel)
      : super(cartResponseModel);

  List<Object?> get props => [];
}
