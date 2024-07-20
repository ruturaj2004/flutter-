import 'package:flutter/material.dart';

import 'text_widget.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.radius,
    this.context,
    this.height,
    this.width,
    required this.buttonText,
    this.buttonTextfontWeight,
    this.buttonTextColor,
    this.backGroundColor,
    this.onPressed,
    this.buttonTextSize,
    this.borderColor,
    this.borderWidth,
    this.disabledBackgroundColor,
  });

  final double? radius;
  final BuildContext? context;
  final double? height;
  final double? width;
  final String buttonText;
  final FontWeight? buttonTextfontWeight;
  final Color? buttonTextColor;
  final Color? backGroundColor;
  final double? buttonTextSize;
  final VoidCallback? onPressed;
  final Color? borderColor;
  final double? borderWidth;
  final Color? disabledBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        
        fixedSize: Size(width ?? 140, height ?? 30),
        disabledBackgroundColor: disabledBackgroundColor ?? const Color.fromARGB(255, 17, 56, 24),
        backgroundColor: backGroundColor,
        side: BorderSide(
          color: Colors.transparent,
          width: borderWidth ?? 0,
        ),
      ),
      child: TextWidget(
        textAlign: TextAlign.center,
        context: context,
        data: buttonText,
        fontWeight: FontWeight.w300,
        fontSize: 12,
        letterSpacing: 1,
        color: buttonTextColor,
      ),
    );
  }
}
