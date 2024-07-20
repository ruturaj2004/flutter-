import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/constants/appStrings.dart';
import 'package:trip_app/constants/appcolors.dart';
import 'package:trip_app/widgets/sizedBoxWidget.dart';
import 'package:trip_app/widgets/textWidget.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        SizedBoxWidget(
          height: 5.h,
        ),
        TextWidget(
            context: context,
            data: AppString.powerby,
            fontSize: 12.sp,
            color: AppColors.textGreyColor),
        TextWidget(
          context: context,
          data: AppString.companyname,
          fontSize: 17.sp,
          fontWeight: FontWeight.w900,
        ),
      ],
    );
  }
}
