import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:trip_app/logic/phone_screen_logic/cubit/phone_screen_cubit.dart';
import 'package:trip_app/utils/routes/app_utils/snackbar/snackbar.dart';
import 'package:trip_app/utils/routes/routes.dart';
import 'package:trip_app/widgets/footerWidget.dart';
import 'package:trip_app/widgets/headerWidget.dart';
import 'package:trip_app/widgets/sizedBoxWidget.dart';
import 'package:trip_app/widgets/textWidget.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
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
    return BlocListener<SendOtpCubit, PhoneScreenState>(
      listener: (context, state) {
        if (state is SendOtpSuccess) {
          context.push(Routes.otpScreen, extra: {
            'phoneNumber': phoneNumber.text.trim(),
          });
        } else if (state is SendOtpError) {
          SnackBarWidget.showSnackbar(context, state.errorMesage ?? "");
        } else if (state is VerifyOtpError) {
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      context: context,
                      data: "Get started by logging in your account",
                      fontSize: 14.sp,
                    ),
                    SizedBoxWidget(
                      height: 10.h,
                    ),
                    BlocBuilder<SendOtpCubit, PhoneScreenState>(
                      builder: (context, state) {
                        return Form(
                          key: formkey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 90.h,
                                  child: TextFormField(
                                    focusNode: _focusNode,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.all(12.0),
                                      hintText: "Enter your phone no",
                                      hintStyle: TextStyle(fontSize: 13.sp),
                                      suffixIcon: InkWell(
                                        onTap: () {
                                          if (formkey.currentState!
                                              .validate()) {
                                            final phoneNumberText =
                                                phoneNumber.text.trim();
                                            if (phoneNumberText.isNotEmpty) {
                                              context
                                                  .read<SendOtpCubit>()
                                                  .sendOtp(
                                                    phoneNumberText,
                                                    context,
                                                  );
                                              FocusScope.of(context)
                                                  .requestFocus(FocusNode());
                                            } else {}
                                          }
                                        },
                                        child: state is SendOtpLoading
                                            ? SizedBoxWidget(
                                                height: 1,
                                                width: 1,
                                                child: Lottie.asset(
                                                  'assets/images/loader.json',
                                                ),
                                              )
                                            : const Icon(
                                                Icons.arrow_forward_ios),
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
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
                                    controller: phoneNumber,
                                    style: TextStyle(
                                        fontSize:
                                            _focusNode.hasFocus ? 14.sp : 16.sp,
                                        fontWeight: FontWeight.w600),
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
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const FooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
