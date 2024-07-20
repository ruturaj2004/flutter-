import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class TextformFieldWidget extends StatefulWidget {
  const TextformFieldWidget(
      {super.key,
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
      this.textInputType,
      this.inputFormater,
      this.onChanged,
      this.validator,
      this.initialValue,
      this.isBorderColor = true,
      this.obscureText,
      this.hintTextColor = AppColors.textformFieldColor,
      this.textColor = AppColors.textGrey,
      this.fontSize,
      this.maxLine, 
       });

  final String? initialValue;
  final String? hintText;
  final int? maxLine;
  final bool isSuffixIconShow;
  final double? height;
  final double rouneded;
  final bool isRounded;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final Color? hintTextColor;
  final Color? textColor;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormater;
  final bool? isBorderColor;
  final bool? obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  @override
  State<TextformFieldWidget> createState() => _TextformFieldWidgetState();
}

class _TextformFieldWidgetState extends State<TextformFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius:
            widget.isRounded ? BorderRadius.circular(widget.rouneded) : null,
      ),
      height: widget.height,
      child: TextFormField(
          maxLines: widget.maxLine ?? 1,
          obscureText: widget.obscureText ?? false,
          initialValue: widget.initialValue,
          cursorColor: AppColors.textGrey,
          inputFormatters: widget.inputFormater,
          keyboardType: widget.textInputType,
          autofocus: true,
          controller: widget.controller,
          focusNode: widget.focusNode,
          onChanged: widget.onChanged,
          validator: widget.validator,
          style: GoogleFonts.kumbhSans(
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
              color: widget.textColor),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.h),
              hintText: widget.hintText,
              suffixIcon: widget.suffixIcon,
              hintStyle: GoogleFonts.kumbhSans(
                  fontSize: widget.fontSize,
                  fontWeight: widget.fontWeight,
                  color: widget.hintTextColor),
              enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.rouneded),
                  borderSide: BorderSide(
                      width: 1.w,
                      color: (widget.isBorderColor ?? false)
                          ? AppColors.borderColor
                          : AppColors.backgroundDark)),
              focusedBorder: widget.isRounded
                  ? UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.rouneded),
                      borderSide: BorderSide(
                          width: 1.w,
                          color: (widget.isBorderColor ?? false)
                              ? AppColors.borderColor
                              : AppColors.backgroundDark))
                  : null,
              border: widget.isRounded
                  ? UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.rouneded),
                      borderSide: BorderSide(
                          width: 1.w,
                          color: (widget.isBorderColor ?? false)
                              ? AppColors.borderColor
                              : AppColors.borderColor))
                  : null)),
    );
  }
}
