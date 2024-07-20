import 'package:easypanchayat/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';
import '../logic/profile/profile_cubit.dart';
import 'custom_circular_progress_indicator.dart';

class CustomBottomSheetWidget extends StatefulWidget {
  const CustomBottomSheetWidget({
    Key? key,
    required this.height,
    required this.headingText,
    this.textFormField,
    this.hintText,
    this.initialValue,
  }) : super(key: key);

  final double height;
  final String? headingText;
  final String? hintText;
  final String? initialValue;
  final Widget? textFormField;

  @override
  State<CustomBottomSheetWidget> createState() =>
      _CustomBottomSheetWidgetState();
}

class _CustomBottomSheetWidgetState extends State<CustomBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return _basicInfoBottomSheet();
  }

  _basicInfoBottomSheet() {
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
                child: Container(
                  height: 380.h,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 28, right: 28, left: 28, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: widget.headingText!,
                          fontSize: 16.sp,
                          color: AppColors.profileTextBlueColor,
                        ),
                        widget
                            .textFormField!, // Use the provided textFormField directly here
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            _saveButtonWidget(),
                            const SizedBox(width: 20),
                            _cancelButtonWidget(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

// class CustomBottomSheetWidget extends StatefulWidget {
//   const CustomBottomSheetWidget(
//       {super.key,
//       required this.height,
//       required this.headingText,
//       this.textFormField,
//       this.hintText,
//       this.inputFormater = false,
//       this.initialValue});

//   final double height;
//   final String? headingText;
//   final String? hintText;
//   final String? initialValue;
//   final bool? inputFormater;
//   final Widget? textFormField;

//   @override
//   State<CustomBottomSheetWidget> createState() =>
//       _CustomBottomSheetWidgetState();
// }

// class _CustomBottomSheetWidgetState extends State<CustomBottomSheetWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return _basicInfoBottomSheet();
//   }

//   _basicInfoBottomSheet() {
//     showModalBottomSheet(
//         context: context,
//         isScrollControlled: true,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(42),
//             topRight: Radius.circular(42),
//           ),
//         ),
//         builder: (BuildContext context) {
//           return BlocBuilder<ProfileCubit, ProfileState>(
//             builder: (context, state) {
//               if (state is ProfileLoading) {
//                 return const Center(child: CustomCircularProgressIndidator());
//               }
//               return Padding(
//                 padding: EdgeInsets.only(
//                     bottom: MediaQuery.of(context).viewInsets.bottom),
//                 child: ClipRRect(
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(42),
//                     topRight: Radius.circular(42),
//                   ),
//                   child: Container(
//                     height: 380.h,
//                     child: Padding(
//                       padding: const EdgeInsets.only(
//                           top: 28, right: 28, left: 28, bottom: 10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           TextWidget(
//                             text: widget.headingText,
//                             fontSize: 16.sp,
//                             color: AppColors.profileTextBlueColor,
//                           ),
//                           TextformFieldWidget(
//                             initialValue: widget.initialValue ?? '',
//                             onChanged: (value) {
//                               state.userData?.data?.phoneNumber =
//                                   int.tryParse(value);
//                             },
//                             textColor: AppColors.blackColor,
//                             inputFormater: widget.inputFormater != null
//                                 ? [LengthLimitingTextInputFormatter(10)]
//                                 : [],
//                             hintText: widget.hintText,
//                           ),
//                           // TextformFieldWidget(
//                           //   initialValue: state.userData?.data?.email ?? "",
//                           //   onChanged: (value) {
//                           //     state.userData?.data?.email = value;
//                           //   },
//                           //   textColor: AppColors.blackColor,
//                           //   hintText: "ईमेल",
//                           // ),
//                           // TextformFieldWidget(
//                           //   initialValue: state.userData?.data?.whatsappNumber
//                           //           .toString() ??
//                           //       "",
//                           //   onChanged: (value) {
//                           //     state.userData?.data?.whatsappNumber = value;
//                           //   },
//                           //   textColor: AppColors.blackColor,
//                           //   inputFormater: [
//                           //     LengthLimitingTextInputFormatter(10)
//                           //   ],
//                           //   hintText: "व्हाट्सअँप नंबर",
//                           // ),
//                           // const TextformFieldWidget(
//                           //   hintText: "पत्ता",
//                           // ),
//                           // SizedBoxWidget(
//                           //   height: 20,
//                           // ),
//                           Row(
//                             children: [
//                               _saveButtonWidget(),
//                               SizedBoxWidget(
//                                 width: 20,
//                               ),
//                               _cancelButtonWidget(),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         });
//   }

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
              // context.read<ProfileCubit>().updateUserProfile(
              //       state.userData?.data?.firstName ?? "",
              //       state.userData?.data?.lastName ?? "",
              //       state.userData?.data?.phoneNumber.toString() ?? "",
              //       state.userData?.data?.whatsappNumber.toString() ?? "",
              //       state.userData?.data?.email ?? "",
              //     );
              Navigator.of(context).pop();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(AppColors
                  .saveButtonColor), // Change the background color here
            ),
            child: Center(
              child: TextWidget(
                text: "सेव्ह करा",
                color: AppColors.whiteColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            )),
      );
    });
  }

  _cancelButtonWidget() {
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
              text: "बंद करा",
              color: AppColors.blackColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
