import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_adviser/const/app_color.dart';
import 'package:legal_adviser/const/app_image.dart';
import 'package:legal_adviser/const/app_string.dart';
import 'package:legal_adviser/utils/routes/routes.dart';
import 'package:legal_adviser/widgets/app_size.dart';
import 'package:legal_adviser/widgets/button_widget.dart';
import 'package:legal_adviser/widgets/header_widget.dart';
import 'package:legal_adviser/widgets/text-field_widget.dart';
import 'package:legal_adviser/widgets/text_widget.dart';

class LoginPhoneScreen extends StatefulWidget {
  const LoginPhoneScreen({super.key});

  @override
  State<LoginPhoneScreen> createState() => _LoginPhoneScreenState();
}

class _LoginPhoneScreenState extends State<LoginPhoneScreen> {
  TextEditingController _passwordController = TextEditingController();

  final formkey = GlobalKey<FormState>();
  final TextEditingController phoneNumber = TextEditingController(text: "");
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                context.push(Routes.signInScreen);
              },
              child: HeaderWidget(
                title: AppString.signin,
                leadingIcon: Icons.keyboard_arrow_left,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
              ),
              child: Column(
                children: [
                  _numberRow(),
                  SizedBoxWidget(
                    height: 5,
                  ),
                  _passwordTextField(),
                  _signInButtonWidget(),
                  _forgetButtonWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _numberRow() {
    return Column(
      children: [
        Image.asset(
          AppImages.logo,
          height: 180.h,
          width: 300.w,
        ),
        Row(
          children: [
            TextWidget(
              data: AppString.welcome,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ],
        ),
        SizedBoxWidget(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              data: AppString.phoneno,
              fontSize: 16.sp,
            ),
            InkWell(
              onTap: () {
                context.push(Routes.signInScreen);
              },
              child: TextWidget(
                data: AppString.change,
                underline: true,
              ),
            ),
          ],
        ),
      ],
    );
  }

  _passwordTextField() {
    return Column(
      children: [
        Form(
          key: formkey,
          child: Row(
            children: [
              Expanded(
                child: TextFormFieldWidget(
                  keyboardType: TextInputType.text,
                  controller: _passwordController,
                  onChanged: (value) {},
                  onTap: () {
                    _focusNode.requestFocus();
                  },
                  onEditingComplete: () {
                    _focusNode.unfocus();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a number';
                    }
                    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                      return 'Please enter Password';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),
            ],
          ),
        ),
        SizedBoxWidget(
          height: 10,
        ),
        InkWell(
          onTap: () {
            context.push(Routes.signInScreen);
          },
          child: Row(
            children: [
              TextWidget(
                data: AppString.forget_password,
                underline: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _signInButtonWidget() {
    return Column(
      children: [
        SizedBoxWidget(
          height: 30,
        ),
        SizedBoxWidget(
          height: 37,
          width: double.infinity,
          child: TextButtonWidget(
              buttonText: AppString.signin,
              buttonTextSize: 20,
              buttonTextColor: Colors.white,
              backGroundColor: AppColors.black,
              borderRadius: 10,
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  context.push(Routes.verifyscreen);
                } else {}
              }),
        ),
      ],
    );
  }

  _forgetButtonWidget() {
    return Column(
      children: [
        SizedBoxWidget(
          height: 10,
        ),
        InkWell(
          onTap: () {
            context.push(Routes.signInScreen);
          },
          child: TextWidget(
            data: AppString.forget,
            underline: true,
          ),
        ),
        SizedBoxWidget(
          height: 10,
        ),
        InkWell(
          onTap: () {
            context.push(Routes.signInScreen);
          },
          child: TextWidget(
            data: AppString.notRegister,
            underline: true,
            fontSize: 15.sp,
          ),
        ),
      ],
    );
  }
}
