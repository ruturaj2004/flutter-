import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:legal_adviser/const/app_color.dart';
import 'package:legal_adviser/const/app_image.dart';
import 'package:legal_adviser/const/app_string.dart';
import 'package:legal_adviser/logic/reminder/reminder_cubit.dart';
import 'package:legal_adviser/utils/routes/routes.dart';
import 'package:legal_adviser/widgets/app_size.dart';
import 'package:legal_adviser/widgets/header_widget.dart';
import 'package:legal_adviser/widgets/text-field_widget.dart';
import 'package:legal_adviser/widgets/text_widget.dart';

import '../../widgets/button_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool light = false;
  final formkey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            GestureDetector(
              onTap: () {
                context.push(Routes.buildScreen);
                ;
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
                  _loginWithGoogleWidget(),
                  SizedBoxWidget(
                    height: 40,
                  ),
                  dividerWidget(),
                  SizedBoxWidget(
                    height: 20,
                  ),
                  userTextFormFieldWidget(),
                  _signInButtonWidget(),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  _loginWithGoogleWidget() {
    return Column(
      children: [
        Image.asset(
          AppImages.logo,
          height: 180.h,
          width: 300.w,
        ),
        SizedBoxWidget(
          width: double.infinity,
          height: 40,
          child: OutlinedButton(
            onPressed: () {},
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.google,
                  height: 20.h,
                  width: 20.w,
                ),
                SizedBoxWidget(width: 8),
                TextWidget(
                  data: AppString.google,
                  color: AppColors.black,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  dividerWidget() {
    return Row(
      children: <Widget>[
        Expanded(
            child: Divider(
          thickness: 2,
          endIndent: 2,
          color: AppColors.black,
        )),
        TextWidget(
          data: AppString.or,
          fontSize: 20.sp,
        ),
        Expanded(
          child: Divider(
            thickness: 2,
            indent: 2,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }

  userTextFormFieldWidget() {
    return Column(
      children: [
        Row(
          children: [
            TextWidget(
              data: AppString.userid,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ],
        ),
        Form(
          key: formkey,
          child: Row(
            children: [
              Expanded(
                child: TextFormFieldWidget(
                  keyboardType: TextInputType.text,
                  onChanged: (value) {},
                  onTap: () {
                    _focusNode.requestFocus();
                  },
                  onEditingComplete: () {
                    _focusNode.unfocus();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter UserId';
                    }
                   if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                        return 'Please enter only alphabetic characters for Last Name';
                      }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextWidget(
              data: AppString.remeber,
              color: const Color.fromARGB(255, 146, 141, 141),
            ),
            _reminderWidget(),
            SizedBoxWidget(
              height: 10,
            ),
          ],
        ),
        SizedBoxWidget(
          height: 15,
        ),
      ],
    );
  }

  _reminderWidget() {
  return BlocBuilder<ReminderCubit, bool>(
    builder: (context, light) {
      return Switch.adaptive(
        value: light,
        activeColor: AppColors.black,
        activeTrackColor: AppColors.gray,
        inactiveThumbColor: AppColors.gray,
        dragStartBehavior: DragStartBehavior.start,
        onChanged: (bool value) {
          context.read<ReminderCubit>().toggleLight(value);
        },
      );
    },
  );
}

  _signInButtonWidget() {
    return Column(
      children: [
        SizedBoxWidget(
          height: 37,
          width: double.infinity,
          child: TextButtonWidget(
              buttonText: AppString.signin,
              backGroundColor: Colors.black,
              buttonTextColor: Colors.white,
              borderRadius: 15,
              buttonTextSize: 20,
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  context.push(Routes.loginWithPhone);
                } else {}
              }),
        ),
        SizedBoxWidget(
          height: 10,
        ),
        TextWidget(
          data: AppString.forget,
          underline: true,
        ),
        SizedBoxWidget(
          height: 10,
        ),
        TextWidget(
          data: AppString.notRegister,
          underline: true,
          fontSize: 15.sp,
        ),
      ],
    );
  }
}
