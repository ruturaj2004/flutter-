import 'package:baap_trasport_app/app/login/cubit/send_otp_cubit.dart';
import 'package:baap_trasport_app/app/login/views/verify_otp.dart';
import 'package:baap_trasport_app/constants/app-string.dart';
import 'package:baap_trasport_app/constants/app_colors.dart';
import 'package:baap_trasport_app/constants/app_enum.dart';
import 'package:baap_trasport_app/constants/app_images.dart';
import 'package:baap_trasport_app/utils/routes/routes.dart';
import 'package:baap_trasport_app/widgets/button_widget.dart';
import 'package:baap_trasport_app/widgets/footer_widget.dart';
import 'package:baap_trasport_app/widgets/header_widget.dart';
import 'package:baap_trasport_app/widgets/linear_gradient.dart';
import 'package:baap_trasport_app/widgets/sizedBox_widget.dart';
import 'package:baap_trasport_app/widgets/snackbar_widget.dart';
import 'package:baap_trasport_app/widgets/text_formfiled_widget.dart';
import 'package:baap_trasport_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();

  final TextEditingController phoneNumber = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SendOtpCubit, SendOtpState>(
      listener: (context, state) {
        if (state is SendOtpSuccess) {
          context.push(Routes.verifyOtp,
              extra: {'phoneNumber': phoneNumber.text.trim()});
        } else if (state is SendOtpError) {
          SnackBarWidget.showSnackbar(context, state.errorMesage ?? "");
        }
      },
      child: SafeArea(
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
        BlocBuilder<SendOtpCubit, SendOtpState>(
          builder: (context, state) {
            return Form(
              key: formkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: TextformFieldWidget(
                controller: phoneNumber,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a number';
                  }
                  if (value.length != 10) {
                    return "Please enter a valid number";
                  }
                  return null;
                },
                hintText: AppString.hintText,
                hintTextColor: AppColors.textGrey,
                backgroundColor: AppColors.textGrey.withOpacity(0.3),
                inputFormater: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            );
          },
        ),
        const SizedBoxWidget(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ButtonWidget(
              onClick: () {
                if (formkey.currentState!.validate()) {
                  final phoneNumberText = phoneNumber.text.trim();
                  if (phoneNumberText.isNotEmpty) {
                    context
                        .read<SendOtpCubit>()
                        .sendOtp(phoneNumberText, context);
                  }
                } else {}
              },
              text: AppString.buttonGetStarted,
              textColor: AppColors.whiteColor,
              height: 30.h,
              width: 120.w,
              borderRadius: 0,
              fontSize: 14.sp,
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
