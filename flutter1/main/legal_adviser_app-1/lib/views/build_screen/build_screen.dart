import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_adviser/const/app_color.dart';
import 'package:legal_adviser/const/app_string.dart';
import 'package:legal_adviser/utils/routes/routes.dart';
import 'package:legal_adviser/widgets/app_size.dart';
import 'package:legal_adviser/widgets/button_widget.dart';
import 'package:legal_adviser/widgets/header_widget.dart';
import 'package:legal_adviser/widgets/text-field_widget.dart';
import 'package:legal_adviser/widgets/text_widget.dart';

class BuildScreen extends StatefulWidget {
  const BuildScreen({super.key});

  @override
  State<BuildScreen> createState() => _BuildScreenState();
}

class _BuildScreenState extends State<BuildScreen> {
  final formkey = GlobalKey<FormState>();

  GlobalKey<FormState> legalValidation = GlobalKey<FormState>();
  GlobalKey<FormState> cityValidation = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                context.push(Routes.loginScreen);
              },
              child: HeaderWidget(
                title: AppString.buildCase,
                leadingIcon: Icons.keyboard_arrow_left,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  SizedBoxWidget(
                    height: 60,
                  ),
                  _legalIssueTextFieldWidget(),
                  SizedBoxWidget(
                    height: 1,
                  ),
                  _locationTextFieldWidget(),
                  _registerButtonWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _legalIssueTextFieldWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(
          data: AppString.legalIissue,
          fontSize: 15.sp,
        ),
        SizedBoxWidget(
          height: 10,
        ),
        Form(
          key: legalValidation,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 75.h,
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
                        return 'Please enter a legal issue';
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
    );
  }

  _locationTextFieldWidget() {
    return Form(
      key: cityValidation,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(
            data: AppString.locationTextField,
            fontSize: 15.sp,
          ),
          SizedBoxWidget(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 60.h,
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
                        return 'Please enter a City and State';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _registerButtonWidget() {
    return Column(
      children: [
        SizedBoxWidget(
          height: 20,
        ),
        InkWell(
          onTap: () {
            context.push(Routes.registerScreen);
          },
          child: TextWidget(
            data: AppString.skipknowText,
            underline: true,
            fontSize: 15.sp,
          ),
        ),
        SizedBoxWidget(
          height: 15,
        ),
        Center(
          child: SizedBoxWidget(
            height: 40,
            width: 300,
            child: TextButtonWidget(
              buttonText: AppString.registerName,
              height: 1.h,
              buttonTextSize: 20.sp,
              backGroundColor: AppColors.black,
              buttonTextColor: AppColors.whiteColor,
              borderRadius: 10.r,
              onPressed: () {
                bool isLegalValid = legalValidation.currentState!.validate();
                bool isCityValid = cityValidation.currentState!.validate();

                if (isLegalValid && isCityValid) {
                  context.push(Routes.registerScreen);
                } else {}
              },
            ),
          ),
        ),
      ],
    );
  }
}
