import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salesman_app/constant/app_color.dart';
import 'package:salesman_app/constant/app_images.dart';
import 'package:salesman_app/constant/app_string.dart';
import 'package:salesman_app/widget/sized_box_widget.dart';
import 'package:salesman_app/widget/text_widget.dart';

class Headerwidget extends StatelessWidget {
  final BuildContext context;
  const Headerwidget({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              AppImages.logoImage,
              height: 45.h,
              width: 45.w,
            ),
            SizedBoxWidget(
              width: 5.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                 
                  data: AppString.companyName,
                  fontWeight: FontWeight.w900,
                  fontSize: 16.sp,
                  height: 0.8.h,
                ),
                SizedBoxWidget(height: 4.h),
                TextWidget(
                 
                  data: AppString.typesCompany,
                  color: AppColors.textGrey,
                  fontSize: 11.sp,
                  height: 1.5.h,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
