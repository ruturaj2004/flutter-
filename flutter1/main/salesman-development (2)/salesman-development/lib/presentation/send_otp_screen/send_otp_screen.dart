import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:salesman_app/constant/app_string.dart';
import 'package:salesman_app/logic/send_otp_logic/send_otp_cubit.dart';
import 'package:salesman_app/utils/routes/routes.dart';
import 'package:salesman_app/utils/snackbar/snackbar.dart';

import 'package:salesman_app/widget/custom_icon_widget.dart';
import 'package:salesman_app/widget/footer_widget.dart';
import 'package:salesman_app/widget/header_widget.dart';
import 'package:salesman_app/widget/sized_box_widget.dart';
import 'package:salesman_app/widget/text_widget.dart';
import 'package:lottie/lottie.dart';
import '../../widget/textFormFiled.dart';

class SendOtpScreen extends StatefulWidget {
  const SendOtpScreen({Key? key}) : super(key: key);

  @override
  State<SendOtpScreen> createState() => _SendOtpScreenState();
}

class _SendOtpScreenState extends State<SendOtpScreen> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController phoneNumber = TextEditingController(text: "");
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
            context.push(Routes.otpScreen,
                extra: {'phoneNumber': phoneNumber.text.trim()});
          } else if (state is SendOtpError) {
            SnackBarWidget.showSnackbar(context, state.errorMesage ?? "");
          }
        },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 25.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headerwidget(context: context),
                _phoneNumberWidget(),
                const FooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _phoneNumberWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          data: AppString.loginAccount,
          fontSize: 14.sp,
        ),
        const SizedBoxWidget(
          height: 10,
        ),
        BlocBuilder<SendOtpCubit, SendOtpState>(
          builder: (context, state) {
            return Form(
              key: formkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 75.h,
                      child: CustomTextFormFieldWidget(
                        keyboardType: TextInputType.number,
                        controller: phoneNumber,
                        hintText: "Enter your phone no",
                        onChanged: (value) {},
                        onTap: () {
                          setState(() {
                            _focusNode.requestFocus();
                          });
                        },
                        onEditingComplete: () {
                          setState(() {
                            _focusNode.unfocus();
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a number';
                          }
                          if (value.length != 10) {
                            return "Please enter a valid number";
                          }
                          return null;
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        suffixIcon: InkWell(
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              final phoneNumberText = phoneNumber.text.trim();
                              if (phoneNumberText.isNotEmpty) {
                                context
                                    .read<SendOtpCubit>()
                                    .sendOtp(phoneNumberText, context);
                              }
                            } else {}
                          },
                          child: state is SendOtpLoading
                              ? SizedBoxWidget(
                                  height: 1,
                                  width: 1,
                                  child: Lottie.asset(
                                    'assets/animation/loader.json',
                                  ),
                                )
                              : IconWidget(iconData: Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
