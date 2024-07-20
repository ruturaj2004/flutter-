
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:two_brother/constant/app_colors.dart';
import 'package:two_brother/constant/app_string.dart';
import 'package:two_brother/widget/text_widget.dart';


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
            data: AppString.two,
            color: AppColor.success,
            fontWeight: FontWeight.w800,
            fontSize: 15.sp,
          ),
          TextWidget(
            data: AppString.brothers,
            color: AppColor.success,
            fontSize: 15.sp,
            fontWeight: FontWeight.w800,
          ),
          TextWidget(
            data: AppString.farm,
            fontWeight: FontWeight.bold,
            color: AppColor.success,
            fontSize: 6.sp,
            letterSpacing: 1,
          ),
        ],
      ),
    );
  }
}
