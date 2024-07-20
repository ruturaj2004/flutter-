import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    required this.context,
    super.key,
    this.data,
    this.fontWeight,
    this.color,
    this.fontSize,
    this.height,
  });

  final BuildContext context;
  final String? data;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Text(
      data ?? "",
      style: GoogleFonts.kumbhSans(
          fontWeight: fontWeight ?? FontWeight.bold,
          color: color ?? Theme.of(context).shadowColor,
          fontSize: fontSize,
          height: height),
    );
  }
}
