// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:salesman_app/constant/app_color.dart';
import 'package:salesman_app/constant/app_string.dart';
import 'package:salesman_app/logic/add_product_logic/add_product_cubit.dart';
import 'package:salesman_app/logic/search_customer_logic/search_customer_cubit.dart';
import 'package:salesman_app/logic/search_products_logic/search_products_cubit.dart';
// import 'package:salesman_app/model/create_customer_model/create_customer_model.dart';
import 'package:salesman_app/model/search-customer_response_model/search_customer_response_model.dart';
import 'package:salesman_app/utils/preferences/local_preferences.dart';
import 'package:salesman_app/utils/routes/routes.dart';
import 'package:salesman_app/widget/button_widget.dart';
import 'package:salesman_app/widget/cricular_progress_indicator.dart';
import 'package:salesman_app/widget/custom_icon_widget.dart';
import 'package:salesman_app/widget/sized_box_widget.dart';
import 'package:salesman_app/widget/textFormFiled.dart';
import 'package:salesman_app/widget/text_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../logic/cart_logic/cart_cubit_cubit.dart';
import '../../logic/cart_logic/cart_cubit_state.dart';
import '../../logic/create_customer_logic/create_customer_cubit.dart';
import '../../logic/create_customer_logic/create_customer_state.dart';
import '../../model/product_response_model/product_response_model.dart';
import '../../widget/skeleton_widget .dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({
    super.key,
    this.groupId,
    this.item,
  });
  final int? groupId;
  final ProductList? item;

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _phoneGpayController = TextEditingController();
  final TextEditingController _houseController = TextEditingController();
  final TextEditingController _villageController = TextEditingController();
  final TextEditingController _talukaController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _searchProductsController =
      TextEditingController();
  // add product TextEditingController
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _regularPriceController = TextEditingController();
  final TextEditingController _buyingPrinceController = TextEditingController();
  final TextEditingController _marketPriceController = TextEditingController();
  final TextEditingController _GSTController = TextEditingController();
  final TextEditingController _IGSTController = TextEditingController();
  final TextEditingController _CGSTController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isSearched = false;
  final FocusNode _namefocus = FocusNode();
  searchedItem? selectedCustomer;
  List<Key> slidableKeys = [];

  @override
  void initState() {
    context.read<SearchProductsCubit>().searchProducts();

    context.read<SearchCustomerCubit>().searchCustomer(
          groupId: widget.groupId,
        );


    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _namefocus.dispose();
  }

  int? cartId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundDark,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _headerWidget(),
                  const SizedBoxWidget(
                    height: 5,
                  ),
                  const Divider(),
                  _searchCustomerWidget(context),
                  SizedBoxWidget(
                    height: isSearched ? 130.h : 12.h,
                  ),
                  _searchProductWidget(),
                  const Divider(),
                  _productListWidget(),
                ],
              ),
              Positioned(
                top: 110,
                child: _customerInfoWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }

  _headerWidget() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            context.pop();
          },
          child: IconWidget(
              iconData: Icons.arrow_circle_left_outlined, size: 25.w),
        ),
        const SizedBoxWidget(
          width: 10,
        ),
        TextWidget(
          data: AppString.neworders,
          fontWeight: FontWeight.bold,
          fontSize: 15.sp,
        ),
        const Spacer(),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartAddSuccess) {
              context.read<CartCubit>().getCart();

              return Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: InkWell(
                  onTap: () {
                    context.push(Routes.shopingCart);
                  },
                  child: Badge.count(
                    count: state.data?.data?.products?.length ?? 0,
                    backgroundColor: const Color(0XFF8DE009),
                    smallSize: 10.h,
                    largeSize: 17.h,
                    textColor: Colors.black,
                    textStyle: TextStyle(fontSize: 13.sp),
                    child: Icon(Icons.shopping_bag_outlined, size: 30.h),
                  ),
                ),
              );
            }
            return Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: InkWell(
                onTap: () {
                  context.push(Routes.shopingCart);
                },
                child: Badge.count(
                  count: state.data?.data?.products?.length ?? 0,
                  backgroundColor: const Color(0XFF8DE009),
                  smallSize: 10.h,
                  largeSize: 17.h,
                  textColor: Colors.black,
                  textStyle: TextStyle(fontSize: 13.sp),
                  child: Icon(Icons.shopping_bag_outlined, size: 30.h),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  _searchCustomerWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 45.h,
          width: 280.w,
          child: CustomTextFormFieldWidget(
            controller: _searchController,
            hintText: AppString.searchCustomer,
            onChanged: (String? value) {
              isSearched = true;
              if (value?.isEmpty ?? true) {
                context.read<SearchCustomerCubit>().clearSearchResults();
                setState(() {
                  selectedCustomer = null; //data clear hoto
                });
              } else {
                context.read<SearchCustomerCubit>().searchCustomer(
                      groupId: widget.groupId,
                      value: _searchController.text,
                    );
              }
            },
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.r),
              ),
            ),
          ),
        ),
        Container(
          height: 45.h,
          width: 40.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: IconButton(
            onPressed: () {
              _createCustomer();
            },
            icon: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }

  _customerInfoWidget() {
    TextSpan highlightSearchedLetter(String text, String? searchedLetter) {
      if (searchedLetter == null || searchedLetter.isEmpty) {
        return TextSpan(text: text);
      }

      final RegExp regex = RegExp(searchedLetter, caseSensitive: false);
      final matches = regex.allMatches(text);

      if (matches.isEmpty) {
        return TextSpan(text: text);
      }
      List<TextSpan> children = [];
      var lastMatchEnd = 0;
      var firstMatchHighlighted = false;

      for (var match in matches) {
        children.add(TextSpan(
          text: text.substring(lastMatchEnd, match.start),
        ));

        if (!firstMatchHighlighted) {
          children.add(TextSpan(
            text: text.substring(match.start, match.end),
            style: const TextStyle(
              backgroundColor: Colors.yellow,
            ),
          ));
          firstMatchHighlighted = true;
        } else {
          children.add(TextSpan(
            text: text.substring(match.start, match.end),
          ));
        }
        lastMatchEnd = match.end;
      }

      children.add(TextSpan(
        text: text.substring(lastMatchEnd),
      ));

      return TextSpan(children: children);
    }

    return
     BlocBuilder<SearchCustomerCubit, SearchCustomerState>(
      builder: (context, state) {
        if (state is SearchCustomerLoaded) {
          if (selectedCustomer != null) {
            return InkWell(
              onTap: () async {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 130.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: Colors.white),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          data: selectedCustomer != null
                              ? selectedCustomer!.name ?? ""
                              : "",
                        ),
                        SizedBox(height: 5.h),
                        const TextWidget(
                          data: AppString.phoneNumber,
                          color: AppColors.textGrey,
                        ),
                        TextWidget(
                          data: selectedCustomer != null
                              ? selectedCustomer!.phoneNumber.toString()
                              : "",
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const TextWidget(
                                  data: AppString.villageName,
                                  color: AppColors.textGrey,
                                ),
                                TextWidget(
                                  data: selectedCustomer != null
                                      ? selectedCustomer!.location ?? ""
                                      : "",
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const TextWidget(
                                    data: AppString.pinCode,
                                    color: AppColors.textGrey,
                                  ),
                                  TextWidget(
                                    data: selectedCustomer != null
                                        ? selectedCustomer!.pinCode.toString()
                                        : "",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Column(
              children: [
                for (var customer in state.searchCustomer ?? [])
                  Container(
                    height: 40.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: Colors.white),
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            _searchController.text = customer.name;
                            setState(() {
                              selectedCustomer = customer;
                              int? customerUserid = selectedCustomer?.userId;
                              context
                                  .read<CartCubit>()
                                  .processCustomerId(customerUserid);
                                    context.read<CartCubit>().getCart();
                            });
                            context.read<SearchCustomerCubit>();
                            // _searchController.clear();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(
                                highlightSearchedLetter(
                                  customer.name ?? "",
                                  _searchController.text,
                                ),
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 40),
                                child: TextWidget(
                                  data: customer.phoneNumber?.toString() ?? "",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            );
          }
        } else {
          return TextWidget(
            data: isSearched ? "Customer Not Found" : "",
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          );
        }
      },
    );
  }

  _searchProductWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          data: AppString.product,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 42.h,
              width: 240.w,
              child: CustomTextFormFieldWidget(
                hintText: AppString.searchProduct,
                controller: _searchProductsController,
                onChanged: (String? value) {
                  if ((value?.length ?? 0) >= 0) {
                    context.read<SearchProductsCubit>().searchProducts(
                          groupId: widget.groupId,
                          value: _searchProductsController.text,
                        );
                  }
                },
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.r),
                  ),
                ),
              ),
            ),
            Container(
              height: 44.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(color: AppColors.borderColor),
              ),
              child: IconButton(
                onPressed: () {
                  _openCameraWidget(context);
                  print(
                      "**********************Open Camera***********************");
                },
                icon: IconWidget(iconData: Icons.qr_code_scanner),
              ),
            ),
            Container(
              height: 44.h,
              width: 40.w,
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(5.r),
                  border: Border.all(color: AppColors.borderColor)),
              child: IconButton(
                onPressed: () {
                  _createProduct();
                },
                icon: IconWidget(iconData: Icons.add),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _productListWidget() {
    return BlocBuilder<SearchProductsCubit, SearchProductsState>(
      builder: (context, state) {
        if (state is SearchProductsLoading) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.searchproducts?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Row(
                    children: [
                      const SkeletonWidget(
                        height: 65,
                        width: 75,
                      ),
                      const SizedBoxWidget(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SkeletonWidget(
                              height: 12,
                              width: 80,
                              borderRadius: BorderRadius.circular(3.r),
                            ),
                            const SizedBoxWidget(height: 5),
                            SkeletonWidget(
                              height: 12,
                              width: 80,
                              borderRadius: BorderRadius.circular(3.r),
                            ),
                            const SizedBoxWidget(height: 5),
                            SkeletonWidget(
                              height: 25,
                              width: 85,
                              borderRadius: BorderRadius.circular(3.r),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBoxWidget(
                            height: 5,
                          ),
                          SkeletonWidget(
                            height: 12,
                            width: 50,
                            borderRadius: BorderRadius.circular(3.r),
                          ),
                          const SizedBoxWidget(height: 6),
                          Row(
                            children: [
                              SkeletonWidget(
                                height: 10,
                                width: 40,
                                borderRadius: BorderRadius.circular(3.r),
                              ),
                              const SizedBoxWidget(width: 23),
                              SkeletonWidget(
                                height: 10,
                                width: 40,
                                borderRadius: BorderRadius.circular(3.r),
                              ),
                            ],
                          ),
                          const SizedBoxWidget(
                            height: 10,
                          ),
                          SkeletonWidget(
                            height: 25.h,
                            width: 85.w,
                            borderRadius: BorderRadius.circular(3.r),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else if (state is SearchProductsLoaded) {
          if (state.searchproducts?.isEmpty ?? true) {
            return Center(
              child: TextWidget(
                data: "Product not found",
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            );
          } else {
            return Expanded(
              child: ListView.builder(
                itemCount: state.searchproducts?.length ?? 0,
                itemBuilder: (context, index) {
                  final product = state.searchproducts?[index];
                  final Key slidableKey =
                      UniqueKey(); // Unique key for each Slidable

                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Slidable(
                      key: slidableKey,
                      startActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        dismissible: DismissiblePane(onDismissed: () {
                          if (product != null) {
                            context.read<CartCubit>().addToCart(
                                  product.productcode,
                                  widget.groupId,
                                  product.parentId,
                                );
                            print(
                                'Product added to cart: ${product.productcode}');
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  content: SizedBoxWidget(
                                    height: 235,
                                    width: 120,
                                    child: Column(
                                      children: [
                                        Lottie.asset(
                                          'assets/animation/loading.json',
                                          fit: BoxFit.cover,
                                        ),
                                        TextWidget(
                                          data:
                                              'तुमची वस्तू कार्टमध्ये जोडली आहे ',
                                          color: const Color.fromARGB(
                                              255, 40, 110, 42),
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                          Future.delayed(const Duration(seconds: 1), () {
                            Navigator.of(context).pop();
                          });

                          // Remove the Slidable widget from the tree
                          setState(() {
                            slidableKeys.remove(slidableKey);
                          });
                        }),
                        children: [
                          SlidableAction(
                            icon: Icons.card_travel_rounded,
                            onPressed: (context) {},
                            backgroundColor: AppColors.successColor,
                          )
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          context.push(
                            Routes.detailScreen,
                            extra: {"searchmodel": product},
                          );
                        },
                        child: Row(
                          children: [
                            SizedBoxWidget(
                              height: 65,
                              width: 75,
                              child: Image.network(
                                "${product?.pictures?[0]}",
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBoxWidget(
                              width: 10,
                            ),
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
                                    data: product?.name ?? "",
                                        overflow: TextOverflow.ellipsis,
                                    fontSize: 12.sp,
                                  ),
                                  const SizedBoxWidget(height: 5),
                                  Container(
                                    height: 25.h,
                                    width: 85.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.r),
                                      border: Border.all(
                                        color: AppColors.borderColor,
                                      ),
                                    ),
                                    child: Center(
                                      child: TextWidget(
                                        data: product?.category ?? "Null",
                                        color: AppColors.textGrey,
                                        fontSize: 11.sp,
                                      ),
                                    ),
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
                                const SizedBoxWidget(height: 6),
                                Row(
                                  children: [
                                    TextWidget(
                                      data:
                                          product?.buyingPrice.toString() ?? "",
                                      fontSize: 10.sp,
                                    ),
                                    const SizedBoxWidget(width: 23),
                                    TextWidget(
                                      data:
                                          product?.marketPrice.toString() ?? "",
                                      color: AppColors.textGrey,
                                      fontSize: 10.sp,
                                      lineThrough: true,
                                    ),
                                  ],
                                ),
                                const SizedBoxWidget(
                                  height: 10,
                                ),
                                BlocBuilder<CartCubit, CartState>(
                                  builder: (context, cartState) {
                                    return CustomOutlinedButton(
                                      onPressed: () async {
                                        final cartCubit =
                                            context.read<CartCubit>();
                                        if (product != null) {
                                          cartCubit.addToCart(
                                            product.productcode,
                                            widget.groupId,
                                            product.parentId,
                                          );

                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                content: SizedBoxWidget(
                                                  height: 235,
                                                  width: 120,
                                                  child: Column(
                                                    children: [
                                                      Lottie.asset(
                                                        'assets/animation/loading.json',
                                                        fit: BoxFit.cover,
                                                      ),
                                                      TextWidget(
                                                        data:
                                                            'तुमची वस्तू कार्टमध्ये जोडली आहे ',
                                                        color: const Color
                                                            .fromARGB(
                                                          255,
                                                          40,
                                                          110,
                                                          42,
                                                        ),
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                          await Future.delayed(
                                            const Duration(seconds: 2),
                                          );
                                          Navigator.of(context).pop();
                                        }
                                      },
                                      buttonHeight: 25.h,
                                      buttonWidth: 95.w,
                                      borderRadius: 3,
                                      buttonText: "Add Cart",
                                      fontSize: 10.sp,
                                      backgroundColor: AppColors.backgroundDark,
                                      textSize: 0.1,
                                      customBorderSide: const BorderSide(),
                                    );
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        }
        return Center(
            child: TextWidget(
          data: "Product Not Found",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ));
      },
    );
  }

  _createCustomer() {
    bool isValid = true;
    bool disabledValidation = false;

    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: const Color(0xffEAEBF2),
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              top: 20.h,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: BlocListener<CreateCustomerCubit, CreateCustomerState>(
              listener: (context, state) {
                if (state is CreateCustomerSuccess) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const TextWidget(
                        data: 'Success',
                        color: Colors.green,
                      ),
                      content: const TextWidget(
                          data: 'Customer created successfully!',
                          color: Colors.green),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child:
                              const TextWidget(data: 'OK', color: Colors.green),
                        ),
                      ],
                    ),
                  );
                } else if (state is CreateCustomerError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage ?? 'Unknown error'),
                    ),
                  );
                }
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.32,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.w),
                      child: TextWidget(
                          data: AppString.createCustomer,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBoxWidget(height: 10),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextFormFieldWidget(
                                  autovalidateMode: disabledValidation
                                      ? AutovalidateMode.disabled
                                      : AutovalidateMode.onUserInteraction,
                                  controller: _nameController,
                                  autofocus: true,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'[a-zA-Z\s]'),
                                    ),
                                  ],
                                  hintText: "Enter Name:",
                                  width: 280.w,
                                  onChanged: (value) {
                                    if (_nameController.text.isNotEmpty) {
                                      disabledValidation = true;
                                    }
                                  },
                                  height: isValid ? 45.h : 60.h,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter a name";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBoxWidget(height: 5),
                                CustomTextFormFieldWidget(
                                  autovalidateMode: disabledValidation
                                      ? AutovalidateMode.disabled
                                      : AutovalidateMode.onUserInteraction,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  keyboardType: TextInputType.number,
                                  controller: _phoneNumberController,
                                  hintText: "Phone",
                                  width: 200.w,
                                  height: isValid ? 45.h : 60.h,
                                  validator: (value) {
                                    if (_phoneNumberController
                                        .text.isNotEmpty) {
                                      disabledValidation = true;
                                    }
                                    if (value!.length != 10) {
                                      return "Please enter a valid number";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBoxWidget(height: 5),
                                CustomTextFormFieldWidget(
                                  autovalidateMode: disabledValidation
                                      ? AutovalidateMode.disabled
                                      : AutovalidateMode.onUserInteraction,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'[a-zA-Z\s]'),
                                    ),
                                  ],
                                  controller: _locationController,
                                  hintText: "Location",
                                  width: 200.w,
                                  height: isValid ? 45.h : 60.h,
                                  validator: (value) {
                                    if (_locationController.text.isNotEmpty) {
                                      disabledValidation = true;
                                    }
                                    if (value!.isEmpty) {
                                      return "please enter a name";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBoxWidget(height: 5),
                                CustomTextFormFieldWidget(
                                  autovalidateMode: disabledValidation
                                      ? AutovalidateMode.disabled
                                      : AutovalidateMode.onUserInteraction,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(6),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  keyboardType: TextInputType.number,
                                  controller: _pincodeController,
                                  hintText: "PIN Code",
                                  width: 200.w,
                                  height: isValid ? 45.h : 60.h,
                                  validator: (value) {
                                    if (_pincodeController.text.isNotEmpty) {
                                      disabledValidation = true;
                                    }
                                    if (value!.length != 6) {
                                      return "please enter a valid pincode";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBoxWidget(height: 10),
                                TextWidget(
                                    data: 'Payment Info',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                                const SizedBoxWidget(height: 7),
                                CustomTextFormFieldWidget(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  keyboardType: TextInputType.number,
                                  controller: _phoneGpayController,
                                  hintText: "Phone /GPay Number",
                                  width: 200.w,
                                  height: 45.h,
                                ),
                                const SizedBoxWidget(height: 10),
                                TextWidget(
                                    data: 'Address:',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                                const SizedBoxWidget(height: 2),
                                CustomTextFormFieldWidget(
                                  controller: _houseController,
                                  hintText: "House /Street",
                                  width: 320.w,
                                  height: 45.h,
                                ),
                                const SizedBoxWidget(height: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextFormFieldWidget(
                                      width: 160.w,
                                      height: 45.h,
                                      hintText: "Town /Village",
                                      controller: _villageController,
                                      border: const OutlineInputBorder(),
                                    ),
                                    // ignore: prefer_const_constructors
                                    SizedBoxWidget(width: 5),

                                    CustomTextFormFieldWidget(
                                      width: 150.w,
                                      height: 45.h,
                                      hintText: "Taluka",
                                      controller: _talukaController,
                                      border: const OutlineInputBorder(),
                                    ),
                                  ],
                                ),
                                const SizedBoxWidget(height: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextFormFieldWidget(
                                      width: 160.w,
                                      height: 35.h,
                                      hintText: "District",
                                      controller: _districtController,
                                      border: const OutlineInputBorder(),
                                    ),
                                    // ignore: prefer_const_constructors
                                    SizedBoxWidget(width: 5),

                                    CustomTextFormFieldWidget(
                                      width: 150.w,
                                      height: 35.h,
                                      hintText: "State",
                                      controller: _stateController,
                                      border: const OutlineInputBorder(),
                                    ),
                                  ],
                                ),
                                const SizedBoxWidget(height: 10),
                                CustomTextFormFieldWidget(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(6),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  keyboardType: TextInputType.number,
                                  width: 160.w,
                                  height: 35.h,
                                  hintText: "Pin Code",
                                  controller: _pincodeController,
                                  border: const OutlineInputBorder(),
                                ),
                                const SizedBoxWidget(height: 10),
                                Row(
                                  children: [
                                    BlocBuilder<CreateCustomerCubit,
                                        CreateCustomerState>(
                                      builder: (context, state) {
                                        if (state is CreateCustomerLoading) {
                                          return Container(
                                            width: 80.w,
                                            color: AppColors.borderColor,
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child:
                                                      CircularProgressIndicatorWidget(),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                        return CustomOutlinedButton(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              context
                                                  .read<CreateCustomerCubit>()
                                                  .createCustomer(
                                                      _nameController.text,
                                                      int.tryParse(
                                                          _phoneNumberController
                                                              .text),
                                                      _locationController.text,
                                                      int.tryParse(
                                                          _pincodeController
                                                              .text),
                                                      context);
                                              _nameController.clear();
                                              _phoneNumberController.clear();
                                              _locationController.clear();
                                              _pincodeController.clear();
                                            } else {
                                              setState(() {
                                                isValid = false;
                                              });
                                            }
                                          },
                                          buttonText: AppString.save,
                                          fontSize: 15.sp,
                                          backgroundColor:
                                              AppColors.borderColor,
                                        );
                                      },
                                    ),
                                    const SizedBoxWidget(width: 3),
                                    CustomOutlinedButton(
                                      onPressed: () {
                                        context.pop();
                                      },
                                      buttonText: AppString.cancel,
                                      fontSize: 15.sp,
                                      backgroundColor: AppColors.backgroundDark,
                                      customBorderSide: const BorderSide(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  _createProduct() {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: const Color(0xffEAEBF2),
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 20.h,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: BlocListener<AddProductCubit, AddProductState>(
            listener: (context, state) {
              if (state is AddProductSuccess) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const TextWidget(
                      data: 'Success',
                      color: Colors.green,
                    ),
                    content: const TextWidget(
                        data: 'Product Add successfully!', color: Colors.green),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        child:
                            const TextWidget(data: 'OK', color: Colors.green),
                      ),
                    ],
                  ),
                );
              } else if (state is AddProductError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage ?? 'Unknown error'),
                  ),
                );
              }
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.32,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: TextWidget(
                        data: AppString.createProduct,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBoxWidget(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextFormFieldWidget(
                              autofocus: true,
                              controller: _productNameController,
                              hintText: "Product Name",
                              height: 45.h,
                              width: double.infinity,
                            ),
                            const SizedBoxWidget(height: 5),
                            CustomTextFormFieldWidget(
                              controller: _regularPriceController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              hintText: "Regular Price",
                              width: double.infinity,
                              height: 45.h,
                            ),
                            const SizedBoxWidget(height: 5),
                            CustomTextFormFieldWidget(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.number,
                                controller: _buyingPrinceController,
                                hintText: "Buying Price",
                                width: double.infinity,
                                height: 45.h),
                            const SizedBoxWidget(height: 5),
                            CustomTextFormFieldWidget(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              controller: _marketPriceController,
                              hintText: "Market Price",
                              width: double.infinity,
                              height: 45.h,
                            ),
                            const SizedBoxWidget(height: 10),
                            const SizedBoxWidget(height: 5),
                            CustomTextFormFieldWidget(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              controller: _GSTController,
                              hintText: "GST",
                              width: double.infinity,
                              height: 45.h,
                            ),
                            const SizedBoxWidget(height: 5),
                            CustomTextFormFieldWidget(
                              controller: _IGSTController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              hintText: "IGST",
                              width: double.infinity,
                              height: 45.h,
                            ),
                            const SizedBoxWidget(height: 5),
                            CustomTextFormFieldWidget(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.number,
                                controller: _CGSTController,
                                hintText: "CGST",
                                width: double.infinity,
                                height: 45.h),
                            const SizedBoxWidget(height: 5),
                            Row(
                              children: [
                                BlocBuilder<AddProductCubit, AddProductState>(
                                  builder: (context, state) {
                                    if (state is AddProductLoading) {
                                      return Container(
                                        width: 80.w,
                                        color: AppColors.borderColor,
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child:
                                                  CircularProgressIndicatorWidget(),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                    return CustomOutlinedButton(
                                      onPressed: () {
                                        context
                                            .read<AddProductCubit>()
                                            .addproduct(
                                              _productNameController.text,
                                              int.tryParse(
                                                  _regularPriceController.text),
                                              int.tryParse(
                                                  _buyingPrinceController.text),
                                              int.tryParse(
                                                  _marketPriceController.text),
                                              int.tryParse(_GSTController.text),
                                              int.tryParse(
                                                  _IGSTController.text),
                                              int.tryParse(
                                                  _CGSTController.text),
                                            );

                                        _productNameController.clear();
                                        _regularPriceController.clear();
                                        _CGSTController.clear();
                                        _GSTController.clear();
                                        _IGSTController.clear();
                                        _marketPriceController.clear();
                                        _buyingPrinceController.clear();
                                      },
                                      buttonText: AppString.save,
                                      fontSize: 15.sp,
                                      backgroundColor: AppColors.borderColor,
                                    );
                                  },
                                ),
                                const SizedBoxWidget(width: 3),
                                CustomOutlinedButton(
                                  onPressed: () {
                                    context.pop();
                                  },
                                  buttonText: AppString.cancel,
                                  fontSize: 15.sp,
                                  backgroundColor: AppColors.backgroundDark,
                                  customBorderSide: const BorderSide(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _openCameraWidget(BuildContext context) async {
    var status = await Permission.camera.status;
    if (status.isDenied) {
      await Permission.camera.request();
      status = await Permission.camera.status;
    }

    if (status.isGranted) {
      try {
        String barcode = await FlutterBarcodeScanner.scanBarcode(
            "#0000FF", "Cancel", true, ScanMode.DEFAULT);

        if (barcode != "-1") {
          // ignore: use_build_context_synchronously
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Scanned QR Code'),
                content: Text(barcode),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      } catch (e) {
        print('Error: $e');
      }
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Permission Required'),
            content:
                const Text('Camera permission is required to scan QR codes.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
