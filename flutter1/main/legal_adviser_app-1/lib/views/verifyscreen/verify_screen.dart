import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_adviser/const/app_color.dart';
import 'package:legal_adviser/const/app_string.dart';
import 'package:legal_adviser/utils/routes/routes.dart';
import 'package:legal_adviser/widgets/app_size.dart';
import 'package:legal_adviser/widgets/button_widget.dart';
import 'package:legal_adviser/widgets/header_widget.dart';
import 'package:legal_adviser/widgets/text_widget.dart';
import 'package:pinput/pinput.dart';


class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: AppColors.black,
          title: HeaderWidget(
              title: AppString.verifayAccount,
              leadingIcon: Icons.keyboard_arrow_left),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _middleWidget(),
              SizedBoxWidget(
                height: 20,
              ),
              _buttonWidget(),
            ],
          ),
        ),
      ),
    );
  }

  _middleWidget() {
    return Column(
      children: [
        TextWidget(
          data: AppString.verification,
          fontSize: 16.sp,
        ),
        SizedBoxWidget(height: 8),
        TextWidget(
          data: AppString.wehave,
          fontSize: 13.sp,
        ),
        TextWidget(
          data: AppString.number,
          fontSize: 13.sp,
        ),
        SizedBoxWidget(
          height: 50,
        ),
        Pinput(
          obscureText: false,
          obscuringCharacter: '*',
          closeKeyboardWhenCompleted: true,
          keyboardType: TextInputType.number,
          focusedPinTheme: PinTheme(
            height: 45.0.h,
            width: 32.0.w,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.zero,
              border: const Border(bottom: BorderSide(color: AppColors.black)),
            ),
          ),
          defaultPinTheme: PinTheme(
            height: 45.0.h,
            width: 50.0.w,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.zero,
              border: const Border(
                  bottom: const BorderSide(color: AppColors.black)),
            ),
          ),
          length: 4,
        ),
        SizedBoxWidget(height: 10),
        TextWidget(
          data: AppString.otpResend,
          fontSize: 11.sp,
        ),
      ],
    );
  }

  _buttonWidget() {
    return TextButtonWidget(
      buttonText: 'Verify',
      buttonTextSize: 20.sp,
      backGroundColor: AppColors.black,
      buttonTextColor: AppColors.whiteColor,
      height: 40.h,
      width: 200.w,
      onPressed: () {
        context.push(Routes.successScreen);
      },
    );
  }
}
