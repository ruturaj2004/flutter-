import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:salesman_app/utils/routes/routes.dart';
import 'package:salesman_app/widget/custom_icon_widget.dart';
import 'package:salesman_app/widget/header_widget.dart';

import '../../constant/app_color.dart';
import '../../constant/app_string.dart';
import '../../logic/send_otp_logic/send_otp_cubit.dart';
import '../../logic/verify_otp_logic/verify_otp_cubit.dart';
import '../../logic/verify_otp_logic/verify_otp_state.dart';
import '../../utils/snackbar/snackbar.dart';
import '../../widget/footer_widget.dart';
import '../../widget/sized_box_widget.dart';
import '../../widget/text_widget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, this.phoneNumber, String? token});
  final String? phoneNumber;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

TextEditingController _otpController = TextEditingController();
  
class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocListener<VerifyOtpCubit, VerifyOtpState>(
      listener: (context, state) {
        if (state is VerifyOtpUserNotExists) {
          context
              .push(Routes.sendOtp,);
        }
        if (state is VerifyOtpError) {
          SnackBarWidget.showSnackbar(context, state.errorMessage ?? "");
        }
        if (state is UserLoggedIn) {
          context.push(Routes.groupScreen);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 25.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Headerwidget(context: context),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    data: AppString.enterOtp,
                    fontSize: 15.sp,
                  ),
                  const SizedBoxWidget(height: 12),
                  _otpWidget(),
                  const SizedBoxWidget(height: 30),
                  _resendotp(),
                ],
              ),
              const FooterWidget(),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _otpWidget() {
    return Row(
      children: [
        Expanded(
          child: Pinput(
            obscureText: true,
            obscuringCharacter: '●',
            obscuringWidget: TextWidget(
              data: AppString.obsureOtpText,
              fontSize: 18.sp,
            ),
            closeKeyboardWhenCompleted: true,
            keyboardType: TextInputType.number,
            controller: _otpController,
            focusedPinTheme: PinTheme(
                height: 52.h,
                width: 45.w,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.textGrey.withOpacity(0.5),
                    ),
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(5.r))),
            defaultPinTheme: PinTheme(
                height: 52.h,
                width: 45.w,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).dividerColor.withOpacity(0.5),
                    ),
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(5.r))),
            length: 6,
          ),
        ),
        SizedBoxWidget(
          width: 15.w,
        ),
        InkWell(  
          onTap: () {
            int otpValue = int.parse(_otpController.text.trim());
            print(widget.phoneNumber);
            print(otpValue);
            context.read<VerifyOtpCubit>().verifyOtp(
                  phoneNumber: widget.phoneNumber ?? "",
                  otp: otpValue,
                );
          },
          child: BlocBuilder<VerifyOtpCubit, VerifyOtpState>(
            builder: (context, state) {
              return state is VerifyOtpLoading
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                    )
                  : Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: IconWidget(
                          iconData: Icons.arrow_forward_ios,
                          size: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                    );
            },
          ),
        ),
      ],
    );
  }

  _resendotp() {
    return InkWell(
      onTap: () {
        context
            .read<SendOtpCubit>()
            .sendOtp(widget.phoneNumber.toString(), context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextWidget(
            data: AppString.resendOTP,
            color: AppColors.textGrey,
            underLine: true,
            fontSize: 15.sp,
          ),
        ],
      ),
    );
  }
}
