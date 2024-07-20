import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {Key? key,
      this.controller,
      this.keyboardType = TextInputType.text,
      this.onChanged,
      this.inputFormatters,
      this.cursorColor,
      this.hintText,
      this.fontWeight,
      this.fontSize,
      this.color,
      this.errorText,
      this.hintcolor,
      this.suffixIcon,
      this.validator,
      this.border,
      this.initialValue,
      this.constraints})
      : super(key: key);

  final String? hintText;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final Color? cursorColor;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final Color? hintcolor;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final String? initialValue;
  final BoxConstraints? constraints;
  final InputBorder? border;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      initialValue: initialValue,
      cursorColor: Colors.black,
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator,
      style: GoogleFonts.kumbhSans(
        fontWeight: fontWeight,
        color: Colors.black,
        fontSize: fontSize,
      ),
      decoration: InputDecoration(
        constraints: constraints,
        suffix: suffixIcon,
        hintText: hintText,
        border: border,
        hintStyle: GoogleFonts.kumbhSans(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: hintcolor,
        ),
      ),
    );
  }
}
