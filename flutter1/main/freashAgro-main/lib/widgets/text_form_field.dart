import 'package:baap_organic_app/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFieldWidget extends StatefulWidget {
  final String hintText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;

  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function()? onTap;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final double? width;
  final double? height;
  final FocusNode? focusNode;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final Color? cursorColor;
  final bool? obscureText ;   
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final Color? hintColor;
  final String? initialValue;
  final BoxConstraints? constraints;
  final InputBorder? border;
  final double? cursorheight;
  final AutovalidateMode? autovalidateMode;
  final Color? fillColor;
  const CustomTextFormFieldWidget({
    Key? key,
    required this.hintText,
    this.hintStyle,
    this.suffixIcon,
    this.onChanged,
    this.onEditingComplete,
    this.onTap,
    this.obscureText, 
    this.validator,
    this.width,
    this.height,
    this.fontWeight,
    this.fontSize,
    this.color,
    this.cursorColor,
    this.keyboardType,
    this.inputFormatters,
    this.errorText,
    this.hintColor,
    this.autovalidateMode,
    this.initialValue,
    this.constraints,
    this.border,
    this.cursorheight,
    this.focusNode,
    this.controller,
    this.fillColor,
  }) : super(key: key);

  @override
  State<CustomTextFormFieldWidget> createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        autovalidateMode: widget.autovalidateMode,
        inputFormatters: widget.inputFormatters,
        cursorColor: Colors.black,
        obscureText:widget.obscureText ?? false,
        focusNode: _focusNode,
        cursorHeight: widget.cursorheight,
        decoration: InputDecoration(
            fillColor: AppColors.whiteColor,
            filled: true,
            border: widget.border,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            suffixIcon: widget.suffixIcon,
            contentPadding: const EdgeInsets.all(10)),
        keyboardType: TextInputType.multiline,
        validator: widget.validator,
        controller: widget.controller,
        style: TextStyle(
          fontSize: _focusNode.hasFocus ? 14.sp : 14.sp,
          fontWeight: FontWeight.w600,
        ),
        onChanged: widget.onChanged,
        onTap: () {
          setState(() {
            _focusNode.requestFocus();
          });
        },
        onEditingComplete: () {
          setState(() {
            _focusNode.unfocus();
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
