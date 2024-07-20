import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double? height;
  final Color? color;
  final double? thickness;
  final double? indent;
  final double? endIndent;

  const CustomDivider({
    Key? key,
    this.height,
    this.color,
    this.thickness,
    this.indent,
    this.endIndent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      color: color,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomDivider(
          height: 2.0,
          thickness: 2.0,
          indent: 16.0,
          endIndent: 16.0,
        ),
      ],
    );
  }
}
