import 'package:easy_localization/easy_localization.dart';
import 'package:easypanchayat/presentations/profile_screen/component/document_bottom_sheet.dart';
import 'package:easypanchayat/presentations/profile_screen/component/family_info_bottom_sheet.dart';
import 'package:easypanchayat/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_enums.dart';
import '../../logic/image_upload/image_upload_cubit.dart';
import '../../logic/profile/profile_cubit.dart';
import '../../widgets/custom_circular_progress_indicator.dart';
import '../../widgets/custom_outline_button.dart';
import '../../widgets/dashed_divider_widget.dart';
import '../../widgets/footer_widget.dart';
import '../../widgets/sizedbox_widget.dart';
import '../../widgets/skeleton/skeleton_loader_widget.dart';
import 'component/basic_info_bottom_sheet.dart';
import 'component/cast_bottom_sheet.dart';
import 'component/profile_info_bottom_sheet.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with WidgetsBindingObserver {
  bool isBottomSheetOpen = false;
  final box = GetStorage();
  @override
  void initState() {
    // context.read<ProfileCubit>().getUserData();
    context.read<ProfileCubit>().getUserProfileData();
    WidgetsBinding.instance.addObserver(this);
    final url = _readValue();
    print("${url}...............");
    super.initState();
  }

  _readValue() {
    final url = box.read('imageUrl');
    bool isUrlStored = box.hasData('imageUrl');

    if (isUrlStored) {
      print('URL is stored: $url');
    } else {
      print('URL is not stored');
    }
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileLoaded) {
            // context.pop(context);
          }
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.whiteColor,
            body: Stack(children: [
              _imageWidget(),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _profileInfo(),
                const SizedBoxWidget(
                  height: 16,
                ),
                SizedBox(
                  height: 575.h,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _basicInfo(),
                        const SizedBoxWidget(
                          height: 20,
                        ),
                        _documentWidget(),
                        const SizedBoxWidget(
                          height: 20,
                        ),
                        _castWidget(),
                        const SizedBoxWidget(
                          height: 20,
                        ),
                        _familyInfo(),
                      ],
                    ),
                  ),
                ),
              ]),
            ]),
            bottomNavigationBar: const FooterWidget(
              isBackgroundColor: true,
            ),
          ),
        ));
  }

  _imageWidget() {
    return Positioned(
      bottom: 0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          'assets/image/background_img.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _profileInfo() {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      if (state is ProfileLoading) {
        return Padding(
          padding: const EdgeInsets.only(right: 20, left: 25, top: 40),
          child: CustomSkeletonLoader(
            context: context,
          ),
        );
      } else if (state is ProfileUploadSuccess) {
        setState(() {
          context.read<ProfileCubit>().getUserData();
        });
      }
      return Container(
          width: MediaQuery.of(context).size.width,
          height: 185.h,
          color: AppColors.profileBackgroundColor,
          child: Padding(
              padding: const EdgeInsets.only(
                  top: 32, left: 27, bottom: 33, right: 25),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/image/left_arrow.svg', // Replace with your SVG image path
                                height: 16.h,
                                width: 10.w,
                                color: AppColors.blackColor,
                              ),
                              const SizedBoxWidget(
                                width: 11,
                              ),
                              TextWidget(
                                text: "profile".tr(),
                                fontSize: 18.sp,
                                color: AppColors.profileTextColor,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    CustomOutlinedButton(
                      buttonText: 'edit'.tr(),
                      onPressed: () {
                        _openBottomSheet(BottomSheetType.profileInfo);
                      },
                    )
                  ],
                ),
                const SizedBoxWidget(
                  height: 8,
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Column(
                    children: [
                      Stack(children: [
                        Container(
                            height: 83.h,
                            width: 80.w,
                            color: AppColors.backgroundDark,
                            child: Image.network(
                              state.userData?.data?.signUrl.toString() ?? '',
                              fit: BoxFit.cover,
                            )),
                        Positioned(
                          top: 50,
                          left: 45,
                          child: IconButton(
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.black,
                              size: 26.h,
                            ),
                            onPressed: () {
                              _uploadImageBottomSheet(context);
                            },
                          ),
                        )
                      ]),
                    ],
                  ),
                  const SizedBoxWidget(
                    width: 21,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TextWidget(
                            text: state.userData?.data?.firstName != null
                                ? state.userData?.data?.firstName.toString()
                                : '---',
                            fontSize: 38.sp,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBoxWidget(
                            width: 5,
                          ),
                          TextWidget(
                            text: state.userData?.data?.lastName != null
                                ? state.userData?.data?.lastName.toString()
                                : '---',
                            fontSize: 40.sp,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBoxWidget(
                            width: 15,
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: state.userData?.data?.dob != null
                                ? state.userData?.data?.dob.toString()
                                : '---',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBoxWidget(
                            width: 15,
                          ),
                          // TextWidget(
                          //   text: 'male',
                          //   fontSize: 16.sp,
                          //   fontWeight: FontWeight.bold,
                          // ),
                        ],
                      )
                    ],
                  )
                ])
              ])));
    });
  }

  void _uploadImageBottomSheet(BuildContext context) {
    showModalBottomSheet(
        // isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 150.h,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<ProfileCubit>().pickImage(context);
                      },
                      child: TextWidget(
                        text: "Upload Gallery",
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    InkWell(
                      onTap: () {
                        context
                            .read<ProfileCubit>()
                            .captureAndUploadImage(context);
                      },
                      child: TextWidget(
                        text: "Take Photo",
                        fontSize: 15.sp,
                      ),
                    ),
                  ]),
            ),
          );
        });
  }

  _basicInfo() {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      if (state is ProfileLoading) {
        return Padding(
          padding: const EdgeInsets.only(right: 20, left: 25, top: 25),
          child: CustomSkeletonLoader(
            context: context,
          ),
        );
      }
      return Padding(
        padding: const EdgeInsets.only(left: 27, right: 26),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: "contact_info".tr(),
                  fontSize: 16.sp,
                  color: AppColors.profileTextBlueColor,
                ),
                CustomOutlinedButton(
                  buttonText: 'edit'.tr(),
                  onPressed: () {
                    _openBottomSheet(BottomSheetType.basicInfo);
                  },
                ),
              ],
            ),
            const SizedBoxWidget(
              height: 5,
            ),
            const DashedDivider(),
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
                      text: "phone_no".tr(),
                      fontSize: 14.sp,
                      color: AppColors.profileTextColor,
                    ),
                    const SizedBoxWidget(
                      height: 5,
                    ),
                    TextWidget(
                      text: state.userData?.data?.phoneNumber != null
                          ? state.userData?.data?.phoneNumber.toString()
                          : '---',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                  ],
                ),
                const SizedBoxWidget(
                  width: 60,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "email".tr(),
                      fontSize: 14.sp,
                      color: AppColors.profileTextColor,
                    ),
                    const SizedBoxWidget(
                      height: 5,
                    ),
                    SizedBox(
                      width: 200.w,
                      child: TextWidget(
                        text: state.userData?.data?.email != null
                            ? state.userData?.data?.email.toString()
                            : '---',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBoxWidget(
              height: 10,
            ),
            Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "whatsapp_no".tr(),
                    fontSize: 14.sp,
                    color: AppColors.profileTextColor,
                  ),
                  const SizedBoxWidget(
                    height: 5,
                  ),
                  TextWidget(
                    text: state.userData?.data?.whatsappNumber != null
                        ? state.userData?.data?.whatsappNumber
                        : '---',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                ],
              ),
            ]),
            const SizedBoxWidget(
              height: 10,
            ),
            Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "address".tr(),
                    fontSize: 14.sp,
                    color: AppColors.profileTextColor,
                  ),
                  const SizedBoxWidget(
                    height: 5,
                  ),
                  TextWidget(
                    text: state.userData?.data?.aadress != null
                        ? state.userData?.data?.aadress
                        : '---',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                ],
              ),
            ])
          ],
        ),
      );
    });
  }

  _documentWidget() {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      if (state is ProfileLoading) {
        return Padding(
          padding: const EdgeInsets.only(right: 20, left: 25, top: 25),
          child: CustomSkeletonLoader(
            context: context,
          ),
        );
      }
      return Padding(
        padding: const EdgeInsets.only(left: 27, right: 26),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: "identity_cards".tr(),
                  fontSize: 16.sp,
                  color: AppColors.blueTextColor,
                ),
                CustomOutlinedButton(
                  buttonText: 'edit'.tr(),
                  onPressed: () {
                    _openBottomSheet(BottomSheetType.document);
                  },
                ),
              ],
            ),
            const SizedBoxWidget(
              height: 5,
            ),
            const DashedDivider(),
            const SizedBoxWidget(
              height: 10,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "aadhar_no".tr(),
                      fontSize: 14.sp,
                      color: AppColors.profileTextColor,
                    ),
                    const SizedBoxWidget(
                      height: 5,
                    ),
                    TextWidget(
                      text: state.userData?.data?.aadharNumber != null
                          ? state.userData?.data?.aadharNumber.toString()
                          : '---',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                  ],
                ),
                const SizedBoxWidget(
                  width: 91,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "pan_no".tr(),
                      fontSize: 14.sp,
                      color: AppColors.profileTextColor,
                    ),
                    const SizedBoxWidget(
                      height: 5,
                    ),
                    TextWidget(
                      text: state.userData?.data?.panNumber != null
                          ? state.userData?.data?.panNumber.toString()
                          : '---',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                  ],
                )
              ],
            ),
            const SizedBoxWidget(
              height: 10,
            ),
            Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "passport_no".tr(),
                    fontSize: 14.sp,
                    color: AppColors.profileTextColor,
                  ),
                  const SizedBoxWidget(
                    height: 5,
                  ),
                  TextWidget(
                    text: state.userData?.data?.passport ?? '---',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                ],
              ),
            ]),
          ],
        ),
      );
    });
  }

  _castWidget() {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      if (state is ProfileLoading) {
        return const SizedBox();
      }
      return Padding(
        padding: const EdgeInsets.only(left: 27, right: 26),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: "religion_caste".tr(),
                  fontSize: 16.sp,
                  color: AppColors.blueTextColor,
                ),
                CustomOutlinedButton(
                  buttonText: 'edit'.tr(),
                  onPressed: () {
                    _openBottomSheet(BottomSheetType.castInfo);
                  },
                ),
              ],
            ),
            const SizedBoxWidget(
              height: 5,
            ),
            const DashedDivider(),
            const SizedBoxWidget(
              height: 10,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "religion".tr(),
                      fontSize: 14.sp,
                      color: AppColors.profileTextColor,
                    ),
                    const SizedBoxWidget(
                      height: 5,
                    ),
                    TextWidget(
                      text: state.userData?.data?.religion?.name != null
                          ? state.userData?.data?.religion?.name
                          : '---',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                  ],
                ),
                const SizedBoxWidget(
                  width: 100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "caste".tr(),
                      fontSize: 14.sp,
                      color: AppColors.profileTextColor,
                    ),
                    const SizedBoxWidget(
                      height: 5,
                    ),
                    TextWidget(
                      text: state.userData?.data?.categories?.name != null
                          ? state.userData?.data?.categories?.name
                          : '---',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                  ],
                ),
                const SizedBoxWidget(
                  width: 100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "category".tr(),
                      fontSize: 14.sp,
                      color: AppColors.profileTextColor,
                    ),
                    const SizedBoxWidget(
                      height: 5,
                    ),
                    TextWidget(
                      text: state.userData?.data?.subcategory != null
                          ? state.userData?.data?.subcategory.toString()
                          : '---',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      );
    });
  }

  _familyInfo() {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      if (state is ProfileLoading) {
        return const SizedBox();
      }

      return Padding(
        padding: const EdgeInsets.only(left: 27, right: 26),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: "family_info".tr(),
                  fontSize: 16.sp,
                  color: AppColors.blueTextColor,
                ),
                CustomOutlinedButton(
                  buttonText: 'edit'.tr(),
                  onPressed: () {
                    _openBottomSheet(BottomSheetType.familyInfo);
                  },
                ),
              ],
            ),
            const SizedBoxWidget(
              height: 5,
            ),
            const DashedDivider(),
            const SizedBoxWidget(
              height: 10,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "mother_name".tr(),
                      fontSize: 14.sp,
                      color: AppColors.profileTextColor,
                    ),
                    const SizedBoxWidget(
                      height: 5,
                    ),
                    TextWidget(
                      text: state.userData?.data?.motherName != null
                          ? state.userData?.data?.motherName.toString()
                          : '---',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
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
                      text: "father_name".tr(),
                      fontSize: 14.sp,
                      color: AppColors.profileTextColor,
                    ),
                    const SizedBoxWidget(
                      height: 5,
                    ),
                    TextWidget(
                      text: state.userData?.data?.middleName != null
                          ? state.userData?.data?.middleName.toString()
                          : '---',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
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
                      text: "spouse_name".tr(),
                      fontSize: 14.sp,
                      color: AppColors.profileTextColor,
                    ),
                    const SizedBoxWidget(
                      height: 5,
                    ),
                    TextWidget(
                      text: state.userData?.data?.spouseName != null
                          ? state.userData?.data?.spouseName.toString()
                          : '---',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                  ],
                )
              ],
            ),
            // const SizedBoxWidget(
            //   height: 10,
            // ),
            // Row(children: [
            //   Checkbox(value: false, onChanged: (value) {}),
            //   TextWidget(
            //     text: "अविवाहित",
            //     fontSize: 18.sp,
            //     fontWeight: FontWeight.bold,
            //     color: AppColors.blackColor,
            //   ),
            //   const SizedBoxWidget(
            //     width: 50,
            //   ),
            //   Checkbox(value: false, onChanged: (value) {}),
            //   TextWidget(
            //     text: "विवाहित",
            //     fontSize: 18.sp,
            //     fontWeight: FontWeight.bold,
            //     color: AppColors.blackColor,
            //   ),
            // ]),
          ],
        ),
      );
    });
  }

  void _openBottomSheet(BottomSheetType sheetType) {
    ProfileBottomSheet profileInstance = ProfileBottomSheet();
    BasicInfoBottomSheet basicInfoInstance = BasicInfoBottomSheet();
    DocumentBottomSheet documentInstance = DocumentBottomSheet();
    CastBottomSheet castInstance = CastBottomSheet();
    FamilyInfoBottomSheet myInstance = FamilyInfoBottomSheet();

    switch (sheetType) {
      case BottomSheetType.profileInfo:
        profileInstance.profileBottomSheet(context);
        break;
      case BottomSheetType.basicInfo:
        basicInfoInstance.basicInfoBottomSheet(context);
        break;
      case BottomSheetType.document:
        documentInstance.documentBottomSheet(context);
        break;
      case BottomSheetType.castInfo:
        castInstance.castBottomSheet(context);
        break;
      case BottomSheetType.familyInfo:
        myInstance.familyInfoBottomSheet(context);
        break;
      default:
        break;
    }
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
              // context.read<ProfileCubit>().updateUserProfile(
              //       state.userData?.data?.n ?? "",
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
              text: "बंद करा",
              color: AppColors.blackColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
