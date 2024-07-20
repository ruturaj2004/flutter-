import 'package:baap_trasport_app/constants/app-string.dart';
import 'package:baap_trasport_app/constants/app_colors.dart';
import 'package:baap_trasport_app/constants/app_enum.dart';
import 'package:baap_trasport_app/widgets/container_widget.dart';
import 'package:baap_trasport_app/widgets/footer_widget.dart';
import 'package:baap_trasport_app/widgets/icon_widget.dart';
import 'package:baap_trasport_app/widgets/linear_gradient.dart';
import 'package:baap_trasport_app/widgets/profile_header.dart';
import 'package:baap_trasport_app/widgets/sizedBox_widget.dart';
import 'package:baap_trasport_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LinearGradientWidget(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileHeaderWidget(),
              const Divider(),
              const SizedBoxWidget(height: 10),
              _distanceWidget(),
              const SizedBoxWidget(height: 10),
              _buttonsWidget(),
              const Spacer(),
              const FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }

  _distanceWidget() {
    return CustomContainer(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      height: 300.h,
      width: 370.w,
      child: Column(
        children: [
          const TextWidget(
            text: AppString.distance,
            color: AppColors.whiteColor,
            fontSize: 15,
          ),
          TextWidget(
            text: AppString.km,
            fontSize: 35.sp,
            color: AppColors.whiteColor,
          ),
        ],
      ),
    );
  }

  _buttonsWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomContainer(
          padding: EdgeInsets.symmetric(vertical: 25.h),
          height: 100.h,
          width: 120.w,
          color: AppColors.textGrey.withOpacity(0.6),
          child: Column(
            children: [
              IconWidget(
                data: AppIcons.bus.name,
                height: 40.h,
              ),
              TextWidget(
                text: AppString.startTrip,
                fontSize: 15.sp,
                color: AppColors.whiteColor,
              ),
            ],
          ),
        ),
        CustomContainer(
          padding: EdgeInsets.symmetric(vertical: 25.h),
          height: 100.h,
          width: 120.w,
          color: AppColors.textGrey.withOpacity(0.6),
          child: Column(
            children: [
              IconWidget(
                data: AppIcons.car.name,
                height: 40.h,
              ),
              TextWidget(
                text: AppString.bookCab,
                fontSize: 15.sp,
                color: AppColors.whiteColor,
              ),
            ],
          ),
        ),
        CustomContainer(
          padding: EdgeInsets.symmetric(vertical: 25.h),
          height: 100.h,
          width: 120.w,
          color: AppColors.textGrey.withOpacity(0.6),
          child: Column(
            children: [
              IconWidget(
                data: AppIcons.bus.name,
                height: 40.h,
                color: AppColors.whiteColor,
              ),
              TextWidget(
                text: AppString.bookTempo,
                fontSize: 15.sp,
                color: AppColors.whiteColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
