import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_adviser/const/app_color.dart';
import 'package:legal_adviser/const/app_string.dart';
import 'package:legal_adviser/utils/routes/routes.dart';
import 'package:legal_adviser/widgets/app_size.dart';
import 'package:legal_adviser/widgets/bottombar.dart';
import 'package:legal_adviser/widgets/button_widget.dart';
import 'package:legal_adviser/widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _mycaseWidget(),
          SizedBoxWidget(
            height: 90,
          ),
          _existingcaseWidget(),
          SizedBoxWidget(
            height: 35,
          ),
          _buildcaseWidget(),
          SizedBox(
            height: 250,
          ),
          _buttonWidget()
        ],
      ),
      bottomSheet: Container(
        height: 80.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 5,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: ShowBottomNavigationBar(),
      ),
    );
  }

  _mycaseWidget() {
    return (Column(
      children: [
        Container(
          height: 130.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  data: AppString.caseDate,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
                TextWidget(
                  data: AppString.goodEvevinig,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBoxWidget(
                  height: 15,
                ),
                TextWidget(
                  data: AppString.myCases,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  _existingcaseWidget() {
    return (Column(
      children: [
        TextWidget(
          data: AppString.youHave,
          fontSize: 25.sp,
          fontWeight: FontWeight.w700,
        ),
        TextWidget(
          data: AppString.existingCases,
          fontSize: 25.sp,
          fontWeight: FontWeight.w700,
        )
      ],
    ));
  }

  _buildcaseWidget() {
    return (Column(
      children: [
        InkWell(
          onTap: () {},
          child: TextWidget(
            data: AppString.buildCase,
            underline: true,
            fontSize: 15.sp,
          ),
        )
      ],
    ));
  }

  _buttonWidget() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: (Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButtonWidget(
            buttonText: 'New Case',
            borderRadius: 10.r,
            backGroundColor: AppColors.whiteColor,
            onPressed: () {
              context.push(Routes.inboxscreen);
            },
          ),
        ],
      )),
    );
  }
}
