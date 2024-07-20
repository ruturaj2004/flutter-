import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';
import '../../constants/app_strings.dart';
import '../../logic/verify_otp/verify_otp_cubit.dart';
import '../../utils/app_utils/snackbar/snackbar.dart';
import '../../utils/routes/routes.dart';
import '../../widgets/footer_widget.dart';
import '../../widgets/sizedbox_widget.dart';
import '../../widgets/text_widget.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';



class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
    this.phoneNumber,
  });

  final String? phoneNumber;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otp = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocListener<VerifyOtpCubit, VerifyOtpState>(
      listener: (context, state) {
        if (state is VerifyOtpUserNotExists) {
          context.push(Routes.basicInfoScreen,
              extra: {"phoneNumber": state.phoneNumber});
        } else if (state is VerifyOtpError) {
          SnackBarWidget.showSnackbar(context, state.errorMesage ?? "");
        } else if (state is UserLoggedIn) {
          context.push(Routes.homeScreen);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundDark,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _companyText(),
          SizedBoxWidget(
            height: 250.h,
          ),
          _otpWidget(),
        ]),
        bottomNavigationBar: const FooterWidget(
          isBackgroundColor: false,
        ),
      ),
    ));
  }

  _companyText() {
    return Padding(
      padding: const EdgeInsets.all(28),
      child: TextWidget(
        text: AppStrings.companyName,
        fontSize: 18.sp,
        color: AppColors.textGrey,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _otpWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 28, right: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: AppStrings.otpText,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textGrey,
          ),
          const SizedBoxWidget(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Pinput(
                  obscureText: true,
                  obscuringCharacter: '●',

                  obscuringWidget: TextWidget(
                    text: '●',
                    fontSize: AppSizes.heavy18pxTextSize,
                    color: AppColors.textGrey,
                  ),
                  closeKeyboardWhenCompleted: true,
                  keyboardType: TextInputType.number,
                  controller: otp,
                  focusedPinTheme: PinTheme(
                      height: AppSizes.height(52),
                      width: AppSizes.width(45),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.lightTheme.dividerColor
                                .withOpacity(0.5),
                          ),
                          color: AppColors.backgroundDark,
                          borderRadius: BorderRadius.circular(5.r))),
                  defaultPinTheme: PinTheme(
                      height: AppSizes.height(52),
                      width: AppSizes.width(45),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.lightTheme.dividerColor
                                .withOpacity(0.5),
                          ),
                          color: AppColors.backgroundDark,
                          borderRadius: BorderRadius.circular(5.r))),
                  length: 6,
                ),
              ),
              SizedBoxWidget(
                width: 15.w,
              ),
              InkWell(
                onTap: () {
                  try {
                    int otpValue = int.parse(otp.text.trim());
                    // Call the verifyOtp method with the otpValue
                    context.read<VerifyOtpCubit>().verifyOtp(
                          phoneNumber: widget.phoneNumber ?? "",
                          otp: otpValue,
                        );
                  } catch (e) {
                    print(e);
                    // Handle the exception, e.g., display an error message or take appropriate action
                  }
                  // context.read<VerifyOtpCubit>().verifyOtp(
                  //                 phoneNumber: widget.phoneNumber ?? "",
                  //                 otp: int.parse(otp.text.trim()));
                },
                child: context.watch<VerifyOtpCubit>().state is VerifyOtpLoading
              ? const CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.textGrey),
                )
              : Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.textGrey,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 20.sp,
                      color: AppColors.backgroundDark,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
