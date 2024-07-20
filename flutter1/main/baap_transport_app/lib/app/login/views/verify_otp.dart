import 'package:baap_trasport_app/constants/app-string.dart';
import 'package:baap_trasport_app/constants/app_colors.dart';
import 'package:baap_trasport_app/constants/app_enum.dart';
import 'package:baap_trasport_app/constants/app_images.dart';
import 'package:baap_trasport_app/widgets/button_widget.dart';
import 'package:baap_trasport_app/widgets/footer_widget.dart';
import 'package:baap_trasport_app/widgets/header_widget.dart';
import 'package:baap_trasport_app/widgets/icon_widget.dart';
import 'package:baap_trasport_app/widgets/linear_gradient.dart';
import 'package:baap_trasport_app/widgets/sizedBox_widget.dart';
import 'package:baap_trasport_app/widgets/text_formfiled_widget.dart';
import 'package:baap_trasport_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LinearGradientWidget(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderWidget(),
                _welcomeWidget(),
                const FooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _welcomeWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: AppString.welcome,
          color: AppColors.whiteColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
        TextWidget(
          text: AppString.getStarted,
          color: AppColors.whiteColor,
          fontSize: 15.sp,
        ),
        const SizedBoxWidget(
          height: 20,
        ),
        TextformFieldWidget(
          hintText: AppString.hintTextOtp,
          hintTextColor: AppColors.textGrey,
          backgroundColor: AppColors.textGrey.withOpacity(0.3),
        ),
        const SizedBoxWidget(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ButtonWidget(
              onClick: () {},
              text: AppString.confirmButton,
              textColor: AppColors.whiteColor,
              height: 30.h,
              width: 120.w,
              borderRadius: 0,
              backgroundColor: AppColors.textGrey.withOpacity(0.6),
              iconName: AppIcons.forward.name,
              iconColor: AppColors.whiteColor,
              isSuffixIcon: true,
              iconWidth: 10.w,
            
            ),

          ],
        ),
      ],
    );
  }
}
