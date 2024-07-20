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
    this.underLine = false,
    this.overflow,
    this.maxLines,
  }) : super(key: key);

  final String? data;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final double? height;
  final bool lineThrough;
  final bool underLine;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      data ?? "",
      overflow: overflow,
      maxLines: maxLines,
      style: GoogleFonts.kumbhSans(
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color ?? Theme.of(context).shadowColor,
        fontSize: fontSize,
        height: height,
        decoration: underLine || lineThrough
            ? TextDecoration.combine([
                if (underLine) TextDecoration.underline,
                if (lineThrough) TextDecoration.lineThrough,
              ])
            : TextDecoration.none,
      ),
    );
  }
}
