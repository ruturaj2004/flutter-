import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:salesman_app/constant/app_color.dart';
import 'package:salesman_app/constant/app_string.dart';
import 'package:salesman_app/logic/cart_logic/cart_cubit_cubit.dart';
import 'package:salesman_app/logic/cart_logic/cart_cubit_state.dart';
import 'package:salesman_app/model/product_response_model/product_response_model.dart';
import 'package:salesman_app/utils/routes/routes.dart';
import 'package:salesman_app/utils/snackbar/snackbar.dart';
import 'package:salesman_app/widget/button_widget.dart';
import 'package:salesman_app/widget/cricular_progress_indicator.dart';
import 'package:salesman_app/widget/custom_icon_widget.dart';
import 'package:salesman_app/widget/quantity_widget.dart';
import 'package:salesman_app/widget/sized_box_widget.dart';
import 'package:salesman_app/widget/textFormFiled.dart';
import 'package:salesman_app/widget/text_widget.dart';

enum DiscountType { Percentage, Amount }

// ignore: must_be_immutable
class ShoppingCart extends StatefulWidget {
  ShoppingCart({
    Key? key,
    this.productcode,
    this.quantity,
  }) : super(key: key);
  int? productcode;
  int? quantity;
  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _disCountController = TextEditingController();
  DiscountType _selectedDiscountType = DiscountType.Percentage;

