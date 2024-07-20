import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_adviser/const/app_color.dart';
import 'package:legal_adviser/const/app_string.dart';
import 'package:legal_adviser/utils/routes/routes.dart';
import 'package:legal_adviser/widgets/app_size.dart';
import 'package:legal_adviser/widgets/button_widget.dart';
import 'package:legal_adviser/widgets/custom_icon.dart';
import 'package:legal_adviser/widgets/header_widget.dart';
import 'package:legal_adviser/widgets/text-field_widget.dart';
import 'package:legal_adviser/widgets/text_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController phoneNumber = TextEditingController(text: "");
  GlobalKey<FormState> firstName = GlobalKey<FormState>();
  GlobalKey<FormState> lastName = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Wrap your Column with SingleChildScrollView
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                context.push(Routes.buildScreen);
              },
              child: HeaderWidget(
                title: AppString.registerName,
                leadingIcon: Icons.keyboard_arrow_left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBoxWidget(
                    height: 30,
                  ),
                  _photoaddWidget(),
                  const SizedBoxWidget(
                    height: 30,
                  ),
                  _phoneNumberWidget(),
                  SizedBox(
                    height: 15,
                  ),
                  _firstNameWidget(),
                  SizedBox(
                    height: 15,
                  ),
                  _lastNameWidget(),
                  const SizedBoxWidget(
                    height: 30,
                  ),
                  _buttonWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _photoaddWidget() {
    return Column(
      children: [
        Container(
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.black,
              width: 2.w,
            ),
          ),
          child: IconWidget(
            iconData: Icons.add,
          ),
        ),
        const SizedBoxWidget(
          height: 8,
        ),
        const TextWidget(
          data: AppString.photoText,
          fontWeight: FontWeight.w300,
        ),
      ],
    );
  }

  _phoneNumberWidget() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(
            data: AppString.phoneNumber,
            fontSize: 15.sp,
          ),
          const SizedBoxWidget(
            height: 10.0,
          ),
          Form(
            key: formkey,
            child: Row(children: [
              Expanded(
                child: Container(
                  child: TextFormFieldWidget(
                    keyboardType: TextInputType.number,
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
                      if (value.contains(RegExp(r'[a-zA-Z]'))) {
                        return 'Please enter only numeric characters';
                      }
                      if (value.length != 10) {
                        return "Please enter a valid 10-digit number";
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  _firstNameWidget() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(
            data: AppString.firstName,
            fontSize: 15.sp,
          ),
          const SizedBoxWidget(
            height: 10,
          ),
          Form(
            key: firstName,
            autovalidateMode:
                AutovalidateMode.onUserInteraction, // Set autovalidateMode here
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: TextFormFieldWidget(
                      keyboardType: TextInputType.text,
                      onChanged: (value) {},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a First Name';
                        }
                        if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                          return 'Please enter only alphabetic characters for First Name';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _lastNameWidget() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(
            data: AppString.lastName,
            fontSize: 15.sp,
          ),
          const SizedBoxWidget(
            height: 10,
          ),
          Form(
            key: lastName,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: TextFormFieldWidget(
                      keyboardType: TextInputType.text,
                      onChanged: (value) {},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a Last Name';
                        }
                        if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                          return 'Please enter only alphabetic characters for Last Name';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buttonWidget() {
    return Center(
      child: SizedBoxWidget(
        height: 45,
        width: 300,
        child: TextButtonWidget(
          buttonText: AppString.continueButton,
          backGroundColor: AppColors.black,
          buttonTextColor: AppColors.whiteColor,
          borderRadius: 10.r,
          onPressed:(){
            bool phoneNumberValid = formkey.currentState!.validate();
            bool firstNameValid = firstName.currentState!.validate();
            bool lastNameValid = lastName.currentState!.validate();

            if (phoneNumberValid && firstNameValid && lastNameValid) {
              context.push(Routes.verifyscreen);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please fill in all fields correctly'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
