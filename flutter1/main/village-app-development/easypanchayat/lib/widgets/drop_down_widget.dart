import 'package:easy_localization/easy_localization.dart';
import 'package:easypanchayat/widgets/sizedbox_widget.dart';
import 'package:easypanchayat/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';
import '../logic/home/home_cubit.dart';
import '../logic/home/home_state.dart';
import '../presentations/certificate_screem/certificate_screen.dart';
import '../presentations/property_list/property_list.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String selected = 'दाखला';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is DropdownState) {
        selected = state.selectedItem; // Update the selected value
      }
      return Padding(
          padding: const EdgeInsets.only(left: 28, right: 80),
          child: Row(children: [
            Expanded(
              child: Container(
                width: 264.w,
                height: 63.h,
                padding: const EdgeInsets.only(left: 15, right: 10),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  border: Border.all(
                    width: 1.w,
                    color: AppColors.borderColor,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(32)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search),
                    SizedBoxWidget(
                      width: 15.w,
                    ),
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            value: selected,
                            onChanged: (value) {
                              context
                                  .read<HomeCubit>()
                                  .updateSelectedValue(value);
                            },
                            isExpanded: true,
                            isDense: true,
                            icon: Padding(
                              padding: EdgeInsets.only(
                                right: 2.w,
                              ),
                              child: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 32.sp,
                              ),
                            ),
                            items: [
                              DropdownMenuItem<String>(
                                value: 'दाखला',
                                child: TextWidget(
                                  text: 'certificate'
                                      .tr(), // Use the localization function
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              DropdownMenuItem<String>(
                                value: 'मालमत्ता कर',
                                child: TextWidget(
                                  text: 'property_tax'
                                      .tr(), // Use the localization function
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            ElevatedButton(
              onPressed: () {
                print("ontap Call");
                if (selected == 'property_tax'.tr()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PropertyListScreen()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ExpandableListScreen()),
                  );
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                elevation: MaterialStateProperty.all(0),
                side: MaterialStateProperty.all(
                    const BorderSide(color: Colors.white)),
              ),
              child: SizedBox(
                height: 50.h,
                child: Image.asset(
                  'assets/image/arrow_icon.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ]));
    });
  }
}
