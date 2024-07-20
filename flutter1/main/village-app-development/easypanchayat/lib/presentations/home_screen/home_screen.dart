import 'package:easy_localization/easy_localization.dart';
import 'package:easypanchayat/presentations/profile_screen/profile_screen.dart';
import 'package:easypanchayat/presentations/property_list/property_list.dart';
import 'package:easypanchayat/widgets/skeleton/home_skeleton_widget.dart';
import 'package:easypanchayat/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import '../../constants/app_colors.dart';
import '../../constants/enum.dart';
import '../../logic/localization_checker.dart';
import '../../logic/profile/profile_cubit.dart';
import '../../widgets/custom_container_widget.dart';
import '../../widgets/footer_widget.dart';
import '../../widgets/middle_widget.dart';
import '../../widgets/notice_board_widget.dart';
import '../../widgets/sizedbox_widget.dart';
import '../certificate_screem/certificate_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SampleItem? selectedMenu;
  Future<void> _delayedContent() async {
    await Future.delayed(const Duration(seconds: 5));
  }

  late String? name;
  final box = GetStorage();

  @override
  void initState() {
    context.read<ProfileCubit>().getUserData();
    name = box.read("name");
    super.initState();
  }

  bool isImageVisible = true;
  List<String> list = ['दाखला', 'मालमत्ता कर', 'घरपट्टी'];
  String selected = 'दाखला';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Scaffold(
              backgroundColor: AppColors.whiteColor,
              body: FutureBuilder<void>(
                future: _delayedContent(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CustomHomeSkeletonWidget();
                  } else {
                    return Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _titleBarWidget(),
                            const SizedBoxWidget(
                              height: 430,
                            ),
                            _containerWidget(),
                          ],
                        ),
                        _imageWidget(),
                      ],
                    );
                  }
                },
              ),
              bottomNavigationBar: const FooterWidget(
                isBackgroundColor: true,
              ),
            )));
  }

  _titleBarWidget() {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      if (state is ProfileLoading) {
        return const SizedBoxWidget();
      }
      return Padding(
          padding: const EdgeInsets.only(left: 27, top: 23, right: 25),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: 'welcome'.tr(),
                    fontSize: 18.sp,
                    color: AppColors.blackColor,
                  ),
                  const SizedBoxWidget(
                    height: 3,
                  ),
                  TextWidget(
                    text: state.userData?.data?.firstName ?? '',
                    fontSize: 38.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  )
                ],
              ),
              const Spacer(),
              PopupMenuButton<SampleItem>(
                  icon: const Icon(
                    Icons.language,
                    size: 25,
                  ),
                  initialValue: selectedMenu,
                  onSelected: (SampleItem item) {
                    setState(() {
                      selectedMenu = item;
                    });
                    LocalizationChecker.changeLanguage(context, item);
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<SampleItem>>[
                        const PopupMenuItem<SampleItem>(
                          value: SampleItem.marathi,
                          child: Text('Marathi'),
                        ),
                        const PopupMenuItem<SampleItem>(
                          value: SampleItem.hindi,
                          child: Text('Hindi'),
                        ),
                        const PopupMenuItem<SampleItem>(
                          value: SampleItem.english,
                          child: Text('English'),
                        ),
                      ]),
              const SizedBoxWidget(
                width: 10,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileScreen()));
                      // MaterialPageRoute(builder: (context) => MyWidget()));
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: AppColors
                          .profileBackgroundColor, // Adjust the radius as per your preference
                      backgroundImage: NetworkImage(
                        state.userData?.data?.signUrl.toString() ?? '',
                      ),
                    ),
                  ),
                ],
              )
            ],
          ));
    });
  }

  _imageWidget() {
    if (isImageVisible) {
      return const Padding(
        padding: EdgeInsets.only(top: 64),
        child: MiddleWidget(),
      );
    } else {
      return Positioned(
          top: 101,
          left: 20,
          right: 20,
          child: NoticeBoardWidget(
            onclose: () {
              setState(() {
                isImageVisible = true;
              });
            },
          ));
    }
  }

  _containerWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(children: [
        Row(
          children: [
            CustomContainerWidget(
              icon: 'assets/image/plan_icon.svg',
              text: "certificate".tr(),
              status: "apply".tr(),
              onClick: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => ExpandableListScreen())));
              },
            ),
            SizedBoxWidget(
              width: 15.w,
            ),
            CustomContainerWidget(
              icon: 'assets/image/paid_icon.svg',
              text: "property_tax".tr(),
              status: "apply".tr(),
              onClick: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PropertyListScreen(),
                    ));
              },
            ),
            SizedBoxWidget(
              width: 15.w,
            ),
            CustomContainerWidget(
              icon: 'assets/image/plan_icon.svg',
              text: "scheme".tr(),
              status: "apply".tr(),
              onClick: () {},
            ),
          ],
        ),
        SizedBoxWidget(
          height: 15.w,
        ),
        Row(
          children: [
            CustomContainerWidget(
              icon: 'assets/image/notice_board.svg',
              text: "notice_board".tr(),
              status: "apply".tr(),
              onClick: () {
                setState(() {
                  isImageVisible = !isImageVisible;
                });
              },
            ),
            SizedBoxWidget(
              width: 15.w,
            ),
            CustomContainerWidget(
              icon: 'assets/image/people_icon.svg',
              text: "meeting_info".tr(),
              status: "apply".tr(),
              onClick: () {},
            ),
            SizedBoxWidget(
              width: 15.w,
            ),
            CustomContainerWidget(
              icon: 'assets/image/info_icon.svg',
              text: "village_info".tr(),
              status: "apply".tr(),
              onClick: () {},
            ),
          ],
        ),
      ]),
    );
  }
}
