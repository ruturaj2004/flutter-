import 'package:easypanchayat/widgets/sizedbox_widget.dart';
import 'package:easypanchayat/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key, required this.isBackgroundColor});
  final bool isBackgroundColor;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = isBackgroundColor
        ? AppColors.backgroundDark // Customize the background color when true
        : AppColors.whiteColor; // Customize the background color when false

    return Padding(
      padding: const EdgeInsets.only(left: 28, bottom: 15, top: 15),
      child: SizedBox(
        height: 45,     
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
                    text: 'MADE WITH PRIDE AT ',
                    style: TextStyle(
                        color: AppColors.textGrey,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                    children: [
                  TextSpan(
                    text: 'PAREGAON ',
                    style: TextStyle(
                        color: AppColors.blueTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'LIVE ',
                    style: TextStyle(
                        color: AppColors.redTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ])),
            const SizedBoxWidget(
              height: 5,
            ),
            TextWidget(
              text: "2023 - THE BAAP COMPANY ",
              fontSize: 12.sp,
              // letterSpacing: ,
              color: AppColors.greyDarkColor,
              fontWeight: FontWeight.bold,
            )
          ],
        ),
      ),
    );
  }
}
