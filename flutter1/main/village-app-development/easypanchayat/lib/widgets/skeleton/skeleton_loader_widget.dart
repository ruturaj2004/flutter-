import 'package:easypanchayat/widgets/sizedbox_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletons/skeletons.dart';

class CustomSkeletonLoader extends StatelessWidget {
  const CustomSkeletonLoader(
      {super.key,
      required this.context,
      this.height = 150,
      this.propertyList = false});
  final BuildContext context;
  final int? height;
  final bool propertyList;

  @override
  Widget build(BuildContext context) {
    return propertyList
        ? Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                            height: 140.h,
                            width: MediaQuery.of(context).size.width),
                      ),
                      SizedBoxWidget(
                        height: 20,
                      ),
                    ],
                  );
                }),
          )
        : Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SkeletonAvatar(
                  style: SkeletonAvatarStyle(height: 25.h, width: 80.w),
                ),
                SkeletonAvatar(
                  style: SkeletonAvatarStyle(height: 25.h, width: 80.w),
                )
              ],
            ),
            SizedBoxWidget(
              height: 10,
            ),
            SkeletonAvatar(
              style: SkeletonAvatarStyle(
                  height: height?.h, width: MediaQuery.of(context).size.width),
            )
          ]);
  }
}
