import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salesman_app/constant/app_color.dart';
import 'package:salesman_app/widget/sized_box_widget.dart';
import 'package:salesman_app/widget/text_widget.dart';

// ignore: must_be_immutable
class QuantityWidget extends StatefulWidget {
  QuantityWidget({
    Key? key,
    this.quantity = 0,
    this.width = 100,
    required this.onIncrementQuantity,
    required this.onDecrementQuantity,
  }) : super(key: key);
  int quantity;
  final double width;
  final void Function(int) onIncrementQuantity;
  final void Function(int) onDecrementQuantity;
  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            InkWell(
              onTap: () => decreaseValue(),
              child: Container(
                alignment: Alignment.center,
                height: 20.h,
                width: 20.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.r),
                    border: Border.all(color: AppColors.borderColor)),
                child: Icon(
                  Icons.remove,
                  color: const Color.fromARGB(255, 20, 17, 17),
                  size: 15.h,
                ),
              ),
            ),
            const SizedBoxWidget(width: 10),
            Container(
              height: 20.h,
              width: 20.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.r),
                  border: Border.all(color: AppColors.borderColor)),
              child: TextWidget(
                data: widget.quantity.toString(),
                fontSize: 15.sp,
              ),
            ),
            const SizedBoxWidget(width: 10),
            InkWell(
              onTap: () => incrementValue(),
              child: Container(
                alignment: Alignment.center,
                height: 20.h,
                width: 20.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.r),
                    border: Border.all(color: AppColors.borderColor)),
                child: Icon(
                  Icons.add,
                  color: const Color.fromARGB(255, 20, 17, 17),
                  size: 15.h,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void incrementValue() {
    setState(() {
      widget.quantity++;
    });
    widget.onIncrementQuantity(widget.quantity);
  }

  void decreaseValue() {
    if (widget.quantity > 1) {
      setState(() {
        widget.quantity--;
      });

      widget.onIncrementQuantity(widget.quantity);
    }
  }
}
