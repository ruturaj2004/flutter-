import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class TextformFieldWidget extends StatefulWidget {
  const TextformFieldWidget({
    super.key,
    this.hintText,
    this.height,
    this.rouneded = 5.0,
    this.fontWeight,
    this.focusNode,
    this.suffixIcon,
    this.isSuffixIconShow = false,
    this.isRounded = true,
    this.backgroundColor,
    this.controller,
    this.errorTextColor,
    this.textInputType,
    this.inputFormater,
    this.errorTextSize,
    this.onChanged,
    this.validator,
    this.isEnable = true,
    this.initialValue,
    this.isBorderColor = true,
    this.obscureText,
    this.hintTextColor = AppColors.textformFieldColor,
    this.textColor = AppColors.textGrey,
    this.fontSize,
    this.maxLine,
    this.onOutSideTap,
    this.onTap,
    Null Function()? onEditingComplete,
  });

  final String? initialValue;
  final String? hintText;
  final int? maxLine;
  final bool isSuffixIconShow;
  final double? height;
  final double rouneded;
  final bool isRounded;
  final double? fontSize;
  final double? errorTextSize;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final Color? errorTextColor;
  final Color? hintTextColor;
  final Color? textColor;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormater;
  final bool? isBorderColor;
  final bool? obscureText;
  final bool? isEnable;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Function(PointerDownEvent)? onOutSideTap;
  final Function()? onTap;
  @override
  State<TextformFieldWidget> createState() => _TextformFieldWidgetState();
}

class _TextformFieldWidgetState extends State<TextformFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLine ?? 1,
      obscureText: widget.obscureText ?? false,
      initialValue: widget.initialValue,
      cursorColor: AppColors.textGrey,
      inputFormatters: widget.inputFormater,
      onTapOutside: widget.onOutSideTap,
      keyboardType: widget.textInputType,
      autofocus: true,
      enabled: widget.isEnable,
      controller: widget.controller,
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      validator: widget.validator,
      onTap: widget.onTap,
      style: TextStyle(
          fontFamily: "GoogleSans",
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
          color: widget.textColor),
      decoration: InputDecoration(
        filled: widget.backgroundColor != null,
        fillColor: widget.backgroundColor,
        contentPadding: EdgeInsets.all(10.h),
        hintText: widget.hintText,
        suffixIcon: widget.suffixIcon,
        hintStyle: TextStyle(
            fontFamily: "GoogleSans",
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            color: widget.hintTextColor),
        errorStyle: TextStyle(
            fontFamily: "GoogleSans",
            color: widget.errorTextColor ?? Colors.red,
            fontSize: widget.errorTextSize ?? 13.sp),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.rouneded),
          borderSide: BorderSide(
            width: 1.w,
            color: (widget.isBorderColor ?? false)
                ? AppColors.borderColor
                : AppColors.backgroundDark,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.rouneded),
          borderSide: BorderSide(
            width: 1.w,
            color: (widget.isBorderColor ?? false)
                ? AppColors.borderColor
                : AppColors.backgroundDark,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.rouneded),
          borderSide: BorderSide(
            width: 1.w,
            color: (widget.isBorderColor ?? false)
                ? AppColors.borderColor
                : AppColors.borderColor,
          ),
        ),
      ),
    );
  }
}
