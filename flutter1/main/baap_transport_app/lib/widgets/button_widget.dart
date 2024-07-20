import 'package:baap_trasport_app/constants/app_colors.dart';
import 'package:baap_trasport_app/widgets/circular_progress_widget.dart';
import 'package:baap_trasport_app/widgets/icon_widget.dart';
import 'package:baap_trasport_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onClick,
    required this.text,
    this.borderRadius = 91,
    this.width = double.infinity,
    this.height = 51,
    this.isInProgress = false,
    this.isDark = false,
    this.isTransparentColor = false,
    this.showShadow = false,
    this.isBorder = false,
    this.textStyle,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w500,
    this.textColor,
    this.borderColor,
    this.backgroundColor,
    this.showIcon = false,
    this.isSuffixIcon = false,
    this.iconName,
    this.iconColor,
    this.iconHeight, this.iconWidth, this.iconsize,
  });

  final Function onClick;
  final String text;
  final double width;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? textColor;
  final Color? borderColor;
  final Color? backgroundColor;
  final double borderRadius;
  final bool isInProgress;
  final bool isDark;
  final bool isTransparentColor;
  final bool showShadow;
  final bool isBorder;
  final TextStyle? textStyle;
  final bool showIcon;
  final bool isSuffixIcon;
  final String? iconName;
  final Color? iconColor;
  final double? iconHeight;
  final double? iconWidth;
   final double? iconsize;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(
        borderRadius,
      )),
      onTap: () {
        if (!isInProgress) {
          onClick();
        }
      },
      child: Container(
        width: width.w,
        height: height.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          color: isDark
              ? Theme.of(context).primaryColor
              : isTransparentColor
                  ? Colors.transparent
                  : backgroundColor ?? AppColors.whiteColor,
          border: isBorder
              ? Border.all(
                  color: borderColor ?? Theme.of(context).primaryColor,
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: showShadow
                  ? Theme.of(context).shadowColor
                  : Colors.transparent,
              blurRadius: 20.r,
              offset: const Offset(5, 5),
            ),
          ],
        ),
        child: isInProgress
            ? CircularProgressIndicatorWidget(
                context: context,
                size: 20,
                color: isDark
                    ? AppColors.whiteColor
                    : textColor ?? Theme.of(context).primaryColor,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                      TextWidget(
                    text: text,
                    textAlign: TextAlign.center,
                    color: isDark
                        ? AppColors.whiteColor
                        : textColor ?? Theme.of(context).primaryColor,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                  ),
                  isSuffixIcon == true
                      ? Padding(
                          padding: EdgeInsets.only(right: 8.0.w),
                          child: Transform.scale(
                            scale:iconsize?? 0.9,
                            child: IconWidget(
                              data: iconName ?? "",
                              color: iconColor,
                              height: iconHeight ?? 18.h,
                              width: iconWidth?? 10.w,
                            ),
                          ),
                        )
                      : const SizedBox(),
              
                ],
              ),
      ),
    );
  }
}
