import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:salesman_app/constant/app_color.dart';
import 'package:salesman_app/constant/app_string.dart';
import 'package:salesman_app/utils/routes/routes.dart';
import 'package:salesman_app/widget/bottom_navigation_bar.dart';
import 'package:salesman_app/widget/custom_icon_widget.dart';
import 'package:salesman_app/widget/emp_header_widget.dart';
import 'package:salesman_app/widget/sized_box_widget.dart';
import 'package:salesman_app/widget/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: EmpHeaderWidget(),
                  ),
                  InkWell(
                    onTap: () {
                      context.push(Routes.profileScreen);
                    },
                    child: IconWidget(
                      iconData: Icons.person_outline,
                      color: const Color(0xff83AC88),
                      size: 25.w,
                    ),
                  ),
                ],
              ),
              const SizedBoxWidget(
                height: 10,
              ),
              _orderDetailWidget(),
              const SizedBoxWidget(
                height: 20,
              ),
              _graphWidget(),
              const SizedBoxWidget(
                height: 10,
              ),
              _buttonWidget(),
              const SizedBoxWidget(
                height: 10,
              ),
              _pieChartWidget(),
            ],
          ),
        ),
      ),
    );
  }

  _orderDetailWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: AppColors.orderBoxColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            height: 90.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  data: AppString.orders,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textGrey,
                  fontSize: 12.sp,
                ),
                const SizedBoxWidget(
                  height: 5,
                ),
                TextWidget(
                  data: '124',
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w900,
                )
              ],
            ),
          ),
        ),
        const SizedBoxWidget(width: 10),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: AppColors.leadBoxColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            height: 90.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  data: AppString.leads,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textGrey,
                  fontSize: 12.sp,
                ),
                const SizedBoxWidget(
                  height: 5,
                ),
                TextWidget(
                  data: '223',
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w900,
                )
              ],
            ),
          ),
        ),
        const SizedBoxWidget(width: 10),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: AppColors.salesBoxColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            height: 90.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  data: AppString.sales,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textGrey,
                  fontSize: 12.sp,
                ),
                const SizedBoxWidget(
                  height: 5,
                ),
                TextWidget(
                  data: '12k',
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w900,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  _buttonWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            height: 30.h,
            width: 100.w,
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                border: Border.all(color: AppColors.whiteColor),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2.r,
                      blurRadius: 5.r,
                      offset: const Offset(0, 2))
                ],
                borderRadius: BorderRadius.circular(5.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.person_add_alt_1_rounded,
                  size: 15.w,
                  color: AppColors.successColor,
                ),
                TextWidget(
                  data: AppString.newLeads,
                  color: AppColors.successColor,
                  fontSize: 13.sp,
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            context.push(Routes.orderScreen);
            FocusScope.of(context).unfocus();
          },
          child: Container(
            height: 30.h,
            width: 110.w,
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                border: Border.all(color: AppColors.whiteColor),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2.r,
                      blurRadius: 5.r,
                      offset: const Offset(0, 2))
                ],
                borderRadius: BorderRadius.circular(5.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.assignment_outlined,
                  size: 15.w,
                  color: AppColors.yellowColor,
                ),
                TextWidget(
                  data: AppString.neworders,
                  color: AppColors.yellowColor,
                  fontSize: 13.sp,
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            height: 30.h,
            width: 90.w,
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                border: Border.all(color: AppColors.whiteColor),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2.r,
                      blurRadius: 5.r,
                      offset: const Offset(0, 2))
                ],
                borderRadius: BorderRadius.circular(5.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.group,
                  size: 15.w,
                  color: AppColors.purpalColor,
                ),
                TextWidget(
                  data: AppString.campaign,
                  color: AppColors.purpalColor,
                  fontSize: 13.sp,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _graphWidget() {
    return Container(
        width: double.infinity,
        height: 100.h,
        color: const Color.fromARGB(255, 237, 238, 240),
        child: Image.asset("assets/images/line.png", fit: BoxFit.cover));
  }

  _pieChartWidget() {
    return Container(
      width: double.infinity,
      height: 265.h,
      color: const Color.fromARGB(255, 193, 212, 195),
      child: Image.asset(
        "assets/images/pie.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
