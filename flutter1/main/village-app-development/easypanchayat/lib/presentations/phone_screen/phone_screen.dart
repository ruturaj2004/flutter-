import 'package:easypanchayat/logic/send_otp/send_otp_cubit.dart';
import 'package:easypanchayat/utils/routes/routes.dart';
import 'package:easypanchayat/widgets/footer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../utils/app_utils/snackbar/snackbar.dart';
import '../../widgets/sizedbox_widget.dart';
import '../../widgets/text_widget.dart';
import '../../widgets/textformfield_widget.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final TextEditingController phoneNumber = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return BlocListener<SendOtpCubit, SendOtpState>(
      listener: (context, state) {
        if (state is SendOtpSuccess) {
          context.push(Routes.otpScreen,
              extra: {"phoneNumber": phoneNumber.text.trim()});
        } else if (state is SendOtpError) {
          SnackBarWidget.showSnackbar(context, state.errorMesage ?? "");
        }
      },
      child: BlocBuilder<SendOtpCubit, SendOtpState>(builder: (context, state) {
        return SafeArea(
          child: Scaffold(
              backgroundColor: AppColors.backgroundDark,
              body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _companyText(),
                    SizedBoxWidget(
                      height: 250.h,
                    ),
                    _phoneWidget(),
                    SizedBoxWidget(
                      height: 20.h,
                    ),
                  ]),
              bottomNavigationBar: const FooterWidget(
                isBackgroundColor: false,
              )),
        );
      }),
    );
  }

  _companyText() {
    return Padding(
      padding: const EdgeInsets.all(28),
      child: TextWidget(
        text: AppStrings.companyName,
        fontSize: 18.sp,
        color: AppColors.textGrey,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _phoneWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 28, right: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: TextWidget(
              text: AppStrings.phoneText,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textGrey,
            ),
          ),
          const SizedBoxWidget(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: TextformFieldWidget(
                  fontSize: 40.h,
                  hintTextColor: AppColors.lightGreyColor,
                  isBorderColor: false,
                  onChanged: (value) {
                    SendOtpSuccess();
                  },
                  controller: phoneNumber,
                  textInputType: TextInputType.number,
                  inputFormater: [LengthLimitingTextInputFormatter(10)],
                ),
              ),
              const SizedBoxWidget(width: 10),
              InkWell(
                onTap: () {
                  context.read<SendOtpCubit>().sendOtp(phoneNumber.text.trim());
                },
                child: context.watch<SendOtpCubit>().state is SendOtpLoading
                    ? const CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(AppColors.textGrey),
                      )
                    : Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.textGrey,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20.sp,
                            color: AppColors.backgroundDark,
                          ),
                        ),
                      ),
              )
            ],
          )
        ],
      ),
    );
  }
}
