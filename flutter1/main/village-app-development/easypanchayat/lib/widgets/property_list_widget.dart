import 'package:easy_localization/easy_localization.dart';
import 'package:easypanchayat/widgets/sizedbox_widget.dart';
import 'package:easypanchayat/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';
import '../model/property_list_response_model/property_list_response_model.dart';
import '../presentations/property_detail/property_detail.dart';

class PropertyListWidget extends StatelessWidget {
  const PropertyListWidget({super.key, this.item});

  final Datum? item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PropertyDetail()));
      },
      child: Container(
        color: AppColors.whiteColor,
        padding:
            const EdgeInsets.only(left: 23, top: 15, right: 20, bottom: 15),
        child: Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "property_no".tr(),
                      fontSize: 16.sp,
                    ),
                    const SizedBoxWidget(
                      height: 5,
                    ),
                    TextWidget(
                      text: item?.propertyDetails?.propertyId != null
                          ? item?.propertyDetails?.propertyId.toString()
                          : '---',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBoxWidget(
                  width: 80,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "index".tr(),
                      fontSize: 16.sp,
                    ),
                    const SizedBoxWidget(
                      height: 5,
                    ),
                    TextWidget(
                      text: item?.propertyDetails?.id != null
                          ? item?.propertyDetails?.id.toString()
                          : '---',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBoxWidget(
                  width: 80,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "floor".tr(),
                      fontSize: 16.sp,
                    ),
                    const SizedBoxWidget(
                      height: 5,
                    ),
                    TextWidget(
                      text: '1',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                )
              ],
            ),
            const SizedBoxWidget(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "area".tr(),
                      fontSize: 16.sp,
                    ),
                    const SizedBoxWidget(
                      height: 5,
                    ),
                    TextWidget(
                      text: item?.floors?.first.areapermeter != null
                          ? item?.floors?.first.areapersqrt.toString()
                          : '---',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBoxWidget(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "total_property_tax".tr(),
                      fontSize: 16.sp,
                    ),
                    const SizedBoxWidget(
                      height: 5,
                    ),
                    TextWidget(
                      text: item?.floors?.first.totalPropertyTax != null
                          ? item?.floors?.first.totalPropertyTax.toString()
                          : '---',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBoxWidget(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: " ",
                      fontSize: 16.sp,
                    ),
                    const SizedBoxWidget(
                      height: 5,
                    ),
                    TextWidget(
                      text: "pending".tr(),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.redTextColor,
                    ),
                  ],
                )
              ],
            ),
            const SizedBoxWidget(
              height: 10,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         TextWidget(
            //           text: "पत्ता",
            //           fontSize: 16.sp,
            //         ),
            //         SizedBoxWidget(
            //           height: 5,
            //         ),
            //         TextWidget(
            //           text: state.items.first.
            //               "WARD NO 3, GAVTHAN, GHOLEWADI RD,\nPAREGAON KH, TAL SANGAMNER",
            //           fontSize: 18.sp,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