  @override
  void initState() {
    context.read<CartCubit>().getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const TextWidget(data: AppString.shopingCart),
          leading: InkWell(
            onTap: () {
              context.pop();
            },
            child: IconWidget(iconData: Icons.arrow_back),
          ),
        ),
        body: Column(
          children: [
            const Divider(
              color: AppColors.blackColor,
              indent: 2,
              endIndent: 2,
            ),
            _addCartWidget(),
            _paymentWidget(),
          ],
        ),
      ),
    );
  }

  _addCartWidget() {
    return Expanded(
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartError) {
            return Center(
              child: TextWidget(data: 'Error: ${state.error}'),
            );
          }
          if (state is CartLoaded) {
            if (state.data?.data?.products?.isEmpty ?? false) {
              return Center(
                child: AlertDialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  content: SizedBoxWidget(
                    height: 220.h,
                    width: 100.w,
                    child: Column(
                      children: [
                        Lottie.asset(
                          'assets/animation/empty_cart.json',
                          height: 205.h,
                          fit: BoxFit.cover,
                        ),
                        TextWidget(
                          data: 'Your cart is empty!',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
            return ListView.builder(
              itemCount: state.data?.data?.products?.length ?? -1,
              itemBuilder: (context, index) {
                final product = state.data?.data?.products?[index];
                widget.productcode = product?.productcode?.productcode;
                widget.quantity = state.data?.data?.products?[index].quantity;
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15),
                  child: Row(
                    children: [
                      SizedBoxWidget(
                        height: 75,
                        width: 75,
                        child: Image.network(
                          "${product?.productcode?.pictures?[0]}",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBoxWidget(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              data: AppString.productName,
                              color: AppColors.textGrey,
                              fontSize: 11.sp,
                            ),
                            const SizedBoxWidget(height: 5),
                            TextWidget(
                              data: product!.productcode?.name ?? "",
                              overflow: TextOverflow.ellipsis,
                              fontSize: 12.sp,
                            ),
                            const SizedBoxWidget(height: 8),
                            CustomOutlinedButton(
                              onPressed: () {
                                _discountWidget(context);
                              },
                              buttonText: "Discount",
                              fontSize: 12.sp,
                              backgroundColor: AppColors.backgroundDark,
                              customBorderSide: const BorderSide(),
                              buttonHeight: 22.h,
                              buttonWidth: 100.w,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            data: AppString.price,
                            color: AppColors.textGrey,
                            fontSize: 11.sp,
                          ),
                          SizedBoxWidget(height: 6.h),
                          Row(
                            children: [
                              TextWidget(
                                data: product.productcode?.regularPrice
                                    .toString(),
                                fontSize: 10.sp,
                              ),
                              SizedBoxWidget(width: 23.h),
                              TextWidget(
                                data:
                                    "Rs.${product.productcode?.marketPrice ?? ""}",
                                color: AppColors.textGrey,
                                fontSize: 10.sp,
                                lineThrough: true,
                              ),
                            ],
                          ),
                          SizedBoxWidget(height: 10.h),
                          Row(
                            children: [
                              QuantityWidget(
                                quantity: product.quantity ?? 0,
                                onIncrementQuantity: (value) {
                                  state.data?.data?.products?[index].quantity =
                                      value;
                                  context
                                      .read<CartCubit>()
                                      .updateCartProductById(
                                        productcode: state
                                            .data
                                            ?.data
                                            ?.products?[index]
                                            .productcode
                                            ?.productcode,
                                        quantity: state.data?.data
                                            ?.products?[index].quantity,
                                      );

                                  print("onIncrementQuantity");
                                },
                                onDecrementQuantity: (value) {
                                  state.data?.data?.products?[index].quantity =
                                      value;
                                  context
                                      .read<CartCubit>()
                                      .updateCartProductById(
                                        productcode: state
                                            .data
                                            ?.data
                                            ?.products?[index]
                                            .productcode
                                            ?.productcode,
                                        quantity: state.data?.data
                                            ?.products?[index].quantity,
                                      );
                                  print("onDecrementQuantity");
                                },
                              ),
                              SizedBoxWidget(width: 15.w),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const TextWidget(
                                            data: "Confirmation"),
                                        content: const TextWidget(
                                          data:
                                              "Are you sure you want to delete this item from the cart?",
                                        ),
                                        actions: [
                                          CustomOutlinedButton(
                                            backgroundColor: Colors.red,
                                            borderRadius: 10,
                                            buttonText: "NO",
                                            onPressed: () {
                                              context.pop();
                                            },
                                          ),
                                          CustomOutlinedButton(
                                            backgroundColor: Colors.green,
                                            borderRadius: 10,
                                            buttonText: "Yes",
                                            onPressed: () {
                                              final cartId =
                                                  state.data?.data?.cartId ?? 0;
                                              print("shoping_cart_Id${cartId}");
                                              context
                                                  .read<CartCubit>()
                                                  .deleteCartProductById(
                                                    cartId: cartId,
                                                    productCode: product
                                                            .productcode
                                                            ?.productcode ??
                                                        0,
                                                  );
                                              context
                                                  .read<CartCubit>()
                                                  .getCart();
                                              SnackBarWidget.showSnackbar(
                                                color: AppColors.redColor,
                                                context,
                                                "Deleted from Cart",
                                              );
                                              context.pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: IconWidget(
                                  iconData: Icons.delete,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  _paymentWidget() {
    return Container(
      height: 113.h,
      width: 360.w,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              data: "Order Summary",
              fontSize: 11.sp,
              color: AppColors.textGrey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      data: "Total",
                      fontWeight: FontWeight.bold,
                    ),
                    TextWidget(
                      data: "Taxes",
                      fontWeight: FontWeight.bold,
                    ),
                    TextWidget(
                      data: "Discount",
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBoxWidget(
                  width: 10,
                ),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state is CartLoading) {
                      return const Center(
                        child: CircularProgressIndicatorWidget(),
                      );
                    }
                    if (state is CartLoaded) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            data: state.data!.data!.subtotal.toString(),
                            fontWeight: FontWeight.bold,
                          ),
                          TextWidget(
                            data: state.data!.data?.taxes.toString() ?? "",
                            fontWeight: FontWeight.bold,
                          ),
                          TextWidget(
                            data: state.data!.data?.saving.toString() ?? "",
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      );
                    }
                    return const TextWidget(
                      data: "Null",
                    );
                  },
                ),
                Column(
                  children: [
                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        if (state is CartLoading) {
                          return const Center(
                            child: CircularProgressIndicatorWidget(),
                          );
                        }
                        if (state is CartLoaded) {
                          return Row(
                            children: [
                              TextWidget(
                                data: "Net Pay",
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                                color: AppColors.successColor,
                              ),
                              SizedBoxWidget(
                                width: 6.w,
                              ),
                              TextWidget(
                                data:
                                    state.data!.data!.totalCartPrice.toString(),
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                                color: AppColors.successColor,
                              ),
                            ],
                          );
                        }
                        return const TextWidget(
                          data: "Null",
                        );
                      },
                    ),
                    SizedBoxWidget(
                      height: 15.h,
                    ),
                    Container(
                      height: 30.h,
                      width: 110.w,
                      child: OutlinedButton(
                        onPressed: () {
                          context.push(Routes.paymentscreen);
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        child: const TextWidget(
                          data: AppString.payment,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _discountWidget(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: const Color(0xffEAEBF2),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.22,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextWidget(
                        data: "Add Discount",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          DropdownButton<DiscountType>(
                            value: _selectedDiscountType,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedDiscountType = newValue!;
                              });
                            },
                            items: const <DropdownMenuItem<DiscountType>>[
                              DropdownMenuItem(
                                value: DiscountType.Percentage,
                                child: TextWidget(data: 'Percentage'),
                              ),
                              DropdownMenuItem(
                                value: DiscountType.Amount,
                                child: TextWidget(data: 'Amount'),
                              ),
                            ],
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            child: CustomTextFormFieldWidget(
                              controller: _disCountController,
                              autofocus: true,
                              keyboardType: TextInputType.number,
                               hintText: "Discount",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          CustomOutlinedButton(
                            borderRadius: 10.r,
                            onPressed: () {
                              final discountValue =
                                  int.parse(_disCountController.text);
                              if (_selectedDiscountType ==
                                  DiscountType.Percentage) {
                                print('Discount Type: Percentage');
                                print('Discount Value: $discountValue');
                                context.read<CartCubit>().updateCartProductById(
                                      productcode: widget.productcode,
                                      quantity: widget.quantity,
                                      discountType: DiscountType.Percentage,
                                      amount: discountValue,
                                    );
                              } else {
                                print('Discount Type: Amount');
                                print('Discount Value: $discountValue');
                                context.read<CartCubit>().updateCartProductById(
                                      productcode: widget.productcode,
                                      quantity: widget.quantity,
                                      discountType: DiscountType.Amount,
                                      amount: discountValue,
                                    );
                              }
                              _disCountController.clear();
                              Navigator.pop(context);
                            },
                            buttonText: "Add",
                          ),
                         const SizedBoxWidget(width: 50,),
                          CustomOutlinedButton(
                             borderRadius: 10.r,
                            onPressed: () {
                              context.pop();
                            },
                            buttonText: AppString.cancel,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
