import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
    this.data,
    this.fontWeight,
    this.color,
    this.fontSize,
    this.height,
    this.lineThrough = false,
    this.letterSpacing,
    this.context,
    this.textAlign,
  }) : super(key: key);

  final String? data;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final double? height;
  final bool lineThrough;
  final double? letterSpacing;
  final BuildContext? context;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      data ?? "",
      style: GoogleFonts.kumbhSans(
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color,
        fontSize: fontSize,
        height: height,
        letterSpacing: letterSpacing,
        decoration:
            lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
      ),
      textAlign: textAlign,
    );
  }
}
