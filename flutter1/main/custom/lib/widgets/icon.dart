import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final double size;

  IconWidget({required this.iconData, this.color = Colors.black, this.size = 24});

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: color,
      size: size,
    );
  }
}
///IconWidget