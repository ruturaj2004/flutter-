import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:trip_app/Logic/verify_otp_logic/cubit/verify_otp_logic_cubit.dart';
import 'package:trip_app/constants/appcolors.dart';
import 'package:trip_app/constants/appstrings.dart';
import 'package:trip_app/utils/routes/app_utils/snackbar/snackbar.dart';
import 'package:trip_app/utils/routes/routes.dart';
import 'package:trip_app/widgets/footerWidget.dart';
import 'package:trip_app/widgets/headerWidget.dart';
import 'package:trip_app/widgets/sizedBoxWidget.dart';
import 'package:trip_app/widgets/textWidget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, this.phoneNumber, String? token});
  final String? phoneNumber;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

TextEditingController _otpController = TextEditingController();

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {
    log(widget.phoneNumber ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocListener<VerifyOtpLogicCubit, VerifyOtpLogicState>(
      listener: (context, state) {
        if (state is VerifyOtpUserNotExists) {
          context.push(Routes.phoneScreen,
              extra: {"phoneNumber": state.phoneNumber});
        }
        if (state is VerifyOtpError) {
          SnackBarWidget.showSnackbar(context, state.errorMesage ?? "");
        }
        if (state is UserLoggedIn) {
          context.push(Routes.routeScreen);
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
                    context: context,
                    data: AppString.enterotp,
                    fontSize: 15.sp,
                  ),
                  SizedBox(height: 12.h),
                  _otpWidget(),
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
              color: AppColors.textGreyColor,
              context: context,
            ),
            closeKeyboardWhenCompleted: true,
            keyboardType: TextInputType.number,
            controller: _otpController,
            focusedPinTheme: PinTheme(
                height: 52.h,
                width: 45.w,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.textGreyColor.withOpacity(0.5),
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
            context.read<VerifyOtpLogicCubit>().verifyOtp(
                  phoneNumber: widget.phoneNumber ?? "",
                  otp: otpValue,
                );
          },
          child: BlocBuilder<VerifyOtpLogicCubit, VerifyOtpLogicState>(
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
                        child: Icon(
                          Icons.arrow_forward_ios,
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
}
