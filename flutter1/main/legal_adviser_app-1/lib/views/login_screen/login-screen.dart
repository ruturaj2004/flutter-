import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_adviser/const/app_color.dart';
import 'package:legal_adviser/const/app_image.dart';
import 'package:legal_adviser/logic/image-silder/image_slider_cubit.dart';
import 'package:legal_adviser/utils/routes/routes.dart';
import 'package:legal_adviser/widgets/button_widget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late SliderCubit _sliderCubit;

  @override
  void initState() {
    super.initState();
    _sliderCubit = SliderCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 530.h,
            child: _sliderImageWidget(),
          ),
          _buildButtonWidget(),
        ],
      ),
    );
  }

  _sliderImageWidget() {
    return Column(
      children: [
        BlocBuilder<SliderCubit, int>(
          bloc: _sliderCubit,
          builder: (context, state) {
            return CarouselSlider(
              items: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.splashlogo),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.welcome),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.expert),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.advice),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 400.h,
                enlargeCenterPage: false,
                autoPlay: false,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  _sliderCubit.updateIndex(index);
                },
              ),
            );
          },
        ),
        SizedBox(height: 10.h),
        BlocBuilder<SliderCubit, int>(
          bloc: _sliderCubit,
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 4; i++)
                  Container(
                    width: 8.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                        color: state == i ? Colors.black : Colors.black26,
                        shape: BoxShape.circle),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }

  _buildButtonWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 120.w,
              child: TextButtonWidget(
                buttonText: 'Sign In',
                buttonTextColor:AppColors.black ,
                borderRadius: 10.r,
                backGroundColor:AppColors.whiteColor ,
                 border: BorderSide(width: 1,color: AppColors.black),
                onPressed: () {
                  context.push(Routes.signInScreen);
                },
              )),
          SizedBox(
            width: 120.w,
            child: TextButtonWidget(
              buttonText: 'Build a Case',
              backGroundColor: Colors.black,
              buttonTextColor: Colors.white,
              borderRadius: 10.r,
              onPressed: () {
                context.push(Routes.buildScreen);
              },
            ),
          ),
        ],
      ),
    );
  }
}
