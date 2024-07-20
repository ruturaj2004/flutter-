// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:baapapp/constants/app_colors.dart';
import 'package:baapapp/constants/app_enum.dart';
import 'package:baapapp/logic/menu_logic/menu_cubit.dart';
import 'package:baapapp/logic/service_action/service_action_cubit.dart';
import 'package:baapapp/logic/sub_category_list/sub_category_list_cubit.dart';
import 'package:baapapp/utils/app_utils/extensions.dart';
import 'package:baapapp/utils/preferences/local_preferences.dart';
import 'package:baapapp/utils/routes/routes.dart';
import 'package:baapapp/widgets/sizedbox_widget.dart';

import 'package:baapapp/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:lottie/lottie.dart';

import '../../constants/app_images.dart';
import '../../utils/app_utils/app_utils.dart';
import '../../widgets/sub_category_list_tile.dart';

class ListSubCategory extends StatefulWidget {
  const ListSubCategory({
    super.key,
    this.categoryName,
    this.subCategoryId,
  });

  final String? categoryName;
  final int? subCategoryId;

  @override
  State<ListSubCategory> createState() => _ListSubCategoryState();
}

class _ListSubCategoryState extends State<ListSubCategory> {
  @override
  void initState() {
    context
        .read<SubCategoryListCubit>()
        .getSubCategoryList(widget.subCategoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ServiceRequestCubit, ServiceRequestState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.backgroundDark,
            appBar: AppBar(
              systemOverlayStyle: systemOverLayStyle,
              surfaceTintColor: Colors.white10,
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              automaticallyImplyLeading: true,
              elevation: 0,
              backgroundColor: AppColors.backgroundDark,
              title: TextWidget(
                text: widget.categoryName.toString().capitalize(),
                color: AppColors.whiteColor,
                fontSize: 17.sp,
              ),
            ),
            body: Stack(children: [
              SizedBox(
                child: BlocBuilder<SubCategoryListCubit, SubCategoryListState>(
                  builder: (context, state) {
                    if (state is SubCategoryListLoading) {
                      return Center(
                        child: SizedBox(
                          height: 200.h,
                          width: 200.w,
                          child: Lottie.asset(AppImages.loadingWhiteAnimation),
                        ),
                      );
                    }
                    if (state is SubCategoryListError) {
                      return Center(
                          child: TextWidget(
                        text: 'Something was wrong . . .',
                        fontSize: 17.sp,
                        color: Colors.white,
                      ));
                    }
                    return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        crossAxisSpacing: 10.w,
                        childAspectRatio: 1.5,
                        mainAxisSpacing: 10.h,
                      ),
                      padding: EdgeInsets.only(left: 15.h, right: 15.h),
                      itemCount: state.subCategoryListModel?.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        var item = state.subCategoryListModel?[index];
                        return ListSubCategoryTile(
                          data: item,
                          onPressed: () async {
                            var user = await LocalStorageUtils.fetchToken();
                            if (user?.isEmpty ?? false) {
                              context.push(Routes.signupScreen);
                            } else {
                              var uId =
                                  LocalStorageUtils.tokenResponseModel.userId;
                              if (state.subCategoryListModel?[index].action ==
                                  ClickAction.whatsapp.name) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        insetPadding: EdgeInsets.zero,
                                        contentPadding: EdgeInsets.zero,
                                        backgroundColor:
                                            const Color(0XFFEFEFEF),
                                        elevation: 16,
                                        content: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w, vertical: 20.h),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextWidget(
                                                text:
                                                    'तुम्हाला खरंच ${state.subCategoryListModel?[index].name} हवं आहे?',
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0XFF5C3F3F),
                                              ),
                                              const SizedBoxWidget(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      context
                                                          .read<
                                                              ServiceActionCubit>()
                                                          .serviceAction(
                                                            subCategoryId: state
                                                                .subCategoryListModel?[
                                                                    index]
                                                                .subcategoryId,
                                                            userId: uId,
                                                            categoryId: state
                                                                .subCategoryListModel?[
                                                                    index]
                                                                .categoryId,
                                                          );
                                                      Navigator.pop(context);
                                                      FocusNode().unfocus();
                                                    },
                                                    child: Container(
                                                      width: 70.w,
                                                      height: 35.h,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: const Color(
                                                              0xFF707070),
                                                          width: 1.5,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.r),
                                                      ),
                                                      child: Center(
                                                        child: TextWidget(
                                                          text: 'होय',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 15.sp,
                                                          color: const Color(
                                                              0XFF5C3F3F),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBoxWidget(
                                                      width: 10),
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                      FocusNode().unfocus();
                                                    },
                                                    child: Container(
                                                      width: 70.w,
                                                      height: 35.h,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xFF707070),
                                                            width: 1.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.r),
                                                      ),
                                                      child: Center(
                                                        child: TextWidget(
                                                          text: 'नाही',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 15.sp,
                                                          color: const Color(
                                                              0XFF5C3F3F),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              }
                            }
                          },
                        );
                      },
                    );
                  },
                ),
              ),
              context.watch<ServiceActionCubit>().state is ServiceActionLoading
                  ? BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 3,
                        sigmaY: 3,
                      ),
                      child: Container(
                        color: Colors.white.withOpacity(0.5),
                        child: Center(
                          child: Lottie.asset(
                            AppImages.loadingAnimation,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
              context.watch<ServiceActionCubit>().state is ServiceActionLoaded
                  ? BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 3,
                        sigmaY: 3,
                      ),
                      child: Container(
                        color: Colors.white.withOpacity(0.5),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 80.h,
                                width: 80.h,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 40.h,
                                ),
                              ),
                              const SizedBoxWidget(
                                height: 10,
                              ),
                              TextWidget(
                                text: 'तुमची विनंती बाप टीमला पाठवली आहे.',
                                color: Colors.black,
                                fontSize: 17.sp,
                                textDecoration: TextDecoration.none,
                                fontWeight: FontWeight.w600,
                              ),
                              TextWidget(
                                text:
                                    'तुम्हाला टीम काढून लवकरच प्रतिसाद देण्यात येईल.',
                                color: Colors.black,
                                fontSize: 17.sp,
                                textDecoration: TextDecoration.none,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const SizedBox()
            ]),
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
          );
        },
      ),
    );
  }
}
