import 'package:baap_trasport_app/constants/app-string.dart';
import 'package:baap_trasport_app/constants/app_colors.dart';
import 'package:baap_trasport_app/constants/app_enum.dart';

import 'package:baap_trasport_app/widgets/container_widget.dart';
import 'package:baap_trasport_app/widgets/icon_widget.dart';
import 'package:baap_trasport_app/widgets/sizedBox_widget.dart';
import 'package:baap_trasport_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
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
              color: AppColors.textGrey,
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            CustomContainer(
              height: 30.h,
              width: 35.w,
              borderRadius: BorderRadius.circular(5.r),
              color: AppColors.textGrey.withOpacity(0.6),
              child: IconWidget(
                data: AppIcons.notification.name,
                height: 30.h,
              ),
            ),
          ],
        ),
        const SizedBoxWidget(width: 8),
        const CircleAvatar(
          backgroundImage: NetworkImage(""),
        ),
      ],
    );
  }
}
