import 'package:baapapp/constants/app_colors.dart';
import 'package:baapapp/logic/address/address_cubit.dart';
import 'package:baapapp/logic/common/dropdown_widget2.dart';
import 'package:baapapp/logic/common/dropdown_widget_cubit.dart';
import 'package:baapapp/logic/common/slider_cubit.dart';
import 'package:baapapp/logic/image_upload/image_upload_cubit.dart';
import 'package:baapapp/logic/payment_service/check_vpa/check_vpa_cubit.dart';
import 'package:baapapp/logic/profile_screen/profile_cubit.dart';
import 'package:baapapp/utils/app_utils/app_utils.dart';
import 'package:baapapp/utils/app_utils/extensions.dart';
import 'package:baapapp/utils/app_utils/snackbar/snackbar.dart';
import 'package:baapapp/utils/preferences/local_preferences.dart';
import 'package:baapapp/utils/routes/routes.dart';
import 'package:baapapp/widgets/custom_button.dart';
import 'package:baapapp/widgets/event_textformfield_widget.dart';
import 'package:baapapp/widgets/open_confirmation_dialog.dart';
import 'package:baapapp/widgets/sizedbox_widget.dart';
import 'package:baapapp/widgets/text_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'package:skeletons/skeletons.dart';

import '../../logic/common/checkbox_widget.dart';
import '../../models/profile_response_model/customer_response_model.dart';
import '../../widgets/custom_circular_progress_indicator.dart';
import '../../widgets/dropdown_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final CarouselController _carousalController = CarouselController();
  final TextEditingController _name = TextEditingController(text: '');
  final TextEditingController _phoneNumber = TextEditingController(text: '');
  final TextEditingController _email = TextEditingController(text: '');
  final TextEditingController _location = TextEditingController(text: '');

  final TextEditingController _tag = TextEditingController(text: '');
  final TextEditingController _street = TextEditingController(text: '');
  final TextEditingController _locality = TextEditingController(text: '');
  final TextEditingController _city = TextEditingController(text: '');
  final TextEditingController _state = TextEditingController(text: '');
  final TextEditingController _zip = TextEditingController(text: '');

  final TextEditingController _amount = TextEditingController(text: '');
  final TextEditingController _startDate = TextEditingController(text: '');
  final TextEditingController _endDate = TextEditingController(text: '');
  final TextEditingController _selectedmembership =
      TextEditingController(text: '');

  final TextEditingController _upiController = TextEditingController(text: '');

  final _nameKey = GlobalKey<FormState>();
  final _tagKey = GlobalKey<FormState>();
  final _streetKey = GlobalKey<FormState>();
  final _localityKey = GlobalKey<FormState>();
  final _cityKey = GlobalKey<FormState>();
  final _stateKey = GlobalKey<FormState>();
  final _zipKey = GlobalKey<FormState>();

  final _tagAddKey = GlobalKey<FormState>();
  final _streetAddKey = GlobalKey<FormState>();
  final _localityAddKey = GlobalKey<FormState>();
  final _cityAddKey = GlobalKey<FormState>();
  final _stateAddKey = GlobalKey<FormState>();
  final _zipAddKey = GlobalKey<FormState>();

  final __amountKey = GlobalKey<FormState>();
  final _startDatekey = GlobalKey<FormState>();
  final _endDateKey = GlobalKey<FormState>();

  final _upiKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<ProfileCubit>().getCustomerData();
    super.initState();
  }

  @override
  void dispose() {
    _tag.dispose();
    _name.dispose();
    _phoneNumber.dispose();
    _email.dispose();
    _location.dispose();
    _street.dispose();
    _locality.dispose();
    _city.dispose();
    _state.dispose();
    _zip.dispose();
    _amount.dispose();
    _startDate.dispose();
    _endDate.dispose();
    _selectedmembership.dispose();

    _upiController.dispose();
    super.dispose();
  }

  List<String> taglList = ['घर', 'ऑफिस', 'मित्र', 'इतर'];
  List<String> membership = ["प्रीमियम", "गोल्डन"];

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is LogoutState) {
          context.pop();
          SnackBarWidget.showSnackbar(
              context, 'तुम्ही यशस्वीरित्या लॉगआउट केले आहे');
        }
        if (state is ProfileError) {
          context.pop();
          SnackBarWidget.showSnackbar(
            context,
            'काही तरी चुकल .',
            color: Colors.red,
          );
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.backgroundLight,
            elevation: 1,
            toolbarHeight: 65.h,
            leading: BackButton(
              onPressed: () {
                context.push(Routes.homePageScreen);
              },
            ),
            iconTheme: const IconThemeData(color: AppColors.textGrey),
            systemOverlayStyle: systemOverLayStyle,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 15.h),
                child: InkWell(
                  onTap: () {
                    openConfirmationDialog(
                      context: context,
                      title: 'लॉगआउट',
                      color: Colors.red,
                      message: 'तुमची खात्री आहे की लॉगआउट कराचे ?',
                      positiveButtonText: "हो",
                      negativeButtonText: "नाही",
                      onPositiveButtonClick: () {
                        context.read<ProfileCubit>().signOut(context);
                      },
                      onNegativeButtonClick: () {},
                    );
                  },
                  child: const Icon(
                    Icons.logout_outlined,
                    color: AppColors.textDarkGreyColor,
                  ),
                ),
              )
            ],
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: 'माहिती',
                  fontSize: 19.sp,
                  color: AppColors.textLightGreyColor,
                ),
                TextWidget(
                  text: 'अपडेट करा',
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDarkGreyColor,
                  fontSize: 15.sp,
                )
              ],
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  color: AppColors.backgroundLight,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(15.h),
                      child: _profileInfoWidget(context),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  color: AppColors.backgroundDark,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // _passContainerWidget(context),
                          _kilometerWidget(context),
                          SizedBox(height: 15.h),
                          _addUPIWidget(context),
                          SizedBox(height: 15.h),
                          _addressContainerWidget(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.only(
              left: 15,
              bottom: 15,
              right: 15,
            ),
            color: AppColors.backgroundDark,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Made in Paregaon LIVE with ",
                  color: Colors.grey,
                  fontSize: 13.sp,
                ),
                TextWidget(
                  text: "Pride",
                  color: const Color(0XFFE676A4),
                  fontSize: 12.sp,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _profileInfoWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 100.h,
                        width: 110.w,
                        child: const SkeletonTheme(
                          shimmerGradient: LinearGradient(
                            colors: [
                              AppColors.editTextformFieldColor,
                              AppColors.backgroundLight,
                            ],
                          ),
                          child: SkeletonAvatar(
                            style: SkeletonAvatarStyle(),
                          ),
                        ),
                      ),
                      const SizedBoxWidget(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SkeletonTheme(
                            shimmerGradient: const LinearGradient(
                              colors: [
                                AppColors.editTextformFieldColor,
                                AppColors.backgroundLight,
                              ],
                            ),
                            child: SkeletonAvatar(
                              style: SkeletonAvatarStyle(
                                height: 25.h,
                                width: 150.w,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          SkeletonTheme(
                            shimmerGradient: const LinearGradient(
                              colors: [
                                AppColors.editTextformFieldColor,
                                AppColors.backgroundLight,
                              ],
                            ),
                            child: SkeletonAvatar(
                              style: SkeletonAvatarStyle(
                                height: 25.h,
                                width: 100.w,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          SkeletonTheme(
                            shimmerGradient: const LinearGradient(
                              colors: [
                                AppColors.editTextformFieldColor,
                                AppColors.backgroundLight,
                              ],
                            ),
                            child: SkeletonAvatar(
                              style: SkeletonAvatarStyle(
                                height: 25.h,
                                width: 140.w,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
              // } else if (state is ProfileUploadSuccess) {
              // context.read<ProfileCubit>().getCustomerData();
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 90.h,
                      width: 95.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              state.customerData?.imageUrl != ''
                                  ? state.customerData?.imageUrl ??
                                      "https://baap-app-images.s3.ap-south-1.amazonaws.com/av_blank.png"
                                  : "https://baap-app-images.s3.ap-south-1.amazonaws.com/av_blank.png",
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBoxWidget(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 170.w,
                          child: TextWidget(
                            text: state.customerData?.name != null
                                ? state.customerData?.name.toString()
                                : '---',
                            color: AppColors.textYellowColor,
                            fontSize: 25.sp,
                            textOverflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        TextWidget(
                          text: state.customerData?.phoneNumber != null
                              ? state.customerData?.phoneNumber.toString()
                              : '---',
                          color: AppColors.textLightGreyColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                          width: 170.w,
                          child: TextWidget(
                            text: state.customerData?.location != null
                                ? state.customerData?.location.toString()
                                : '',
                            color: AppColors.textLightGreyColor,
                            fontSize: 15.sp,
                            textOverflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    _showButtomModelSheet(context, state.customerData);
                  },
                  child: const Icon(
                    Icons.edit_outlined,
                    color: AppColors.textDarkGreyColor,
                  ),
                )
              ],
            );
          },
        ),
      ],
    );
  }

  // ignore: unused_element
  Widget _passContainerWidget(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return Container(
            height: 270.h,
            width: MediaQuery.of(context).size.width,
            color: AppColors.blackColor,
            child: const SkeletonTheme(
              shimmerGradient: LinearGradient(
                colors: [
                  AppColors.editTextformFieldColor,
                  AppColors.backgroundLight,
                ],
              ),
              child: SkeletonAvatar(
                style: SkeletonAvatarStyle(),
              ),
            ),
          );
        }
        if (state.customerData?.memberMembership?.isEmpty ?? false) {
          return SizedBox(
            height: 270.h,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     InkWell(
                  //         onTap: () {
                  //           showDialog(
                  //               context: context,
                  //               builder: (context) {
                  //                 return const AlertDialog(
                  //                   content: TextWidget(
                  //                     text: 'सदस्यत्व माहिती',
                  //                   ),
                  //                 );
                  //               });
                  //         },
                  //         child: Icon(
                  //           Icons.info_outline,
                  //           color: AppColors.textDarkGreyColor,
                  //           size: 32.h,
                  //         )),
                  //   ],
                  // ),
                  const Spacer(),
                  TextWidget(
                    text: 'तूम्ही सदस्यत्व घेतलेल नाही. ',
                    fontSize: 18.sp,
                    color: Colors.white,
                  ),
                  // const SizedBoxWidget(
                  //   height: 10,
                  // ),
                  // TextWidget(
                  //   text: 'सदस्यत्व घेण्यासाठी खालील बाटणवर क्लिक करा',
                  //   fontSize: 15.sp,
                  //   color: Colors.white,
                  // ),
                  // const SizedBoxWidget(
                  //   height: 30,
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //     _membershipContainer();
                  //   },
                  //   child: Container(
                  //     padding: EdgeInsets.all(10.h),
                  //     decoration: BoxDecoration(
                  //       color: Colors.green,
                  //       borderRadius: BorderRadius.all(
                  //         Radius.circular(40.r),
                  //       ),
                  //     ),
                  //     child: TextWidget(
                  //       text: ' सदस्यत्व घ्या ',
                  //       fontSize: 15.sp,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  const Spacer(),
                ],
              ),
            ),
          );
        }
        return Container(
          height: 270.h,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            color: AppColors.blackColor,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
            child: ListView.builder(
                itemCount: state.customerData?.memberMembership?.length ?? 0,
                itemBuilder: (context, index) {
                  var item = state.customerData?.memberMembership?[index];
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          imageUrl: item?.barcodeImageUrl ?? '',
                          height: 70.h,
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextWidget(
                          text: 'THE BAAP COMPANY',
                          color: AppColors.textDarkGreyColor,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        TextWidget(
                          text: 'BAAP EXPERIENCE CENTER',
                          color: AppColors.whiteColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        TextWidget(
                          text: 'MEMBERSHIP CARD',
                          color: AppColors.textYellowColor,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            TextWidget(
                              text: item?.membershipPremium?.toUpperCase(),
                              color: AppColors.textBlueColor,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            TextWidget(
                              text: ' Member : ',
                              color: AppColors.textBlueColor,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            TextWidget(
                              text: item?.membershipId.toString(),
                              color: AppColors.textBlueColor,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        const SizedBoxWidget(
                          height: 10,
                        ),
                        TextWidget(
                          text: '* Valid for Individual Members only',
                          color: AppColors.textDarkGreyColor,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                TextWidget(
                                  text: 'Start- ',
                                  fontSize: 13.sp,
                                  color: AppColors.textDarkGreyColor,
                                ),
                                TextWidget(
                                  text: item?.startDate,
                                  fontSize: 13.sp,
                                  color: AppColors.textDarkGreyColor,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                TextWidget(
                                  text: 'End- ',
                                  fontSize: 13.sp,
                                  color: AppColors.textDarkGreyColor,
                                ),
                                TextWidget(
                                  text: item?.endDate,
                                  fontSize: 13.sp,
                                  color: AppColors.textDarkGreyColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]);
                }),
          ),
        );
      },
    );
  }

  _kilometerWidget(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return Column(
            children: [
              SkeletonTheme(
                shimmerGradient: const LinearGradient(
                  colors: [
                    AppColors.editTextformFieldColor,
                    AppColors.backgroundLight,
                  ],
                ),
                child: SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    width: MediaQuery.of(context).size.width,
                    height: 30.h,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SkeletonTheme(
                shimmerGradient: const LinearGradient(
                  colors: [
                    AppColors.editTextformFieldColor,
                    AppColors.backgroundLight,
                  ],
                ),
                child: SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    width: MediaQuery.of(context).size.width,
                    height: 100.h,
                  ),
                ),
              ),
            ],
          );
        }
        if (state is ProfileUploadSuccess) {
          context.read<ProfileCubit>().getCustomerData();
          return const SizedBox();
        }
        var destinationValue =
            ((state.customerData?.destination ?? 20000) / 1000);
        context
            .read<SliderCubit>()
            .updateSlider(double.tryParse(destinationValue.toString()));
        return SizedBox(
          height: 150.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: 'शोधण्याची सीमा (km)',
                color: AppColors.textDarkGreyColor,
                fontSize: 17.sp,
              ),
              const Spacer(),
              BlocBuilder<SliderCubit, double?>(
                builder: (context, state) {
                  return Theme(
                    data: ThemeData(useMaterial3: true),
                    child: Slider(
                      value: state ?? 20,
                      max: 500,
                      min: 20,
                      divisions: 6,
                      label: state?.round().toString(),
                      onChanged: (value) {
                        LocalStorageUtils.setDistance(value);
                        context.read<SliderCubit>().updateSlider(value);
                      },
                    ),
                  );
                },
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BlocBuilder<SliderCubit, double?>(
                    builder: (context, profileState) {
                      return CustomOutlinedButton(
                        buttonHeight: 35.h,
                        borderradius: 32.r,
                        buttonWidth: 120.w,
                        textSize: 16.sp,
                        buttonText: 'अपडेट करा',
                        textColor: const Color(0XFFA8A8A8),
                        backgroundColor: const Color(0XFF4A4B57),
                        onPressed: () {
                          var destination = ((profileState ?? 20) * 1000);
                          context.read<ProfileCubit>().updateDistance(
                                context,
                                destination: destination,
                              );
                        },
                      );
                    },
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }

  Widget _addUPIWidget(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return Column(
            children: [
              SkeletonTheme(
                shimmerGradient: const LinearGradient(
                  colors: [
                    AppColors.editTextformFieldColor,
                    AppColors.backgroundLight,
                  ],
                ),
                child: SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    width: MediaQuery.of(context).size.width,
                    height: 30.h,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SkeletonTheme(
                shimmerGradient: const LinearGradient(
                  colors: [
                    AppColors.editTextformFieldColor,
                    AppColors.backgroundLight,
                  ],
                ),
                child: SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    width: MediaQuery.of(context).size.width,
                    height: 100.h,
                  ),
                ),
              ),
            ],
          );
        }
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: 'पेमेंट UPI जोडा',
                  color: AppColors.textDarkGreyColor,
                  fontSize: 17.sp,
                ),
                InkWell(
                  onTap: () {
                    _addUPIBottomModelSheet(context);
                  },
                  child: const Icon(
                    Icons.add,
                    color: AppColors.textDarkGreyColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            const Divider(
              height: 1,
              color: AppColors.textDarkGreyColor,
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 100.h,
              child: state.customerData?.accountDetails?.isNotEmpty ?? false
                  ? ListView.builder(
                      padding: const EdgeInsets.only(left: 5),
                      scrollDirection: Axis.vertical,
                      itemCount: state.customerData?.accountDetails?.length,
                      itemBuilder: (context, index) {
                        var item = state.customerData?.accountDetails?[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget(
                                text: item?.accountDetails?.upi?.upi,
                                color: Colors.white,
                                fontSize: 16.sp,
                              ),
                              IconButton(
                                  onPressed: () {
                                    openConfirmationDialog(
                                        context: context,
                                        title: 'काढून टाका',
                                        message:
                                            "तुम्हाला ही UPI ID काढून टाकायची आहे का.",
                                        color: Colors.red,
                                        positiveButtonText: 'होय',
                                        negativeButtonText: "नाही",
                                        onPositiveButtonClick: () {
                                          context
                                              .read<ProfileCubit>()
                                              .deleteUPIByUserId(context,
                                                  accountId: item?.accountId);
                                        },
                                        onNegativeButtonClick: () {});
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: AppColors.textGreyColor,
                                  )),
                            ],
                          ),
                        );
                      },
                    )
                  : Center(
                      child: TextWidget(
                        text: "UPI जोडलेले नाही.",
                        fontSize: 17.sp,
                        color: Colors.white,
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }

  Widget _addressContainerWidget(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return Column(
            children: [
              SkeletonTheme(
                shimmerGradient: const LinearGradient(
                  colors: [
                    AppColors.editTextformFieldColor,
                    AppColors.backgroundLight,
                  ],
                ),
                child: SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    width: MediaQuery.of(context).size.width,
                    height: 30.h,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SkeletonTheme(
                shimmerGradient: const LinearGradient(
                  colors: [
                    AppColors.editTextformFieldColor,
                    AppColors.backgroundLight,
                  ],
                ),
                child: SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    width: MediaQuery.of(context).size.width,
                    height: 100.h,
                  ),
                ),
              ),
            ],
          );
        }
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: 'बिलिंग चा पत्ता',
                  color: AppColors.textDarkGreyColor,
                  fontSize: 17.sp,
                ),
                InkWell(
                  onTap: () {
                    _addAddressButtomModelSheet(context);
                  },
                  child: const Icon(
                    Icons.add,
                    color: AppColors.textDarkGreyColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            const Divider(
              height: 1,
              color: AppColors.textDarkGreyColor,
            ),
            SizedBox(
              height: 10.h,
            ),
            state.customerData?.addresses?.isNotEmpty ?? false
                ? SizedBox(
                    height: 100.0.h,
                    width: double.infinity,
                    child: CarouselSlider.builder(
                      carouselController: _carousalController,
                      options: CarouselOptions(
                        autoPlay: false,
                        scrollPhysics: const NeverScrollableScrollPhysics(),
                        aspectRatio: 16 / 9,
                        height: 100.h,
                        viewportFraction: 1,
                      ),
                      itemCount: state.customerData?.addresses?.length ?? 0,
                      itemBuilder: (context, index, realIndex) {
                        var item = state.customerData?.addresses?[index];
                        return SizedBox(
                          height: 100.h,
                          width: MediaQuery.of(context).size.width,
                          child: SingleChildScrollView(
                            child: SizedBox(
                              height: 100.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          (state.customerData?.addresses
                                                          ?.length ??
                                                      0) >
                                                  1
                                              ? InkWell(
                                                  onTap: () {
                                                    _carousalController
                                                        .previousPage();
                                                  },
                                                  child: Icon(
                                                    Icons.chevron_left_rounded,
                                                    color: AppColors
                                                        .textDarkGreyColor,
                                                    size: 30.h,
                                                  ),
                                                )
                                              : SizedBox(width: 20.h),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          TextWidget(
                                            text: item?.address?.tag
                                                ?.capitalize(),
                                            color: AppColors.textDarkGreyColor,
                                            fontSize: 16.sp,
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          item?.address?.addressDefault ?? false
                                              ? TextWidget(
                                                  text: 'प्राथमिक पत्ता',
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.green,
                                                )
                                              : const SizedBox(),
                                          const SizedBoxWidget(width: 10),
                                          InkWell(
                                            onTap: () {
                                              openConfirmationDialog(
                                                context: context,
                                                title: 'काढून टाका',
                                                message:
                                                    'तूम्ही हा पत्ता काढून टाकू इच्छिता का ?',
                                                negativeButtonText: 'मागे जा',
                                                color: Colors.red,
                                                onNegativeButtonClick: () {},
                                                positiveButtonText:
                                                    'काढून टाका',
                                                onPositiveButtonClick: () {
                                                  context
                                                      .read<
                                                          DefaultAddressCubit>()
                                                      .getDefaultAddress();
                                                  context
                                                      .read<ProfileCubit>()
                                                      .deleteUserAddressById(
                                                        context,
                                                        addressId:
                                                            item?.addressId,
                                                        custId: state
                                                            .customerData
                                                            ?.custId,
                                                      );
                                                },
                                              );
                                            },
                                            child: const Icon(
                                              Icons.delete_forever,
                                              color:
                                                  AppColors.textDarkGreyColor,
                                            ),
                                          ),
                                          const SizedBoxWidget(width: 10),
                                          InkWell(
                                            onTap: () {
                                              _editAddressButtomModelSheet(
                                                  context, item);
                                            },
                                            child: const Icon(
                                              Icons.edit_outlined,
                                              color:
                                                  AppColors.textDarkGreyColor,
                                            ),
                                          ),
                                          const SizedBoxWidget(width: 5),
                                          (state.customerData?.addresses
                                                          ?.length ??
                                                      0) >
                                                  1
                                              ? InkWell(
                                                  onTap: () {
                                                    _carousalController
                                                        .nextPage();
                                                  },
                                                  child: Icon(
                                                    Icons.keyboard_arrow_right,
                                                    color: AppColors
                                                        .textDarkGreyColor,
                                                    size: 30.h,
                                                  ),
                                                )
                                              : const SizedBox()
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 30.w,
                                      right: 30.w,
                                      top: 5.h,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            TextWidget(
                                              text: item?.address?.street
                                                  ?.capitalize(),
                                              fontSize: 16.sp,
                                              color: AppColors.whiteColor,
                                            ),
                                            const SizedBoxWidget(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: TextWidget(
                                                text: item?.address?.locality
                                                    ?.capitalize(),
                                                fontSize: 16.sp,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                color: AppColors.whiteColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Row(
                                          children: [
                                            TextWidget(
                                              text: item?.address?.city
                                                  ?.capitalize(),
                                              color: AppColors.whiteColor,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            const SizedBoxWidget(
                                              width: 5,
                                            ),
                                            TextWidget(
                                              text: item?.address?.state
                                                  ?.capitalize(),
                                              color: AppColors.whiteColor,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            const SizedBoxWidget(
                                              width: 5,
                                            ),
                                            TextWidget(
                                              text: item?.address?.zip,
                                              color: AppColors.whiteColor,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : const SizedBox(),
          ],
        );
      },
    );
  }

  void _showImageButtomModelSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22.r),
            topRight: Radius.circular(22.r),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: 100.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.backgroundLight,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22.r),
                  topRight: Radius.circular(22.r),
                ),
              ),
              padding: EdgeInsets.only(
                left: 20.w,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      context
                          .read<ImageUploadCubit>()
                          .captureAndUploadImage(context);
                    },
                    child: TextWidget(
                      text: 'फोटो काढा',
                      fontSize: 18.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: DottedLine(dashColor: AppColors.textGreyColor)),
                  InkWell(
                    onTap: () {
                      context.read<ImageUploadCubit>().pickImage(context);
                    },
                    child: TextWidget(
                      text: 'फोटो अपलोड करा',
                      fontSize: 18.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showButtomModelSheet(
    BuildContext context,
    CustomerModel? customerModel,
  ) {
    _name.text = customerModel?.name ?? "";
    _phoneNumber.text = customerModel?.phoneNumber?.toString() ?? "";
    _email.text = customerModel?.email ?? "";
    _location.text = customerModel?.location ?? "";
    String imageUrl = customerModel?.imageUrl ?? "";

    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22.r),
            topRight: Radius.circular(22.r),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileUploadSuccess) {
                _name.clear();
                _location.clear();
                context.pop();
                context.read<ProfileCubit>().getCustomerData();
              }
              return Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                  height: 400.h,
                  decoration: BoxDecoration(
                    color: AppColors.backgroundDark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22.r),
                      topRight: Radius.circular(22.r),
                    ),
                  ),
                  padding: EdgeInsets.only(
                    left: 20.h,
                    right: 20.h,
                    top: 20.h,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          TextWidget(
                            text: 'प्रोफाईल संपादित करा',
                            fontSize: 19.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor,
                          ),
                          const SizedBoxWidget(
                            height: 10,
                          ),
                          BlocBuilder<ImageUploadCubit, ImageUploadState>(
                            builder: (context, state) {
                              if (state is ImageUploadLoading) {
                                return Container(
                                  height: 90.h,
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.backgroundLight,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: const Center(
                                    child: CustomCircularProgressIndidator(),
                                  ),
                                );
                              }
                              if (state is ImageUploadSuccess) {
                                imageUrl = state.url ?? "";
                                context.pop();
                                context.read<ImageUploadCubit>().changeState();
                              }
                              return InkWell(
                                onTap: () {
                                  _showImageButtomModelSheet(context);
                                },
                                child: Container(
                                  height: 90.h,
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.backgroundLight,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: imageUrl == ""
                                      ? Center(
                                          child: Icon(
                                            Icons.person_rounded,
                                            color: Colors.white,
                                            size: 50.h,
                                          ),
                                        )
                                      : CachedNetworkImage(
                                          imageUrl: imageUrl,
                                          height: 90.h,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              );
                            },
                          ),
                          const SizedBoxWidget(
                            height: 10,
                          ),
                          EventTextformFieldWidget(
                            hintText: "नाव",
                            fontSize: 18.sp,
                            controller: _name,
                            formFieldKey: _nameKey,
                            validator: (value) {
                              if ((value?.length ?? 0) < 2) {
                                return 'तूम्ही नाव टाकल नाही';
                              }
                              return null;
                            },
                            hintTextColor: Colors.white.withOpacity(0.3),
                            backgroundColor: AppColors.editTextformFieldColor
                                .withOpacity(0.5),
                          ),
                          const SizedBoxWidget(
                            height: 10,
                          ),
                          EventTextformFieldWidget(
                            hintText: "मोबाईल नंबर",
                            fontSize: 18.sp,
                            controller: _phoneNumber,
                            validator: (value) {
                              if ((value?.length ?? 0) < 1) {
                                return 'तूम्ही नंबर टाकल नाही.';
                              } else if ((value?.length ?? 0) < 9 &&
                                  (value?.length ?? 0) > 10) {
                                return 'तूम्ही चुकीचा नंबर टाकला आहे.';
                              }
                              return null;
                            },
                            hintTextColor: Colors.white.withOpacity(0.3),
                            inputFormater: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10)
                            ],
                            backgroundColor: AppColors.editTextformFieldColor
                                .withOpacity(0.5),
                          ),
                          const SizedBoxWidget(
                            height: 10,
                          ),
                          EventTextformFieldWidget(
                            hintText: "ठिकाण टाका",
                            fontSize: 18.sp,
                            controller: _location,
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "ठिकाण टाका.";
                                // } else if (value?.validateEmail() == false) {
                                //   return "ईमेल चुकला आहे ";
                              }
                              return null;
                            },
                            hintTextColor: Colors.white.withOpacity(0.3),
                            backgroundColor: AppColors.editTextformFieldColor
                                .withOpacity(0.5),
                          ),
                          const SizedBoxWidget(
                            height: 20,
                          ),
                          CustomOutlinedButton(
                            buttonHeight: 40.h,
                            borderradius: 32.r,
                            buttonWidth: 129.w,
                            textColor: const Color(0XFFA8A8A8),
                            buttonText: 'अपडेट करा',
                            backgroundColor: const Color(0XFF4A4B57),
                            inProgress: state is ProfileLoading,
                            onPressed: () {
                              if (_nameKey.currentState!.validate()) {
                                context.read<ProfileCubit>().updateUserInfo(
                                      context,
                                      name: _name.text,
                                      phoneNumber: _phoneNumber.text.trim(),
                                      location: _location.text.trim(),
                                      imageUrl: imageUrl,
                                    );
                              }
                            },
                          )
                        ]),
                  ),
                ),
              );
            },
          );
        });
  }

  void _addUPIBottomModelSheet(BuildContext context) {
    context.read<CheckVPACubit>().changeState();
    showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22.r),
          topRight: Radius.circular(22.r),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.blackColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22.r),
              topRight: Radius.circular(22.r),
            ),
          ),
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 20.h,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: BlocBuilder<CheckVPACubit, CheckVPAState>(
            builder: (context, state) {
              if (state is CheckVPAError) {
                Future.delayed(const Duration(seconds: 1), () {
                  context.read<CheckVPACubit>().changeState();
                });
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextWidget(
                        text: 'तुमचा पेमेंट UPI जोडा',
                        fontSize: 19.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                      const SizedBoxWidget(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: 'UPI Id चुकला आहे.',
                            fontSize: 17.sp,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
              if (state is CheckVPASuccess) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextWidget(
                        text: 'तुमचा पेमेंट UPI जोडा',
                        fontSize: 19.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                      const SizedBoxWidget(height: 20),
                      EventTextformFieldWidget(
                        hintText: "xyz123@bank",
                        fontSize: 17.sp,
                        controller: _upiController,
                        formFieldKey: _upiKey,
                        readOnly: true,
                        validator: (value) {
                          if (!(value?.validateUPI() ?? false)) {
                            return 'UPI ID चुकीचा आहे.';
                          }
                          if (value!.length > 1 && value != "") {
                            return null;
                          }
                          return "UPI ID टाकणे गरजेचे आहे.";
                        },
                        hintTextColor: Colors.white.withOpacity(0.3),
                        backgroundColor:
                            AppColors.editTextformFieldColor.withOpacity(0.5),
                      ),
                      const SizedBoxWidget(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BlocBuilder<ProfileCubit, ProfileState>(
                            builder: (context, profileState) {
                              return CustomOutlinedButton(
                                buttonHeight: 35.h,
                                borderradius: 32.r,
                                buttonWidth: 100.w,
                                textSize: 16.sp,
                                buttonText: 'Add',
                                textColor: Colors.white,
                                backgroundColor: Colors.green,
                                onPressed: () {
                                  context.read<ProfileCubit>().updateUPI(
                                        context,
                                        _upiController.text.trim(),
                                      );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextWidget(
                      text: 'तुमचा पेमेंट UPI जोडा',
                      fontSize: 19.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                    ),
                    const SizedBoxWidget(height: 20),
                    EventTextformFieldWidget(
                      hintText: "xyz123@bank",
                      fontSize: 17.sp,
                      controller: _upiController,
                      formFieldKey: _upiKey,
                      validator: (value) {
                        if (!(value?.validateUPI() ?? false)) {
                          return 'UPI ID चुकीचा आहे.';
                        }
                        if (value!.length > 1 && value != "") {
                          return null;
                        }
                        return "UPI ID टाकणे गरजेचे आहे.";
                      },
                      hintTextColor: Colors.white.withOpacity(0.3),
                      backgroundColor:
                          AppColors.editTextformFieldColor.withOpacity(0.5),
                    ),
                    const SizedBoxWidget(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            if (_upiKey.currentState?.validate() != null) {
                              context
                                  .read<CheckVPACubit>()
                                  .checkVpa(vpaId: _upiController.text.trim());
                            }
                          },
                          child: Container(
                            height: 35.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: state is CheckVPASuccess
                                    ? Colors.green
                                    : const Color(0XFF4A4B57),
                                borderRadius: BorderRadius.circular(32)),
                            child: state is CheckVPALoading
                                ? const Center(
                                    child:
                                        const CustomCircularProgressIndidator())
                                : (state is CheckVPASuccess
                                    ? Center(
                                        child: TextWidget(
                                            text: 'Verified',
                                            fontSize: 16.sp,
                                            color: const Color(0XFFA8A8A8)),
                                      )
                                    : Center(
                                        child: TextWidget(
                                            text: 'Verify',
                                            fontSize: 16.sp,
                                            color: const Color(0XFFA8A8A8)),
                                      )),
                          ),
                        ),
                        // CustomOutlinedButton(
                        //   buttonHeight: 35.h,
                        //   borderradius: 32.r,
                        //   buttonWidth: 100.w,
                        //   textSize: 16.sp,
                        //   buttonText:
                        //       state is CheckVPASuccess ? 'Verified' : 'Verify',
                        //   textColor: const Color(0XFFA8A8A8),
                        //   backgroundColor: state is CheckVPASuccess
                        //       ? Colors.green
                        //       : const Color(0XFF4A4B57),
                        //   onPressed: () {
                        //     if (_upiKey.currentState?.validate() != null) {
                        //       context
                        //           .read<CheckVPACubit>()
                        //           .checkVpa(vpaId: _upiController.text.trim());
                        //     }
                        //   },
                        // ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    ).whenComplete(() {
      _upiController.clear();
    });
  }

  void _addAddressButtomModelSheet(BuildContext context) {
    context.read<CheckboxCubit>().checkFalse();
    showModalBottomSheet<void>(
        isScrollControlled: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22.r),
            topRight: Radius.circular(22.r),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileUploadSuccess) {
                clearData(context);
                context.pop();
                context.read<ProfileCubit>().getCustomerData();
                context.read<DefaultAddressCubit>().getDefaultAddress();
              }
              return Padding(
                padding: const EdgeInsets.only(
                    // bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                child: Container(
                  height: 400.h,
                  decoration: BoxDecoration(
                    color: AppColors.blackColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22.r),
                      topRight: Radius.circular(22.r),
                    ),
                  ),
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    top: 20.h,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          TextWidget(
                            text: 'पत्ता जोडा',
                            fontSize: 19.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor,
                          ),
                          const SizedBoxWidget(
                            height: 10,
                          ),
                          BlocBuilder<DropdownButtonCubit, String?>(
                            builder: (context, state) {
                              _tag.text = state ?? 'घर';
                              return DropDownFormWidget(
                                isRounded: false,
                                context: context,
                                list: taglList,
                                selectedValue: state ?? 'घर',
                                onChanged: (String? newValue) {
                                  context
                                      .read<DropdownButtonCubit>()
                                      .updateSelectedOption(newValue);
                                  _tag.text = newValue ?? 'घर';
                                },
                              );
                            },
                          ),
                          const SizedBoxWidget(
                            height: 10,
                          ),
                          EventTextformFieldWidget(
                            hintText: "घर नंबर / नाव ",
                            fontSize: 17.sp,
                            controller: _street,
                            formFieldKey: _streetAddKey,
                            hintTextColor: Colors.white.withOpacity(0.3),
                            backgroundColor: AppColors.editTextformFieldColor
                                .withOpacity(0.5),
                          ),
                          const SizedBoxWidget(
                            height: 10,
                          ),
                          EventTextformFieldWidget(
                            hintText: "गाव / शहर / परिसर",
                            fontSize: 17.sp,
                            controller: _locality,
                            formFieldKey: _localityAddKey,
                            validator: (value) {
                              if (value!.length > 1 && value != "") {
                                return null;
                              }
                              return "गावचे नाव टाकणे गरजेचे आहे.";
                            },
                            hintTextColor: Colors.white.withOpacity(0.3),
                            backgroundColor: AppColors.editTextformFieldColor
                                .withOpacity(0.5),
                          ),
                          const SizedBoxWidget(
                            height: 10,
                          ),
                          EventTextformFieldWidget(
                            hintText: "शहर",
                            controller: _city,
                            fontSize: 17.sp,
                            formFieldKey: _cityAddKey,
                            validator: (value) {
                              if (value!.length > 1 && value != "") {
                                return null;
                              }
                              return "शहराचे नाव टाकणे गरजेचे आहे.";
                            },
                            hintTextColor: Colors.white.withOpacity(0.3),
                            backgroundColor: AppColors.editTextformFieldColor
                                .withOpacity(0.5),
                          ),
                          const SizedBoxWidget(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              EventTextformFieldWidget(
                                width: 155.w,
                                hintText: "राज्य",
                                controller: _state,
                                fontSize: 17.sp,
                                formFieldKey: _stateAddKey,
                                validator: (value) {
                                  if (value!.length > 1 && value != "") {
                                    return null;
                                  }
                                  return "राज्याचे नाव टाकणे गरजेचे आहे.";
                                },
                                hintTextColor: Colors.white.withOpacity(0.3),
                                backgroundColor: AppColors
                                    .editTextformFieldColor
                                    .withOpacity(0.5),
                              ),
                              EventTextformFieldWidget(
                                width: 145.w,
                                hintText: "पिन नंबर",
                                controller: _zip,
                                fontSize: 17.sp,
                                textInputType: TextInputType.number,
                                formFieldKey: _zipAddKey,
                                validator: (value) {
                                  if (value!.length > 5 && value != "") {
                                    return null;
                                  }
                                  return "पिन क्रमांक टाकणे गरजेचे आहे.";
                                },
                                hintTextColor: Colors.white.withOpacity(0.3),
                                inputFormater: [
                                  LengthLimitingTextInputFormatter(6),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                backgroundColor: AppColors
                                    .editTextformFieldColor
                                    .withOpacity(0.5),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              TextWidget(
                                text: 'प्राथमिक पत्ता',
                                color: Colors.white,
                                fontSize: 17.sp,
                              ),
                              BlocBuilder<CheckboxCubit, bool>(
                                builder: (context, state) {
                                  return Checkbox(
                                    value: state,
                                    side: const BorderSide(
                                      width: 1,
                                      color: Colors.white,
                                    ),
                                    activeColor: Colors.green,
                                    onChanged: (bool? newValue) {
                                      context
                                          .read<CheckboxCubit>()
                                          .toggleCheckbox();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBoxWidget(
                            height: 10,
                          ),
                          BlocBuilder<CheckboxCubit, bool>(
                            builder: (context, check) {
                              return CustomOutlinedButton(
                                buttonText: 'जोडा',
                                inProgress: state is ProfileLoading,
                                borderradius: 32,
                                backgroundColor: AppColors.backgroundLight,
                                textColor: AppColors.textGreyColor,
                                onPressed: () {
                                  if ((_cityAddKey.currentState?.validate() !=
                                          null) &&
                                      (_localityAddKey.currentState
                                              ?.validate() !=
                                          null) &&
                                      (_stateAddKey.currentState?.validate() !=
                                          null) &&
                                      (_zipAddKey.currentState?.validate() !=
                                          null)) {
                                    context.read<ProfileCubit>().addUserAddress(
                                          context,
                                          street: _street.text,
                                          locality: _locality.text,
                                          city: _city.text,
                                          state: _state.text,
                                          zipCode: _zip.text,
                                          tag: _tag.text,
                                          defaultAddress: check,
                                        );
                                  }
                                },
                              );
                            },
                          ),
                        ]),
                  ),
                ),
              );
            },
          );
        }).whenComplete(() => clearData(context));
  }

  void _editAddressButtomModelSheet(
      BuildContext context, AddressElement? address) {
    _tag.text = address?.address?.tag ?? "";
    context.read<DropdownButtonCubit>().updateSelected(address?.address?.tag);
    _street.text = address?.address?.street ?? "";
    _locality.text = address?.address?.locality ?? "";
    _city.text = address?.address?.city ?? "";
    _state.text = address?.address?.state ?? "";
    _zip.text = address?.address?.zip ?? "";
    if (address?.address?.addressDefault ?? false) {
      context.read<CheckboxCubit>().checkTrue();
    } else {
      context.read<CheckboxCubit>().checkFalse();
    }
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22.r),
            topRight: Radius.circular(22.r),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileUploadSuccess) {
                clearData(context);
                context.pop();
                context.read<ProfileCubit>().getCustomerData();
                context.read<DefaultAddressCubit>().getDefaultAddress();
              }
              return Padding(
                padding: const EdgeInsets.only(
                    // bottom: MediaQuery.of(context).viewInsets.bottom
                    ),
                child: Container(
                  height: 430.h,
                  decoration: BoxDecoration(
                    color: AppColors.blackColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22.r),
                      topRight: Radius.circular(22.r),
                    ),
                  ),
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    top: 20.h,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          TextWidget(
                            text: 'पत्ता एडिट करा',
                            fontSize: 19.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor,
                          ),
                          const SizedBoxWidget(
                            height: 10,
                          ),
                          BlocBuilder<DropdownButtonCubit, String?>(
                            builder: (context, state) {
                              context
                                  .read<DropdownButtonCubit>()
                                  .updateSelectedOption(_tag.text);
                              return DropDownFormWidget(
                                isRounded: false,
                                context: context,
                                list: taglList,
                                selectedValue: state ?? _tag.text,
                                onChanged: (String? newValue) {
                                  context
                                      .read<DropdownButtonCubit>()
                                      .updateSelectedOption(newValue);
                                  _tag.text = newValue ?? 'घर';
                                },
                              );
                            },
                          ),
                          const SizedBoxWidget(
                            height: 10,
                          ),
                          EventTextformFieldWidget(
                            hintText: "घर नंबर / नाव",
                            fontSize: 17.sp,
                            controller: _street,
                            formFieldKey: _streetKey,
                            hintTextColor: Colors.white.withOpacity(0.3),
                            backgroundColor: AppColors.editTextformFieldColor
                                .withOpacity(0.5),
                          ),
                          const SizedBoxWidget(
                            height: 10,
                          ),
                          EventTextformFieldWidget(
                            hintText: "गाव / शहर / परिसर",
                            fontSize: 17.sp,
                            controller: _locality,
                            formFieldKey: _localityKey,
                            validator: (value) {
                              if (value!.length > 1 && value != "") {
                                return null;
                              }
                              return "गावचे नाव टाकणे गरजेचे आहे.";
                            },
                            hintTextColor: Colors.white.withOpacity(0.3),
                            backgroundColor: AppColors.editTextformFieldColor
                                .withOpacity(0.5),
                          ),
                          const SizedBoxWidget(
                            height: 10,
                          ),
                          EventTextformFieldWidget(
                            hintText: "शहर",
                            controller: _city,
                            fontSize: 17.sp,
                            formFieldKey: _cityKey,
                            validator: (value) {
                              if (value!.length > 1 && value != "") {
                                return null;
                              }
                              return "शहराचे नाव टाकणे गरजेचे आहे.";
                            },
                            hintTextColor: Colors.white.withOpacity(0.3),
                            backgroundColor: AppColors.editTextformFieldColor
                                .withOpacity(0.5),
                          ),
                          const SizedBoxWidget(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              EventTextformFieldWidget(
                                width: 155.w,
                                hintText: "राज्य",
                                controller: _state,
                                validator: (value) {
                                  if (value!.length > 1 && value != "") {
                                    return null;
                                  }
                                  return "राज्याचे नाव टाकणे गरजेचे आहे.";
                                },
                                formFieldKey: _stateKey,
                                fontSize: 17.sp,
                                hintTextColor: Colors.white.withOpacity(0.3),
                                backgroundColor: AppColors
                                    .editTextformFieldColor
                                    .withOpacity(0.5),
                              ),
                              EventTextformFieldWidget(
                                width: 145.w,
                                hintText: "पिन क्रमांक",
                                controller: _zip,
                                formFieldKey: _zipKey,
                                validator: (value) {
                                  if (value!.length > 5 && value != "") {
                                    return null;
                                  }
                                  return "पिन क्रमांक टाकणे गरजेचे आहे.";
                                },
                                fontSize: 17.sp,
                                hintTextColor: Colors.white.withOpacity(0.3),
                                textInputType: TextInputType.number,
                                inputFormater: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(6)
                                ],
                                backgroundColor: AppColors
                                    .editTextformFieldColor
                                    .withOpacity(0.5),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              TextWidget(
                                text: 'प्राथमिक पत्ता',
                                color: Colors.white,
                                fontSize: 17.sp,
                              ),
                              BlocBuilder<CheckboxCubit, bool>(
                                builder: (context, state) {
                                  return Checkbox(
                                    value: state,
                                    side: const BorderSide(
                                      width: 1,
                                      color: Colors.white,
                                    ),
                                    activeColor: Colors.green,
                                    onChanged: (bool? newValue) {
                                      context
                                          .read<CheckboxCubit>()
                                          .toggleCheckbox();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBoxWidget(
                            height: 10,
                          ),
                          BlocBuilder<CheckboxCubit, bool>(
                            builder: (context, check) {
                              return CustomOutlinedButton(
                                buttonText: 'अपडेट करा',
                                inProgress: state is ProfileLoading,
                                onPressed: () {
                                  if ((_cityKey.currentState!.validate()) &&
                                      (_localityKey.currentState!.validate()) &&
                                      (_stateKey.currentState!.validate()) &&
                                      (_zipKey.currentState!.validate())) {
                                    context
                                        .read<ProfileCubit>()
                                        .updateUserAddressById(
                                          context,
                                          addressId: address?.addressId,
                                          street: _street.text,
                                          locality: _locality.text,
                                          city: _city.text,
                                          state: _state.text,
                                          zipCode: _zip.text,
                                          tag: _tag.text,
                                          defaultAddress: check,
                                        );
                                  }
                                },
                              );
                            },
                          )
                        ]),
                  ),
                ),
              );
            },
          );
        }).whenComplete(() => clearData(context));
  }

  void clearData(BuildContext context) {
    _street.clear();
    _locality.clear();
    _city.clear();
    _state.clear();
    _zip.clear();
    _tag.clear();
    context.read<DropdownButtonCubit>().updateSelectedOption('घर');
  }

  void clearValidation() {
    _tagKey.currentState?.reset();
    _streetKey.currentState?.reset();
    _localityKey.currentState?.reset();
    _cityKey.currentState?.reset();
    _stateKey.currentState?.reset();
    _zipKey.currentState?.reset();
    _tagAddKey.currentState?.reset();
    _streetAddKey.currentState?.reset();
    _localityAddKey.currentState?.reset();
    _cityAddKey.currentState?.reset();
    _stateAddKey.currentState?.reset();
    _zipAddKey.currentState?.reset();
  }

  // ignore: unused_element
  _membershipContainer() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22.r),
          topRight: Radius.circular(22.r),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        bool showPaymentOption = false;
        return Padding(
          padding: const EdgeInsets.only(),
          child: Container(
            height: 340.h,
            decoration: BoxDecoration(
              color: AppColors.blackColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22.r),
                topRight: Radius.circular(22.r),
              ),
            ),
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              top: 20.h,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextWidget(
                      text: 'सदस्यत्व घ्या ',
                      fontSize: 19.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                    ),
                    const SizedBoxWidget(
                      height: 10,
                    ),
                    BlocBuilder<DropdownButtonCubit2, String?>(
                      builder: (context, state) {
                        context
                            .read<DropdownButtonCubit2>()
                            .updateSelectedOption2(_selectedmembership.text);
                        return DropDownFormWidget(
                          isRounded: false,
                          context: context,
                          list: membership,
                          selectedValue: state ?? _selectedmembership.text,
                          onChanged: (String? newValue) {
                            context
                                .read<DropdownButtonCubit2>()
                                .updateSelectedOption2(newValue);
                            _selectedmembership.text = newValue ?? 'प्रीमियम';
                          },
                        );
                      },
                    ),
                    const SizedBoxWidget(
                      height: 10,
                    ),
                    EventTextformFieldWidget(
                      hintText: "Amount",
                      fontSize: 17.sp,
                      controller: _amount,
                      formFieldKey: __amountKey,
                      hintTextColor: Colors.white.withOpacity(0.3),
                      backgroundColor:
                          AppColors.editTextformFieldColor.withOpacity(0.5),
                    ),
                    const SizedBoxWidget(
                      height: 10,
                    ),
                    EventTextformFieldWidget(
                      hintText: "start date",
                      isSuffixIconShow: true,
                      suffixIcon: Icons.calendar_today,
                      suffixIconClick: () {
                        _datePick(_startDate);
                      },
                      fontColor: AppColors.textGreyColor,
                      fontSize: 17.sp,
                      controller: _startDate,
                      formFieldKey: _startDatekey,
                      validator: (value) {
                        if (value!.length > 1 && value != "") {
                          return null;
                        }
                        return "कृपया प्रारंभ तारीख निवडा";
                      },
                      hintTextColor: Colors.white.withOpacity(0.3),
                      backgroundColor:
                          AppColors.editTextformFieldColor.withOpacity(0.5),
                    ),
                    const SizedBoxWidget(
                      height: 10,
                    ),
                    EventTextformFieldWidget(
                      hintText: "End date",
                      controller: _endDate,
                      fontSize: 17.sp,
                      formFieldKey: _endDateKey,
                      isSuffixIconShow: true,
                      suffixIcon: Icons.calendar_today,
                      suffixIconClick: () {
                        _datePick(_endDate);
                      },
                      fontColor: AppColors.textGreyColor,
                      validator: (value) {
                        if (value!.length > 1 && value != "") {
                          return null;
                        }
                        return "कृपया समाप्ती तारीख निवडा";
                      },
                      hintTextColor: Colors.white.withOpacity(0.3),
                      backgroundColor:
                          AppColors.editTextformFieldColor.withOpacity(0.5),
                    ),
                    const SizedBoxWidget(
                      height: 10,
                    ),
                    CustomOutlinedButton(
                        backgroundColor: AppColors.backgroundLight,
                        textColor: AppColors.textGreyColor,
                        buttonText: 'Pay Online',
                        borderradius: 18.r,
                        onPressed: () {
                          if ((__amountKey.currentState!.validate()) &&
                              (_startDatekey.currentState!.validate()) &&
                              (_endDateKey.currentState!.validate())) {
                            setState(() {
                              showPaymentOption = !showPaymentOption;
                            });
                          }
                        }),
                    const SizedBoxWidget(
                      height: 10,
                    ),
                  ]),
            ),
          ),
        );
      },
    );
  }

  _datePick(TextEditingController controller) async {
    DateTime currentDate = DateTime.now();

    DateTime? selectedDate = await showDatePicker(
      context: context,
      firstDate: currentDate,
      lastDate: DateTime(2030),
      initialDate: currentDate,
    );

    if (selectedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
      controller.text = formattedDate;
    }
  }
}
