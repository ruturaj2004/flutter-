import 'package:flutter/material.dart';
import 'package:legal_adviser/const/app_color.dart';
import 'package:legal_adviser/widgets/text_widget.dart';

class HeaderWidget extends StatelessWidget {
  final String title;

  final IconData leadingIcon;
  final VoidCallback? onTap;

  HeaderWidget({
    required this.title,
    required this.leadingIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.black,
        title: TextWidget(
          data: title,
          color: AppColors.whiteColor,
        ),
        leading: GestureDetector(
            onTap: onTap,
            child: Icon(
              leadingIcon,
              color: AppColors.whiteColor,
            )));
  }
}
