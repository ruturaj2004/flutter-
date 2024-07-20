import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_colors.dart';
import '../../../logic/profile/profile_cubit.dart';
import '../../../widgets/custom_circular_progress_indicator.dart';
import '../../../widgets/sizedbox_widget.dart';
import '../../../widgets/text_widget.dart';
import '../../../widgets/textformfield_widget.dart';

class BasicInfoBottomSheet {
  void basicInfoBottomSheet(
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
                return const Center(child: CustomCircularProgressIndidator());
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
                    height: 380.h,
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
                            initialValue:
                                state.userData?.data?.phoneNumber.toString() ??
                                    "",
                            onChanged: (value) {
                              state.userData?.data?.phoneNumber =
                                  int.tryParse(value);
                            },
                            textColor: AppColors.blackColor,
                            inputFormater: [
                              LengthLimitingTextInputFormatter(10)
                            ],
                            hintText: "phone_no".tr(),
                          ),
                          TextformFieldWidget(
                            initialValue: state.userData?.data?.email ?? "",
                            onChanged: (value) {
                              state.userData?.data?.email = value;
                            },
                            textColor: AppColors.blackColor,
                            hintText: "email".tr(),
                          ),
                          TextformFieldWidget(
                            initialValue: state.userData?.data?.whatsappNumber
                                    .toString() ??
                                "",
                            onChanged: (value) {
                              state.userData?.data?.whatsappNumber = value;
                            },
                            textColor: AppColors.blackColor,
                            inputFormater: [
                              LengthLimitingTextInputFormatter(10)
                            ],
                            hintText: "whatsapp_no".tr(),
                          ),
                          TextformFieldWidget(
                            initialValue:
                                state.userData?.data?.aadress.toString() ?? "",
                            onChanged: (value) {
                              state.userData?.data?.aadress = value;
                            },
                            hintText: "address".tr(),
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
      return SizedBox(
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
                    state.userData?.data?.whatsappNumber.toString() ?? "",
                    state.userData?.data?.aadress.toString() ?? "",
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
