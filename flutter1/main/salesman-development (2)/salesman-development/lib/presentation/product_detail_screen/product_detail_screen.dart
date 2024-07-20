import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:salesman_app/model/search_products_model/search_products_res_model.dart';
import 'package:salesman_app/utils/app_utils/extensions.dart';
import 'package:salesman_app/widget/sized_box_widget.dart';
import 'package:salesman_app/widget/text_widget.dart';

import '../../utils/app_utils/calculate_tax.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    this.productModel,
    Key? key,
  }) : super(key: key);

  final searchProducts? productModel;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _titleBarWidget(context),
              SizedBox(height: 20.h),
              Center(
                child: SizedBoxWidget(
                  height: 200,
                  width: 200,
                  child: Image.network(
                    "${widget.productModel?.pictures?[0]}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              _productDetailWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleBarWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                context.pop();
              },
              child: Icon(Icons.keyboard_backspace, size: 25.h),
            ),
            const SizedBoxWidget(width: 5),
            TextWidget(
              data: "Product Detail Screen",
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ],
    );
  }

  _productDetailWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 450.h,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                data: widget.productModel?.name ?? "",
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 2.h,
              ),
              TextWidget(
                data: widget.productModel?.category ?? "",
                fontSize: 14.sp,
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  TextWidget(
                    data: Calculations.getPriceWithTotalTax(
                            item: widget.productModel)
                        .toInt()
                        .inRupeesFormat(),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  TextWidget(
                    data: Calculations.getPriceWithMarketPrice(
                            item: widget.productModel)
                        .toInt()
                        .inRupeesFormat(),
                    fontSize: 16.sp,
                    color: const Color(0XFFB7B7B7),
                    lineThrough: true,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              Html(
                data: widget.productModel?.value?.description ?? "",
                style: {
                  "body": Style(
                    fontSize: FontSize(
                      16.sp,
                    ),
                  ),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
