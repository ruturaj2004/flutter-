import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_colors.dart';

import '../../../logic/profile/profile_cubit.dart';
import '../../../widgets/custom_circular_progress_indicator.dart';
import '../../../widgets/sizedbox_widget.dart';
import '../../../widgets/text_widget.dart';
import '../../../widgets/textformfield_widget.dart';

class CastBottomSheet {  
  void castBottomSheet (BuildContext context,) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(42),
          topRight: Radius.circular(42),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(42),
              topRight: Radius.circular(42),
            ),
            child: Container(
              height: 320.h,
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "religion_caste".tr(),
                      fontSize: 16.sp,
                      color: AppColors.profileTextBlueColor,
                    ),
                    TextformFieldWidget(
                      hintText: "religion".tr(),
                    ),
                    TextformFieldWidget(
                      hintText: "caste".tr(),
                    ),
                     TextformFieldWidget(
                      hintText: "category".tr(),
                    ),
                    const SizedBoxWidget(
                      height: 20,
                    ),
                    Row(
                      children: [
                        _saveButtonWidget(),
                        const SizedBoxWidget(
                          width: 20,
                        ),
                        _cancelButtonWidget(context),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  
  _saveButtonWidget() {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      if (state is ProfileLoading) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          child: const Center(   // context.read<ProfileCubit>().updateUserProfile(
              //       state.userData?.data?.firstName ?? "",
              //       state.userData?.data?.lastName ?? "",
              //       state.userData?.data?.phoneNumber.toString() ?? "",
              //       state.userData?.data?.whatsappNumber.toString() ?? "",
              //       state.userData?.data?.email ?? "",
              //     );
              child: Padding(
            padding: EdgeInsets.only(top: 50),
            child: CustomCircularProgressIndidator(),
          )),
        );
      }
      return Container(
        height: 52.h,
        width: 134.w,
        child: TextButton(
            onPressed: () {
           
              Navigator.of(context).pop();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(AppColors
                  .saveButtonColor), // Change the background color here
            ),
            child: Center(
              child: TextWidget(
                text: "save".tr(),
                color: AppColors.whiteColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            )),
      );
    });
  }

  _cancelButtonWidget(context) {
    return Container(
      height: 52.h,
      width: 134.w,
      child: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                AppColors.buttonColor), // Change the background color here
          ),
          child: Center(
            child: TextWidget(
              text: "cancel".tr(),
              color: AppColors.blackColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}