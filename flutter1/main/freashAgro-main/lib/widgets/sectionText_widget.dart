import 'package:baap_organic_app/constant/app_color.dart';
import 'package:baap_organic_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextSectionWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String? buttonText;
  final dynamic button;
  final double? imageHeight;
  final VoidCallback onButtonPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color titleTextColor;

  const TextSectionWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    this.buttonText,
    required this.button,
    this.imageHeight,
    required this.onButtonPressed,
    this.backgroundColor = AppColors.whiteColor,
    this.textColor = AppColors.blackColor,
    this.titleTextColor = AppColors.blackColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  imageUrl,
                  height: imageHeight,
                ),
                SizedBox(height: 20.h),
                TextWidget(
                  data: title,
                  fontSize: 17.sp,
                  color: titleTextColor,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                TextWidget(
                  data: description,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                button,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
