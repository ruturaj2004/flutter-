import 'package:baapapp/constants/api_end_points.dart';
import 'package:baapapp/constants/app_colors.dart';
import 'package:baapapp/logic/order/order_confirmaion/order_confirmaion_cubit.dart';
import 'package:baapapp/utils/app_utils/app_utils.dart';
import 'package:baapapp/utils/app_utils/extensions.dart';
import 'package:baapapp/widgets/custom_circular_progress_indicator.dart';
import 'package:baapapp/widgets/sizedbox_widget.dart';
import 'package:baapapp/widgets/text_widget.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class OrderDetailScreen extends StatefulWidget {
  OrderDetailScreen({
    super.key,
    this.orderId,
    this.dateTime,
  });
  int? orderId;
  String? dateTime;

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  void initState() {
    context
        .read<OrderDetailsCubit>()
        .getOrderConfirmation(ApiEndPoints.experienceGroupId, widget.orderId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        systemOverlayStyle: systemOverLayStyle,
        surfaceTintColor: Colors.white10,
        iconTheme: const IconThemeData(
          color: AppColors.whiteColor,
        ),
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: AppColors.backgroundDark,
        title: TextWidget(
          text: 'Order  #${widget.orderId}',
          fontSize: 18.sp,
          color: AppColors.whiteColor,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.darkGreyColor,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _customerInfo(),
                        _paymentStatusWidget(),
                        SizedBox(
                          height: 5.h,
                        ),
                        _itemWidget()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
          left: 15,
          bottom: 15,
          right: 15,
        ),
        color: AppColors.backgroundDark,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "Made in Paregaon LIVE with ",
              color: Colors.grey,
              fontSize: 13.sp,
            ),
            TextWidget(
              text: "Pride",
              color: const Color(0XFFE676A4),
              fontSize: 12.sp,
            )
          ],
        ),
      ),
    );
  }

  _paymentStatusWidget() {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
        builder: (context, state) {
      if (state is OrderDetailsLoading) {
        return const SizedBox();
      }
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                text: 'Payment Status',
                fontSize: 16.sp,
                color: AppColors.whiteColor,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.lightGreyColor.withOpacity(0.4),
                      width: 2),
                  borderRadius: BorderRadius.circular(32.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 2, bottom: 3),
                  child: TextWidget(
                    text: state.orderModel?.paymentInfo?.paymentStatus ?? "",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: getPaymentStatusColor(
                        state.orderModel?.paymentInfo?.paymentStatus ?? ""),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          const Divider(),
        ],
      );
    });
  }

  Color getPaymentStatusColor(String? status) {
    switch (status) {
      case 'unpaid':
        return AppColors.openColor;
      case 'paid':
        return AppColors.inprogressColor;
      case 'failed':
        return AppColors.openColor;
      default:
        return AppColors.lightGreyColor;
    }
  }

  _itemWidget() {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
        builder: (context, state) {
      if (state is OrderDetailsLoading) {
        return const SizedBox();
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                text: 'Items',
                fontSize: 16.sp,
                color: AppColors.whiteColor,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: TextWidget(
                  text: 'Qty',
                  fontSize: 16.sp,
                  color: AppColors.whiteColor,
                ),
              )
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          const DottedLine(dashColor: AppColors.textGreyColor),
          SizedBox(
            height: 8.h,
          ),
          SizedBox(
            height: 300.h,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.orderModel?.orderDetails?.length ?? 0,
                itemBuilder: (context, index) {
                  // var orderDetailModel = state.orderModel?.orderDetails?[index];
                  return Column(
                    children: [
                      // _orderItemListTile(orderDetailModel),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget(
                                text: state.orderModel?.orderDetails?[index]
                                        .product?.name ??
                                    "",
                                color: AppColors.greenTextColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: TextWidget(
                                  text: state.orderModel?.orderDetails?[index]
                                          .quantity
                                          .toString() ??
                                      "",
                                  color: AppColors.greenTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ],
                          ),
                          // TextWidget(
                          //   text: 'Baffalo Feed',
                          //   color: AppColors.textGreyColor,
                          //   fontSize: 14.sp,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: 'Rate',
                                    color:
                                        AppColors.whiteColor.withOpacity(0.5),
                                    fontSize: 14.sp,
                                  ),
                                  TextWidget(
                                    text:
                                        '${state.orderModel?.orderDetails?.first.product?.regularPrice?.inRupeesFormat() ?? 0}',
                                    color: AppColors.whiteColor,
                                    fontSize: 14.sp,
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  TextWidget(
                                    text: 'Tax',
                                    color:
                                        AppColors.whiteColor.withOpacity(0.5),
                                    fontSize: 14.sp,
                                  ),
                                  TextWidget(
                                    text:
                                        '${state.orderModel?.orderDetails?[index].product?.tax ?? 0} %',
                                    color: AppColors.whiteColor,
                                    fontSize: 14.sp,
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  TextWidget(
                                    text: 'Total',
                                    color:
                                        AppColors.whiteColor.withOpacity(0.5),
                                    fontSize: 14.sp,
                                  ),
                                  TextWidget(
                                    text:
                                        '${state.orderModel?.orderDetails?[index].totalProductPrice?.inRupeesFormat() ?? 0}',
                                    color: AppColors.whiteColor,
                                    fontSize: 14.sp,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8.h, // Adjust the spacing as needed
                      ),
                      const DottedLine(dashColor: AppColors.textGreyColor),
                      SizedBox(
                        height: 10.h, // Adjust the spacing as needed
                      ),
                    ],
                  );
                }),
          ),
          SizedBox(
            height: 15.h, // Adjust the spacing as needed
          ),
          _summaryWidget(),
          const SizedBoxWidget(
            height: 10,
          ),
        ],
      );
    });
  }

  _summaryWidget() {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
        builder: (context, state) {
      if (state is OrderDetailsLoading) {
        return const SizedBox();
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: 'Sumarry : ',
            fontSize: 16.sp,
            color: AppColors.whiteColor,
          ),
          Row(
            children: [
              TextWidget(
                text: 'Total :      ',
                color: AppColors.whiteColor.withOpacity(0.5),
                fontSize: 16.sp,
              ),
              TextWidget(
                text: '${state.orderModel?.subtotal?.inRupeesFormat() ?? 0}',
                color: AppColors.whiteColor,
                fontSize: 16.sp,
              ),
            ],
          ),
          Row(
            children: [
              TextWidget(
                color: AppColors.whiteColor.withOpacity(0.5),
                text: 'Taxes. :    ',
                fontSize: 16.sp,
              ),
              TextWidget(
                color: AppColors.whiteColor,
                text: '${state.orderModel?.taxes?.inRupeesFormat() ?? 0}  ',
                fontSize: 16.sp,
              ),
            ],
          ),
          Row(
            children: [
              TextWidget(
                color: AppColors.greenTextColor,
                text: 'Net Total :',
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
              TextWidget(
                color: AppColors.greenTextColor,
                text:
                    ' ${state.orderModel?.totalCartPrice?.inRupeesFormat() ?? 0}',
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          SizedBoxWidget(
            height: 25.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: 'Delivery Address :',
                fontSize: 16.sp,
                color: AppColors.whiteColor,
              ),
              TextWidget(
                text: state.orderModel?.deliveryInfo?.shippingAddress?.street ??
                    "",
                fontSize: 16.sp,
                color: AppColors.whiteColor,
              ),
              TextWidget(
                text:
                    state.orderModel?.deliveryInfo?.shippingAddress?.locality ??
                        "",
                color: AppColors.whiteColor,
                fontSize: 16.sp,
              ),
              Row(
                children: [
                  TextWidget(
                    text:
                        state.orderModel?.deliveryInfo?.shippingAddress?.city ??
                            "",
                    color: AppColors.whiteColor,
                    fontSize: 16.sp,
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  TextWidget(
                    text:
                        state.orderModel?.deliveryInfo?.shippingAddress?.zip ??
                            "",
                    color: AppColors.whiteColor,
                    fontSize: 16.sp,
                  ),
                ],
              ),
            ],
          ),
          // const SizedBoxWidget(
          //   height: 20,
          // ),
          // Image.asset('assets/images/company.png',
          //     fit: BoxFit.contain, width: double.infinity
          //     // MediaQuery.of(context).size.width,
          //     ),
        ],
      );
    });
  }

  _customerInfo() {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
        builder: (context, state) {
      if (state is OrderDetailsLoading) {
        return const Center(
          child: CustomCircularProgressIndidator(),
        );
      }
      String date = state.orderModel?.createdAt.toString() ?? '';
      DateTime dateTime = DateTime.parse(date);
      DateTime localDateTime = dateTime.toLocal();
      String formattedDate =
          DateFormat('dd MMM yyyy   hh:mm a').format(localDateTime);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: 'Customer Info',
            color: AppColors.whiteColor,
            fontSize: 14.sp,
          ),
          Row(
            children: [
              TextWidget(
                text: state.orderModel?.userId?.name ?? "",
                color: AppColors.greenTextColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                width: 10.w,
              ),
              // Container(
              //   height: 25.h,
              //   width: 100.w,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(32),
              //       color: AppColors.textBlueColor),
              //   child: const Center(
              //     child: TextWidget(
              //       text: "Premium",
              //       color: AppColors.whiteColor,
              //     ),
              //   ),
              // )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              TextWidget(
                text: 'Phone : ',
                color: AppColors.whiteColor.withOpacity(0.5),
                fontSize: 15.sp,
              ),
              TextWidget(
                text: state.orderModel?.userId?.phoneNumber.toString() ?? "",
                color: AppColors.whiteColor,
                fontSize: 15.sp,
              )
            ],
          ),
          Row(
            children: [
              TextWidget(
                text: 'Date :    ',
                color: AppColors.whiteColor.withOpacity(0.5),
                fontSize: 15.sp,
              ),
              TextWidget(
                text: formattedDate,
                color: AppColors.greenTextColor,
                fontSize: 15.sp,
                // fontWeight: FontWeight.bold,
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          const Divider(),
        ],
      );
    });
  }
}
