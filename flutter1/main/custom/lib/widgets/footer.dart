import 'package:custom/constants/app_color.dart';
import 'package:custom/constants/app_string.dart';
import 'package:custom/widgets/sizebox.dart';
import 'package:custom/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            data: AppString.lastName,
            fontSize: 12.sp,
            color: Appcolors.blueColor),
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
