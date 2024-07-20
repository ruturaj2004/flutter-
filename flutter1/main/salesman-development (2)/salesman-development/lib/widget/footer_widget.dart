import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salesman_app/constant/app_color.dart';
import 'package:salesman_app/constant/app_string.dart';
import 'package:salesman_app/widget/sized_box_widget.dart';
import 'package:salesman_app/widget/text_widget.dart';

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
          data: AppString.powerBy,
          fontSize: 12.sp,
          color: AppColors.textGrey,
        ),
        TextWidget(
          data: AppString.companyName,
          fontSize: 17.sp,
          fontWeight: FontWeight.w900,
        ),
      ],
    );
  }
}
