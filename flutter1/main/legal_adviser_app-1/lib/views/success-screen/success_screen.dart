import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_adviser/const/app_string.dart';
import 'package:legal_adviser/utils/routes/routes.dart';
import 'package:legal_adviser/widgets/app_size.dart';
import 'package:legal_adviser/widgets/header_widget.dart';
import 'package:legal_adviser/widgets/text_widget.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                context.push(Routes.verifyscreen);
              },
              child: HeaderWidget(
                title: AppString.registerName,
                leadingIcon: Icons.keyboard_arrow_left,
              ),
            ),
            SizedBoxWidget(
              height: 150,
            ),
            _verificationSuccessScreen(),
          ],
        ),
      ),
    );
  }

  _verificationSuccessScreen() {
    return Column(
      children: [
        TextWidget(
          data: AppString.registerSuccess,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBoxWidget(
          height: 15,
        ),
        TextWidget(
          data: AppString.successScreenConfirmation,
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBoxWidget(
          height: 30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(
              data: AppString.successScreenAutomatically,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
            TextWidget(
              data: AppString.successScreenAutomaticallyClick,
              textAlign: TextAlign.center,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        SizedBoxWidget(
          height: 30,
        ),
        InkWell(
          onTap: () {
            context.push(Routes.homeScreen);
          },
          child: TextWidget(
            data: AppString.refreshPage,
            underline: true,
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
