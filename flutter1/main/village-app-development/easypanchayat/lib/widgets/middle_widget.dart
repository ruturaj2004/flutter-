import 'package:easy_localization/easy_localization.dart';
import 'package:easypanchayat/widgets/sizedbox_widget.dart';
import 'package:easypanchayat/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';
import 'drop_down_widget.dart';

class MiddleWidget extends StatefulWidget {
  const MiddleWidget({super.key});

  @override
  State<MiddleWidget> createState() => _MiddleWidgetState();
}

class _MiddleWidgetState extends State<MiddleWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          _imageWidget(),
          const SizedBoxWidget(
            height: 40,
          ),
          const DropDownWidget(),
        ],
      ),
      _middleText(),
      _verticalTextWidget()
    ]);
  }

  _middleText() {
    return Positioned(
      top: 250,
      child: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: TextWidget(
          text: 'what_you_want'.tr(),       
          color: AppColors.greyDarkColor,
          fontSize: 20.sp,
        ),
      ),
    );
  }

  _verticalTextWidget() {
    return Positioned(
      // bottom: 250.h,
      left: 294.w,
      right: 36.w,
      top: 210.h,
      child: RotatedBox(
        quarterTurns: 1,
        child: TextWidget(
          text: "MAKE IT SIMPLE FOR EVERY CITIZEN",
          fontSize: 13.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.greyDarkColor,
        ),
      ),
    );
  }

  _imageWidget() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 285.h,
      child: Image.asset(
        'assets/image/main_image.png',
        fit: BoxFit.cover,
      ),
    );
  }

  // _dropDownWidget() {
    // List<String> list = ['certificate'.tr(), 'property_tax'.tr()];
    
  //   return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
  //     if (state is DropdownState) {
  //       selected = state.selectedItem; // Update the selected value
  //     }
  //     return Padding(
  //         padding: const EdgeInsets.only(left: 28, right: 80),
  //         child: Row(children: [
  //           Expanded(
  //             child: 
  //             DropdownButton<String>(
  //                 value: selected,
  //                 onChanged: (value) {
  //                   context.read<HomeCubit>().updateSelectedValue(value);
  //                   // setState(() {
  //                   //   selected = newValue;
  //                   // });
  //                 },
  //                 items: [
  //                   DropdownMenuItem<String>(
  //                     value: 'दाखला',
  //                     child: Text(
  //                       'certificate'.tr(), // Use the localization function
  //                     ),
  //                   ),
  //                   DropdownMenuItem<String>(
  //                     value: 'मालमत्ता कर',
  //                     child: Text(
  //                         'property_tax'.tr() // Use the localization function
  //                         ),
  //                   )
  //                 ]),
  //             DropDownFormWidget(
  //                 context: context,
  //                 list: list,
  //                 onChanged: (value) {
  //                   context.read<HomeCubit>().updateSelectedValue(value);
  //                 },
  //                 selectedValue: selected),
  //           ),
  //           SizedBox(
  //             width: 5.w,
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               print("ontap Call");
  //               if (selected == 'property_tax'.tr()) {
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                       builder: (context) => const PropertyListScreen()),
  //                 );
  //               } else {
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                       builder: (context) => ExpandableListScreen()),
  //                 );
  //               }
  //             },
  //             style: ButtonStyle(
  //               backgroundColor: MaterialStateProperty.all(Colors.transparent),
  //               elevation: MaterialStateProperty.all(0),
  //               side: MaterialStateProperty.all(
  //                   const BorderSide(color: Colors.white)),
  //             ),
  //             child: SizedBox(
  //               height: 50.h,
  //               child: Image.asset(
  //                 'assets/image/arrow_icon.png',
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //           ),
  //         ]));
  //   });
  // }
}
