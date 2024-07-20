import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';

import '../../logic/personal_info/personal_info_cubit.dart';
import '../../utils/app_utils/snackbar/snackbar.dart';
import '../../utils/routes/routes.dart';
import '../../widgets/footer_widget.dart';
import '../../widgets/sizedbox_widget.dart';
import '../../widgets/text_widget.dart';
import '../../widgets/textformfield_widget.dart';

class BasiInfoScreen extends StatefulWidget {
  const BasiInfoScreen({super.key, this.phoneNumber});
  final String? phoneNumber;

  @override
  State<BasiInfoScreen> createState() => _BasiInfoScreenState();
}

class _BasiInfoScreenState extends State<BasiInfoScreen> { 
  final TextEditingController first_name = TextEditingController(text: "");
  final TextEditingController middle_name = TextEditingController(text: "");
  final TextEditingController last_name = TextEditingController(text: "");
  final TextEditingController password = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocListener<PersonalInfoCubit, PersonalInfoState>(
      listener: (context, state) {
        if (state is PersonalInfoSuccess) {
          context.push(Routes.homeScreen);
        } else if (state is PersonalInfoError) {
          SnackBarWidget.showSnackbar(context, state.error);
        } else if (state is SignUpError) {
          SnackBarWidget.showSnackbar(context, state.error);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundDark,
        body: Padding(
          padding: const EdgeInsets.only(left: 38, top: 38, right: 40),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _companyText(),
            SizedBoxWidget(
              height: 120.h,
            ),
            _basicInfoWidget(),
            SizedBoxWidget(
              height: 150.h,
            ),
            _buttonWidget(),
          ]),
        ),
        bottomNavigationBar: const FooterWidget(
          isBackgroundColor: false,
        ),
      ),
    ));
  }

  _companyText() {
    return TextWidget(
      text: AppStrings.companyName,
      fontSize: 18.sp,
      color: AppColors.textGrey,
      fontWeight: FontWeight.bold,
    );
  }

  _basicInfoWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: TextWidget(
            text: AppStrings.yourName,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textGrey,
          ),
        ),
        const SizedBoxWidget(
          height: 5,
        ),
        TextformFieldWidget(
          fontSize: 40.h,
          isBorderColor: false,
          controller: first_name,
        ),
        const SizedBoxWidget(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: TextWidget(
            text: AppStrings.fatherName,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textGrey,
          ),
        ),
        const SizedBoxWidget(
          height: 5,
        ),
        TextformFieldWidget(
          fontSize: 40.h,
          isBorderColor: false,
          controller: middle_name,
        ),
        const SizedBoxWidget(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: TextWidget(
            text: AppStrings.surName,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textGrey,
          ),
        ),
        const SizedBoxWidget(
          height: 5,
        ),
        TextformFieldWidget(
          fontSize: 40.h,
          isBorderColor: false,
          controller: last_name,
        ),
      ],
    );
  }

  _buttonWidget() {
    return SizedBox(
      height: 52.h,
      width: 159.w,
      child: TextButton(
          onPressed: () async {          
            context.read<PersonalInfoCubit>().signUp(
                  first_name: first_name.text.trim(),
                  number: widget.phoneNumber,
                  password: password.text.trim(),
                  middle_name: middle_name.text.trim(),
                  last_name: last_name.text.trim(),
                );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                AppColors.buttonColor), 
          ),
          child: context.watch<PersonalInfoCubit>().state is PersonalInfoLoading
              ? const CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.backgroundDark),
                )
              : Padding(
                  padding: const EdgeInsets.all(2),
                  child: Row(
                    children: [
                      TextWidget(
                        text: "सुरवात करा",
                        color: AppColors.backgroundDark,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBoxWidget(
                        width: 20,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColors.backgroundDark,
                        size: 20.sp,
                      )
                    ],
                  ),
                )),
    );
  }
}
