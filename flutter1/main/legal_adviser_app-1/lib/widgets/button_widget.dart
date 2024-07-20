import 'package:flutter/material.dart';
import 'package:legal_adviser/widgets/text_widget.dart';

class TextButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String? buttonText;
  final bool? inProgress;
  final double? height;
  final double? width;
  final double? textSize;
  final Color? buttonTextColor;
  final double? buttonTextSize;
  final Color? backGroundColor;
  final double? borderRadius;
  final BorderSide? border;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const TextButtonWidget({
    Key? key,
    required this.onPressed,
    this.buttonText,
    this.inProgress,
    this.height,
    this.width,
    this.buttonTextColor,
    this.textSize,
    this.backGroundColor,
    this.borderRadius,
    this.border,
    this.buttonTextSize,
    this.suffixIcon,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? 0),
              ),
              side: border ?? BorderSide.none, // Use the provided border if not null, otherwise use BorderSide.none
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color?>(backGroundColor),
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
                    fontSize: buttonTextSize,
                    fontWeight: FontWeight.bold,
                    color: buttonTextColor,
                  ),
                  if (suffixIcon != null) suffixIcon!,
                ],
              ),
      ),
    );
  }
}
