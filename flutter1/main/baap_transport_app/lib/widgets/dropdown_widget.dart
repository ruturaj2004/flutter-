import 'package:baap_trasport_app/constants/app_colors.dart';
import 'package:baap_trasport_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    this.hintText = 'Select Item',
    this.height = 50,
    this.width = 160,
    this.maxHeight = 200,
    this.dropdownWidth = 160,
    this.radius = 14,
    this.padding = const EdgeInsets.symmetric(horizontal: 14),
    this.decoration,
    this.validator,
    this.buttonDecoration,
  });

  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final String hintText;
  final double height;
  final double width;
  final String? Function(String?)? validator;
  final double maxHeight;
  final double dropdownWidth;
  final double radius;
  final EdgeInsets padding;
  final BoxDecoration? decoration;
  final BoxDecoration? buttonDecoration;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String? _validateAndReturn(String? value) {
    if (widget.validator != null) {
      return widget.validator!(value);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.dropdownWidth,
      decoration: widget.buttonDecoration ??
          BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius),
            border: Border.all(color: AppColors.textBlack),
            color: AppColors.whiteColor,
          ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Row(
            children: [
              Expanded(
                child: TextWidget(
                  text: widget.hintText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          items: widget.items
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: TextWidget(
                      text: item,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
              .toList(),
          value: widget.selectedValue,
          onChanged: (newValue) {
            final String? validationError = _validateAndReturn(newValue);
            if (validationError == null) {
              widget.onChanged(newValue);
            }
          },
          buttonStyleData: ButtonStyleData(
            height: widget.height,
            width: widget.width,
            padding: widget.padding,
            elevation: 2,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: widget.maxHeight,
            width: widget.width,
            decoration: widget.decoration ??
                BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.radius),
                ),
            offset: const Offset(0, 2),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all<double>(6),
              thumbVisibility: MaterialStateProperty.all<bool>(true),
            ),
          ),
          menuItemStyleData: MenuItemStyleData(
            height: 40.h,
            padding: const EdgeInsets.only(left: 14, right: 14),
          ),
        ),
      ),
    );
  }
}
