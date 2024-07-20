import 'package:easypanchayat/constants/app_colors.dart';
import 'package:easypanchayat/constants/app_strings.dart';
import 'package:easypanchayat/presentations/phone_screen/phone_screen.dart';
import 'package:easypanchayat/widgets/sizedbox_widget.dart';
import 'package:easypanchayat/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../utils/routes/routes.dart';
import '../../widgets/footer_widget.dart';
import '../../widgets/search_bar_widget.dart';

class SearchVillageScreen extends StatefulWidget {
  const SearchVillageScreen({
    super.key,
  });

  @override
  State<SearchVillageScreen> createState() => _SearchVillageScreenState();
}

class _SearchVillageScreenState extends State<SearchVillageScreen> {
  Future<void> navigateScreen() async {
    String token = GetStorage().read("token");
    if (token?.isNotEmpty ?? false) {
      context.push(Routes.homeScreen);
    } else {
      context.pushReplacement(Routes.searchVillageScreen);
    }
  }

  bool _isSearchBarVisible = false;
  @override
  void initState() {
    navigateScreen();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _isSearchBarVisible = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundDark,
        body: Stack(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _companyText(),
            SizedBoxWidget(
              height: 60.h,
            ),
            _imageWidget(context),
            SizedBoxWidget(
              height: 30.h,
            ),
            _isSearchBarVisible
                ? _searchBarWidget(context)
                : _animatedDotWidget(context),
          ]),
          _verticalTextWidget(),
        ]),
        bottomNavigationBar: const FooterWidget(
          isBackgroundColor: false,
        ),
      ),
    );
  }

  _searchBarWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28),
      child: Row(
        children: [
          SearchTextFieldWidget(
            hintText: "पारेगांव खुर्द",
            onSubmitted: (String) {
              context.pushReplacement(Routes.phoneScreen);
            },
          ),
          SizedBox(
            width: 15.w,
          ),
          InkWell(
            onTap: () {
              print("arrow click");
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const PhoneScreen())));
            },
            child: SizedBox(
              height: 50.h,
              width: 30.w,
              child: Image.asset(
                'assets/image/arrow_icon.png',
                fit: BoxFit.cover,
                color: AppColors.borderColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  _animatedDotWidget(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 28),
        child: Lottie.asset(
          'assets/animation/data.json',
          width: 200.w,
          height: 200.h,
        )
        // SearchTextFieldWidget(
        //   hintText: "पारेगांव खुर्द",
        // ),
        );
  }

  _companyText() {
    return Padding(
      padding: const EdgeInsets.all(28),
      child: TextWidget(
        text: AppStrings.companyName,
        fontSize: 16.sp,
        color: AppColors.textGrey,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _imageWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => const PhoneScreen())));
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 285.h,
        child: Image.asset(
          'assets/image/main_image.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _verticalTextWidget() {
    return Positioned(
      // bottom: 250.h,
      left: 294.w,
      right: 36.w,
      top: 330.h,
      child: RotatedBox(
        quarterTurns: 1,
        child: TextWidget(
          text: "MAKE IT SIMPLE FOR EVERY CITIZEN",
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.greyDarkColor,
        ),
      ),
    );
  }
}
