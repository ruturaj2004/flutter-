import 'package:baap_trasport_app/constants/app-string.dart';
import 'package:baap_trasport_app/constants/app_colors.dart';
import 'package:baap_trasport_app/widgets/sizedBox_widget.dart';
import 'package:baap_trasport_app/widgets/text_widget.dart';
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
        Row(
          children: [
            TextWidget(
              text: AppString.footertext,
              fontSize: 12.sp,
              color: AppColors.whiteColor,
            ),
          ],
        )
      ],
    );
  }
}
