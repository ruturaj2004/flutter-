import 'package:easypanchayat/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextFieldWidget extends StatefulWidget {
  const SearchTextFieldWidget(
      {Key? key,
      this.width = 260,
      this.height = 63,
      this.hintText = 'Search',
      this.onChanged,
      this.onSubmitted})
      : super(key: key);

  final double? width;
  final double height;
  final String hintText;
  final Function? onChanged;
  final ValueSetter<String>? onSubmitted;

  @override
  // ignore: library_private_types_in_public_api
  _SearchTextFieldWidgetState createState() => _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: AppColors.backgroundDark,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: AppColors.borderColor, width: 1)),
      child: TextField(
        textAlign: TextAlign.left,
        onSubmitted: widget.onSubmitted,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          fontSize: 24.sp, // Replace with your desired font size
          color: AppColors.textGrey, // Replace with your desired text color
        ),
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          contentPadding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 5.h,
            bottom: 5.h,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 20.w, top: 5.h),
            child: Icon(
              Icons.search,
              color: AppColors.textGrey,
              size: 22.sp,
            ),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 24.sp,
            color:
                AppColors.textGrey, // Replace with your desired hint text color
          ),
        ),
      ),
    );
  }
}
