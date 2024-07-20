import 'package:flutter/material.dart';
import 'package:trip_app/widgets/textWidget.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      this.radius,
      required this.context,
      this.height,
      this.width,
      required this.buttonText,
      this.buttonTextfontWeight,
      this.buttonTextColor,
      this.backGroundColor,
      this.onPressed,
      this.buttonTextSize});

  final double? radius;
  final BuildContext context;
  final double? height;
  final double? width;
  final String buttonText;
  final FontWeight? buttonTextfontWeight;
  final Color? buttonTextColor;
  final Color? backGroundColor;
  final double? buttonTextSize;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(radius!)),
          fixedSize: Size(width!, height!),
          backgroundColor: backGroundColor),
      child: TextWidget(
        context: context,
        data: buttonText,
        fontWeight: buttonTextfontWeight,
        fontSize: buttonTextSize,
        color: buttonTextColor,
      ),
    );
  }
}
