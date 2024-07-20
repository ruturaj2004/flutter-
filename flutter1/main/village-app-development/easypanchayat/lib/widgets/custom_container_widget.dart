import 'package:easypanchayat/widgets/sizedbox_widget.dart';
import 'package:easypanchayat/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomContainerWidget extends StatefulWidget {
  const CustomContainerWidget({
    super.key,
    this.icon,
    this.text,
    this.status,
    this.onClick,
  });

  final String? icon;
  final String? text;
  final String? status;
  final VoidCallback? onClick;

  @override
  State<CustomContainerWidget> createState() => _CustomContainerWidgetState();
}

class _CustomContainerWidgetState extends State<CustomContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: InkWell(
        onTap: widget.onClick,
        child: Container(
          height: 100.h,
          width: 106.w,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.transparent)),
          child: Padding(
            padding: const EdgeInsets.only(top: 7, bottom: 7),
            child: Column(
              children: [
                SvgPicture.asset(
                  widget.icon ?? '', // Replace with your SVG image path
                  height: 22,
                  width: 22,
                  color: AppColors.iconColor,
                ),
                SizedBoxWidget(
                  height: 5.h,
                ),
                TextWidget(
                  text: widget.text,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBoxWidget(
                  height: 5.h,
                ),
                TextWidget(
                  text: widget.status,
                  fontSize: 15.sp,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
