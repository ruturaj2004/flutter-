import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/constants/appStrings.dart';
import 'package:trip_app/constants/appcolors.dart';
import 'package:trip_app/constants/appimages.dart';
import 'package:trip_app/widgets/sizedBoxWidget.dart';
import 'package:trip_app/widgets/textWidget.dart';

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
                  context: context,
                  data: AppString.companyname,
                  fontWeight: FontWeight.w900,
                  fontSize: 16.sp,
                  height: 0.8.h,
                ),
                SizedBoxWidget(height: 4.h),
                TextWidget(
                  context: context,
                  data: AppString.typescompany,
                  color: AppColors.textGreyColor,
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
