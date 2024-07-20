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

class ProfileBottomSheet {
  void profileBottomSheet(
    BuildContext context,
  ) {
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
          return BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const SizedBox();
                // const Center(child: CustomCircularProgressIndidator());
              }
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(42),
                    topRight: Radius.circular(42),
                  ),
                  child: SizedBox(
                    height: 460.h,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 28, right: 28, left: 28, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "contact_info".tr(),
                            fontSize: 16.sp,
                            color: AppColors.profileTextBlueColor,
                          ),
                          TextformFieldWidget(
                            initialValue: state.userData?.data?.firstName,
                            fontSize: 18.sp,
                            onChanged: (value) {
                              state.userData?.data?.firstName = value;
                            },
                            textColor: AppColors.blackColor,
                            hintText: "name".tr(),
                          ),
                          TextformFieldWidget(
                            initialValue: state.userData?.data?.lastName,
                            fontSize: 18.sp,
                            onChanged: (value) {
                              state.userData?.data?.lastName = value;
                            },
                            textColor: AppColors.blackColor,
                            hintText: "surname".tr(),
                          ),
                          // const TextformFieldWidget(
                          //   hintText: "वय",
                          // ),
                          TextformFieldWidget(
                            initialValue: state.userData?.data?.dob.toString(),
                            fontSize: 18.sp,
                            onChanged: (value) {
                              state.userData?.data?.dob = value as DateTime?;
                            },
                            textColor: AppColors.blackColor,
                            hintText: "dob".tr(),
                          ),
                          Row(children: [
                            Checkbox(
                              value: context.read<ProfileCubit>().isMale,
                              onChanged: (value) {
                                context
                                    .read<ProfileCubit>()
                                    .toggleGender(value ?? false);
                                if (value == true) {
                                  print("पुरुष is selected");
                                }
                              },
                            ),
                            TextWidget(
                              text: "male".tr(),
                              fontSize: 18.sp,
                              color: AppColors.blackColor,
                            ),
                            const SizedBoxWidget(
                              width: 50,
                            ),
                            Checkbox(
                              value: !context.read<ProfileCubit>().isMale,
                              onChanged: (value) {
                                context
                                    .read<ProfileCubit>()
                                    .toggleGender(!(value ?? false));
                                if (value == true) {
                                  print("स्त्री is selected");
                                }
                              },
                            ),
                            TextWidget(
                              text: "female".tr(),
                              fontSize: 18.sp,
                              color: AppColors.blackColor,
                            ),
                          ]),
                          const SizedBoxWidget(
                            height: 10,
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
        });
  }

  _saveButtonWidget() {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      if (state is ProfileLoading) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          child: const Center(
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
              context.read<ProfileCubit>().updateUserProfile(
                    state.userData?.data?.firstName ?? "",
                    state.userData?.data?.lastName ?? "",
                    state.userData?.data?.dob.toString() ?? "",
                    state.userData?.data?.phoneNumber.toString() ?? "",
                    state.userData?.data?.email ?? "",
                    state.userData?.data?.whatsappNumber ?? "",
                    state.userData?.data?.aadress ?? "",
                    // state.userData?.data?.aadharNumber.toString() ?? "",
                    state.userData?.data?.panNumber ?? "",
                    state.userData?.data?.passport ?? "",
                  );
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
    return SizedBox(
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
