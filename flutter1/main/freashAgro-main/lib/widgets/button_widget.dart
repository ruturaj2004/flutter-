import 'package:baap_organic_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? buttonText;
  final bool? inProgress;
  final double? buttonHeight;
  final double? buttonWidth;
  final double? textSize;
  final Color? textColor;
  final double? fontSize;
  final Color? backgroundColor;
  final double? borderRadius;
  final BorderSide customBorderSide;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const CustomOutlinedButton({
    Key? key,
    required this.onPressed,
    this.buttonText,
    this.inProgress,
    this.buttonHeight,
    this.buttonWidth,
    this.textColor,
    this.textSize,
    this.backgroundColor,
    this.borderRadius,
    this.customBorderSide = BorderSide.none,
    this.fontSize,
    this.suffixIcon,
    this.prefixIcon, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      width: buttonWidth,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? 0),
              ),
              side: customBorderSide,
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color?>(backgroundColor),
        ),
        onPressed: onPressed,
        child: inProgress ?? false
            ? const CircularProgressIndicator()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefixIcon != null) prefixIcon!,
                  TextWidget(
                    data: buttonText,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                  if (suffixIcon != null) suffixIcon!,
                ],
              ),
      ),
    );
  }
}

