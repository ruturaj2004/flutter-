import 'package:easy_localization/easy_localization.dart';
import 'package:easypanchayat/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/app_colors.dart';
import '../../logic/property_list/property_list_cubit.dart';
import '../../logic/property_list/property_list_state.dart';
import '../../widgets/footer_widget.dart';
import '../../widgets/property_list_widget.dart';
import '../../widgets/sizedbox_widget.dart';
import '../../widgets/skeleton/skeleton_loader_widget.dart';
import '../profile_screen/profile_screen.dart';

class PropertyListScreen extends StatefulWidget {
  const PropertyListScreen({super.key});

  @override
  State<PropertyListScreen> createState() => _PropertyListScreenState();
}

class _PropertyListScreenState extends State<PropertyListScreen> {
  @override
  void initState() {
    context.read<PropertyListCubit>().getPropertyListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PropertyListCubit, PropertyListState>(
        listener: (context, state) {
          if (state is PropertyListLoaded) {
            // context.pop(context);
          }
        },
        child: SafeArea(
          child: Scaffold(
              backgroundColor: const Color.fromRGBO(247, 247, 247, 1),
              body: Stack(children: [
                _imageWidget(),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 27, right: 27),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _titleBarWidget(),
                        const SizedBoxWidget(
                          height: 25,
                        ),
                        _containerWidget(),
                      ]),
                ),
              ]),
              bottomNavigationBar: const FooterWidget(
                isBackgroundColor: true,
              )),
        ));
  }

  _imageWidget() {
    return Positioned(
      bottom: 0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        // height: 285.h,
        child: Image.asset(
          'assets/image/property_img.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _titleBarWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/image/left_arrow.svg', // Replace with your SVG image path
                height: 17.h,
                width: 17.h,
                color: AppColors.blackColor,
              ),
              const SizedBoxWidget(
                width: 11,
              ),
              TextWidget(
                text: 'property_tax_info'.tr(),
                fontSize: 20.sp,
                color: AppColors.blackColor,
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()));
          },
          child: CircleAvatar(
            radius: 25,
            backgroundColor: AppColors
                .profileBackgroundColor, // Adjust the radius as per your preference
            child: SvgPicture.asset(
              'assets/image/person_icon.svg', // Replace with your SVG image path
              height: 20.h,
              width: 20.w,
              color: AppColors.iconColor,
            ),
          ),
        ),
      ],
    );
  }

  _containerWidget() {
    return BlocBuilder<PropertyListCubit, PropertyListState>(
        builder: (context, state) {
      if (state is PropertyListLoading) {
        return CustomSkeletonLoader(
          context: context,
          propertyList: true,
        );
      }
      if (state.items?.isEmpty ?? false) {
        return const Center(
          child: TextWidget(
            text: 'Data Not Found',
            fontSize: 15,
          ),
        );
      }
      return Expanded(
        child: ListView.builder(
            itemCount: state.items?.length ?? 0,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: PropertyListWidget(
                  item: state.items[index],
                ),
              );
            }),
      );
    });
  }
}
