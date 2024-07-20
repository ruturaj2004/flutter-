import 'package:flutter/material.dart';
import 'text_widget.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    Key? key,
    this.title,
    this.leading,
    this.trailing,
    this.onTap,
    this.color,
    this.size,
  }) : super(key: key);

  final String? title;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: TextWidget(
        data: title ?? "",
        fontSize: size,
        fontWeight: FontWeight.normal,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
