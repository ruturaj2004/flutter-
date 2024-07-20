import 'package:bloc/bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meta/meta.dart';
import 'package:salesman_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/cart_model/add_cart_response_model.dart';
import '../../model/cart_model/get_cart_response_model.dart';
import '../../model/cart_model/update_cart_response_model.dart';
import '../../presentation/shopping_cart_screen/shopping_cart_screen.dart';
import '../../utils/api/api_base.dart';
import '../../utils/preferences/local_preferences.dart';
import 'cart_cubit_state.dart';

class CartCubit extends Cubit<CartState> {
  final ApiBase _apiBase = ApiBase();
  late int userId;

  CartCubit() : super(CartInitial(CartResponseModel())) {
    userId = 0;
  }

  void processCustomerId(int? customeruserId) {
    userId = customeruserId ?? 0;
    print("Customer User ID in CartCubit: $userId");
  }

  void addToCart(int? productId, int? parentGroupId, int? parentId,
      [CartResponseModel? data]) async {
    try {
      var data = {
        "groupId": apiEndpoints.groupId,
        "parentGroupId": parentGroupId,
        "userId": userId,
        "products": [
          {"productcode": productId, "quantity": 1}
        ]
      };

      emit(CartLoading(CartResponseModel()));
      _apiBase.post(
        apiEndpoints.cartUrl,
        data,
        (data) {
          // ignore: unused_local_variable
          var response = AddCartResponseModel.fromJson(data);
          emit(CartAddSuccess(CartResponseModel()));
        },
        (error) {
          emit(CartError(CartResponseModel(), error.toString()));
        },
      );
    } catch (error) {
      emit(CartError(CartResponseModel(), error.toString()));
    }
  }

  void getCart() async {
    emit(CartLoading(CartResponseModel()));
    try {
      _apiBase.get(
        "${apiEndpoints.cartUrl}${apiEndpoints.placeOrder}/${apiEndpoints.groupId}/$userId",
        (data) {
          var response = CartResponseModel.fromJson(data);
          emit(CartLoaded(response));
        },
        (error) {
          emit(CartError(CartResponseModel(), error.toString()));
        },
      );
    } catch (error) {
      emit(CartError(CartResponseModel(), error.toString()));
    }
  }

  void updateCartProductById({
    int? productcode,
    int? quantity,
    int? amount,
    DiscountType? discountType,
  }) async {
    emit(CartLoading(CartResponseModel()));

    var data = {
      "quantity": quantity,
    };

    if (discountType == DiscountType.Amount) {
      data["amount"] = amount;
    } else if (discountType == DiscountType.Percentage) {
      data["percentage"] = amount;
    }

    try {
      _apiBase.put(
        "${apiEndpoints.cartUrl}/${apiEndpoints.groupId}/$userId/$productcode",
        data,
        (data) {
          // ignore: unused_local_variable
          var response = UpdateCartResponseModel.fromJson(data);
          emit(CartAddSuccess(CartResponseModel()));
        },
        (error) {
          emit(CartError(CartResponseModel(), error.toString()));
        },
      );
    } catch (error) {
      emit(CartError(CartResponseModel(), error.toString()));
    }
  }

  void deleteCartProductById({int? cartId, int? productCode}) async {
    emit(CartLoading(CartResponseModel()));

    try {
      _apiBase.delete(
          "${apiEndpoints.cartUrl}/${apiEndpoints.groupId}/$cartId/$productCode",
          (data) {
        // ignore: unused_local_variable
        var response = AddCartResponseModel.fromJson(data);
        emit(CartAddSuccess(CartResponseModel()));
      }, (error) {
        emit(CartError(CartResponseModel(), error.toString()));
      });
    } catch (e) {
      emit(CartError(CartResponseModel(), e.toString()));
    }
  }
}
