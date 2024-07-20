import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:legal_adviser/const/app_color.dart';
import 'package:legal_adviser/widgets/text_widget.dart';

class DropDownFormWidget extends StatelessWidget {
  const DropDownFormWidget({
    Key? key,
    required this.context,
    required this.list,
    required this.selectedValue,
    required this.onChanged,
    this.readOnly = false,
    this.isRounded = true,
    this.hintTextStyle,
    this.dropdownColor = AppColors.black,
    this.textColor = AppColors.black,
    this.optionSelectColor = AppColors.black,
    required this.hintText,
    this.validator,
  }) : super(key: key);

  final BuildContext context;
  final List<String> list;
  final String selectedValue;
  final Function onChanged;
  final bool readOnly;
  final bool isRounded;
  final Color dropdownColor;
  final Color textColor;
  final Color optionSelectColor;
  final String hintText;
  final TextStyle? hintTextStyle;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        fillColor: AppColors.whiteColor,
        hintStyle: hintTextStyle,
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.black, width: 1.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.whiteColor, width: 1.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.red),
        ),
      ),
      elevation: 1,
      dropdownColor: AppColors.whiteColor,
      isExpanded: true,
      hint: TextWidget(
        data: hintText,
      ),
      iconSize: 30,
      validator: validator,
      iconEnabledColor: AppColors.black,
      icon: const Icon(
        Icons.keyboard_arrow_down,
        size: 30,
      ),
      items: list.map((String value) {
        return DropdownMenuItem(
          value: value,
          child: TextWidget(
            data: value,
            color: textColor,
            fontSize: 15.sp,
          ),
        );
      }).toList(),
      selectedItemBuilder: (BuildContext context) {
        return list.map<Widget>(
          (String value) {
            return TextWidget(
                data: value, fontSize: 20.sp, color: optionSelectColor);
          },
        ).toList();
      },
      onChanged: (value) {
        onChanged(value);
      },
    );
  }
}
