import 'package:flutter/material.dart';
import '../constant/app_color.dart';
import '../widgets/text_widget.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    Key? key,
    this.leadingIcon,
    this.title,
    this.children,
  }) : super(key: key);

  final IconData? leadingIcon;
  final String? title;
  final dynamic children;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(
        leadingIcon,
        color: AppColors.iconColor,
      ),
      trailing: const Icon(Icons.chevron_right),
      title: TextWidget(
        data: title,
        fontWeight: FontWeight.normal,
      ),
      children: [],
    );
  }
}
