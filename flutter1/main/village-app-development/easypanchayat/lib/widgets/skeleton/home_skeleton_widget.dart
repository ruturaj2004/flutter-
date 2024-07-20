import 'package:easypanchayat/widgets/sizedbox_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletons/skeletons.dart';

class CustomHomeSkeletonWidget extends StatelessWidget {
  const CustomHomeSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 25, right: 20, bottom: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SkeletonAvatar(
                style: SkeletonAvatarStyle(height: 60.h, width: 130.w),
              ),
              SkeletonAvatar(
                style: SkeletonAvatarStyle(
                    height: 60.h, width: 50, shape: BoxShape.circle),
              )
            ],
          ),
          const SizedBoxWidget(
            height: 30,
          ),
          SkeletonAvatar(
            style: SkeletonAvatarStyle(
                height: 230.h, width: MediaQuery.of(context).size.width),
          ),
          const SizedBoxWidget(
            height: 20,
          ),
          SkeletonAvatar(
            style: SkeletonAvatarStyle(
                height: 70.h,
                borderRadius: BorderRadius.circular(50),
                width: MediaQuery.of(context).size.width,
                shape: BoxShape.rectangle),
          ),
          const SizedBoxWidget(
            height: 60,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            padding: EdgeInsets.zero,
            itemCount: 6,
            itemBuilder: (context, index) {
              return SkeletonAvatar(
                style: SkeletonAvatarStyle(
                  height: 40.h,
                  width: 40.w,
                  padding: const EdgeInsets.only(
                    bottom: 10,
                    right: 10,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
