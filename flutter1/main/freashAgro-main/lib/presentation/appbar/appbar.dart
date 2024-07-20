import 'package:baap_organic_app/constant/app_color.dart';
import 'package:baap_organic_app/constant/app_string.dart';
import 'package:baap_organic_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextWidget(
            data: AppString.balirajaText,
            color: AppColors.suceessColor,
            fontWeight: FontWeight.w800,
            fontSize: 25.sp,
          ),
         
          TextWidget(
            data: AppString.organicText,
            fontWeight: FontWeight.bold,
            color: AppColors.successColor,
            fontSize: 13.sp,
          ),
        ],
      ),
    );
  }
}
