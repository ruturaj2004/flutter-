import 'package:baap_trasport_app/app/start_trip/cubit/dropdown_cubit.dart';
import 'package:baap_trasport_app/constants/app-string.dart';
import 'package:baap_trasport_app/constants/app_colors.dart';
import 'package:baap_trasport_app/constants/app_enum.dart';
import 'package:baap_trasport_app/widgets/button_widget.dart';
import 'package:baap_trasport_app/widgets/container_widget.dart';
import 'package:baap_trasport_app/widgets/footer_widget.dart';
import 'package:baap_trasport_app/widgets/icon_widget.dart';
import 'package:baap_trasport_app/widgets/linear_gradient.dart';
import 'package:baap_trasport_app/widgets/profile_header.dart';
import 'package:baap_trasport_app/widgets/sizedBox_widget.dart';
import 'package:baap_trasport_app/widgets/text_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TripScreen extends StatefulWidget {
  const TripScreen({super.key});

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  final List<String> selectRoute = [
    "Sonewadi",
    "Paregaon",
    "Sukewadi",
    "Nannaj",
    "Talegaon",
    "Loni",
    "Shrirampur",
    "Rahata"
  ];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _selectedValue;
  bool _isDropdownSelected = false;
  final ValueNotifier<String?> selectedRoute = ValueNotifier<String?>(null);

  void onChanged(String? newValue) {
    selectedRoute.value = newValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LinearGradientWidget(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileHeaderWidget(),
              const Divider(),
              _selectRouteWidget(),
              const SizedBoxWidget(
                height: 15,
              ),
              _nextStopWidget(),
              _listviewBuilderWidget(),
              const Spacer(),
              _buttonWidget(),
              const FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _selectRouteWidget() {
    return Column(
      children: [
        CustomContainer(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
          height: 100.h,
          width: 370.w,
          color: AppColors.textGrey.withOpacity(0.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: AppString.selectRoute,
                color: AppColors.textGrey,
                fontSize: 15.sp,
              ),
              BlocBuilder<DropdownCubit, String?>(
                builder: (context, selectedValue) {
                  _selectedValue = selectedValue;
                  _isDropdownSelected = selectedValue != null;
                  return DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          Expanded(
                            child: TextWidget(
                              text: AppString.sonwadiText,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                      items: selectRoute
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: TextWidget(
                                  text: item,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (String? value) {
                        context.read<DropdownCubit>().selectItem(value);
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 45.h,
                        width: 275.w,
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Colors.black26,
                          ),
                          color: AppColors.textGrey,
                        ),
                        elevation: 2,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200.h,
                        width: 275.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        offset: const Offset(0, 2),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all<double>(6),
                          thumbVisibility:
                              MaterialStateProperty.all<bool>(true),
                        ),
                      ),
                      menuItemStyleData: MenuItemStyleData(
                        height: 40.h,
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                      ),
                    ),
                  );
                },
              ),

              //  DropDownWidget(
              //   list: selectRoute,
              //   selectedValue: value,
              //   onChanged: onChanged,
              // );
            ],
          ),
        ),
        const SizedBoxWidget(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TextWidget(
              text: AppString.onboardPeople,
              color: AppColors.whiteColor,
            ),
            ButtonWidget(
              onClick: () {},
              text: AppString.startTrip,
              textColor: AppColors.whiteColor,
              height: 33.h,
              backgroundColor: AppColors.textGrey.withOpacity(0.2),
              width: 100.w,
              borderRadius: 0.r,
              fontSize: 14.sp,
              iconName: AppIcons.forward.name,
              iconColor: AppColors.whiteColor,
              isSuffixIcon: true,
              iconWidth: 10.w,
            ),
          ],
        ),
      ],
    );
  }

  Widget _nextStopWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            TextWidget(
              text: AppString.nextStop,
              color: AppColors.textGrey,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              text: AppString.sonwadiText,
              color: AppColors.whiteColor,
              fontSize: 17.sp,
            ),
            TextWidget(
              text: AppString.kmaway,
              color: AppColors.textGrey,
              fontSize: 13.sp,
            ),
          ],
        ),
        const Divider()
      ],
    );
  }

  Widget _listviewBuilderWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(text: AppString.boarding, color: AppColors.textGrey),
        const SizedBoxWidget(height: 10),
        CustomContainer(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          height: 270.h,
          color: AppColors.backgroundLinear.withOpacity(0.3),
          width: 370.w,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return CustomContainer(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                color: AppColors.textGrey.withOpacity(0.4),
                height: 70.h,
                width: 350.w,
                margin: EdgeInsets.only(bottom: 10.h),
                child: Row(
                  children: [
                    SizedBoxWidget(
                      height: 55,
                      width: 40,
                      child: IconWidget(
                        data: AppIcons.profile.name,
                        height: 45.h,
                      ),
                    ),
                    const SizedBoxWidget(
                      width: 5,
                    ),
                    Expanded(
                        child: SizedBoxWidget(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 3.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: AppString.personName,
                              fontSize: 16.sp,
                              color: AppColors.whiteColor,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                  text: AppString.mobNumber,
                                  fontSize: 12.sp,
                                  color: AppColors.textGrey,
                                ),
                                IconWidget(
                                  data: AppIcons.check.name,
                                  height: 24.h,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                TextWidget(
                                  text: AppString.inText,
                                  fontSize: 11.sp,
                                  color: AppColors.textGrey,
                                ),
                                const SizedBoxWidget(width: 15),
                                TextWidget(
                                  text: AppString.outText,
                                  fontSize: 11.sp,
                                  color: AppColors.textGrey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget _buttonWidget() {
    return ButtonWidget(
      onClick: () {},
      text: AppString.endTrip,
      textColor: AppColors.whiteColor,
      height: 33.h,
      backgroundColor: AppColors.textGrey.withOpacity(0.2),
      width: 100.w,
      borderRadius: 0.r,
      fontSize: 14.sp,
      iconName: AppIcons.forward.name,
      iconColor: AppColors.whiteColor,
      isSuffixIcon: true,
      iconWidth: 10.w,
    );
  }
}
