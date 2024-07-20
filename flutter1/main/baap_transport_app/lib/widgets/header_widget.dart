import 'package:baap_trasport_app/constants/app-string.dart';
import 'package:baap_trasport_app/constants/app_colors.dart';
import 'package:baap_trasport_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: AppString.bhurr,
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textBlack,
        ),
        TextWidget(
          text: AppString.letsGo,
          fontSize: 14.sp,
          color: AppColors.whiteColor,
        ),
        
      ],
    );
  }
}
