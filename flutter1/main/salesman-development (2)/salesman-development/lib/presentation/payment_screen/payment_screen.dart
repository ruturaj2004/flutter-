import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salesman_app/constant/app_color.dart';
import 'package:salesman_app/constant/app_string.dart';
import 'package:salesman_app/widget/button_widget.dart';
import 'package:salesman_app/widget/custom_icon_widget.dart';
import 'package:salesman_app/widget/sized_box_widget.dart';
import 'package:salesman_app/widget/textFormFiled.dart';
import 'package:salesman_app/widget/text_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

List<String> select = [
  "Select Status",
  "Paid",
  "Unpaid",
  "Partially paid",
];

class _PaymentScreenState extends State<PaymentScreen> {
  String? dropdownValue = "Select Status";

  String? _paymentMode = '';
  bool isClick = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconWidget(iconData: Icons.arrow_back),
        title: TextWidget(
          data: "Payment Method",
          fontSize: 15.sp,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _radioListwidget(),
            _dropDownWidget(),
            SizedBoxWidget(height: 100.h),
            _buttonWidget(),
          ],
        ),
      ),
    );
  }

  _radioListwidget() {
    return Column(
      children: [
        RadioListTile<String>(
          title: TextWidget(
            data: 'Pay by Cash',
            fontSize: 15.sp,
          ),
          value: "Pay by Cash",
          groupValue: _paymentMode,
          onChanged: (String? value) {
            // isClick = true;
            setState(() {
              _paymentMode = value;
            });
          },
        ),
        if (_paymentMode == "Pay by Cash")
          Container(
            height: 40.h,
            width: 250.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.purpalColor),

            // height: isClick ? 40.h : 40.h,
            child: Center(
              child: TextWidget(
                data: "32000",
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        RadioListTile<String>(
          title: TextWidget(
            data: 'pay using UPI',
            fontSize: 15.sp,
          ),
          value: "pay using UPI",
          groupValue: _paymentMode,
          onChanged: (String? value) {
            setState(() {
              _paymentMode = value;
            });
          },
        ),
        if (_paymentMode == "pay using UPI")
          SizedBox(
            width: 200.w,
            // height: isClick ? 30.h : 30.h,
            child: const CustomTextFormFieldWidget(
              hintText: 'baap22@upi',
            ),
          ),
        RadioListTile<String>(
          title: TextWidget(
            data: 'Scan QR code',
            fontSize: 15.sp,
          ),
          value: 'Scan QR code',
          groupValue: _paymentMode,
          onChanged: (String? value) {
            setState(() {
              _paymentMode = value;
            });
          },
        ),
        if (_paymentMode == "Scan QR code")
          SizedBoxWidget(
            width: 200,
            // height: isClick ? 40.h : 40.h,
            child: Column(
              children: [
                const CustomTextFormFieldWidget(
                  hintText: '',
                ),
                SizedBoxWidget(
                  height: 10.h,
                ),
                CustomOutlinedButton(
                  backgroundColor: AppColors.purpalColor,
                  buttonText: "Generate QR",
                  onPressed: () {},
                )
              ],
            ),
          ),
      ],
    );
  }

  _dropDownWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      child: Column(
        children: [
          TextWidget(
            data: "Payment Status",
            fontSize: 20.sp,
            fontWeight: FontWeight.w900,
          ),
          const SizedBoxWidget(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              // color: AppColors.purpalColor, // Set the desired background color
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.keyboard_arrow_down),
                iconSize: 40.sp,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue ?? '';
                  });
                },
                items: select.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: TextWidget(
                      data: value,
                      fontSize: 15.sp,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buttonWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomOutlinedButton(
          onPressed: () {},
          buttonText: AppString.save,
          fontSize: 15.sp,
          backgroundColor: AppColors.borderColor,
        ),
        const SizedBoxWidget(width: 3),
        CustomOutlinedButton(
          onPressed: () {
            // context.pop();
          },
          buttonText: AppString.cancel,
          fontSize: 15.sp,
          backgroundColor: AppColors.backgroundDark,
          customBorderSide: const BorderSide(),
        ),
      ],
    );
  }
}
