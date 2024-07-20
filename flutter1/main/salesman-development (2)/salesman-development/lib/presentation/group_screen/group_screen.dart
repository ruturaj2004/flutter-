import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:salesman_app/constant/app_color.dart';
import 'package:salesman_app/utils/routes/routes.dart';
import 'package:salesman_app/widget/custom_icon_widget.dart';
import 'package:salesman_app/widget/emp_header_widget.dart';
import 'package:salesman_app/widget/sized_box_widget.dart';
import 'package:salesman_app/widget/textFormFiled.dart';
import 'package:salesman_app/widget/text_widget.dart';
import '../../logic/get_group_logic/get_groups_cubit.dart';
import '../../logic/get_group_logic/get_groups_state.dart';
import '../../utils/preferences/local_preferences.dart';
import '../../widget/cricular_progress_indicator.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetGroupsCubit>().getGroups();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            const EmpHeaderWidget(),
            const SizedBoxWidget(height: 10),
            _searchGroupwidget(),
            const SizedBoxWidget(height: 10),
            _groupWidget(),
          ]),
        ),
      ),
    );
  }

  Widget _searchGroupwidget() {
    return CustomTextFormFieldWidget(
      hintText: "Search Group",
      prefixIcon: IconWidget(iconData: Icons.search),
    );
  }

  Widget _groupWidget() {
    return Expanded(child: BlocBuilder<GetGroupsCubit, GetGroupsState>(
      builder: (context, state) {
        if (state is GetGroupsLoading) {
          return const Center(child: CircularProgressIndicatorWidget());
        } else if (state is GetGroupsError) {
          return TextWidget(data: "error:- ${state.errorMessage}");
        } else if (state is GetGroupsLoaded) {
          if (state.getGroupsModel.data != null &&
              state.getGroupsModel.data!.isNotEmpty) {
            return SizedBoxWidget(
              height: 600.h,
              child: ListView.builder(
                itemCount: state.getGroupsModel.data?.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      List<int> groupIdList = [];
                      if (LocalStorageUtils.instance
                          .containsKey("groupIdList")) {
                        List<String>? storedList = LocalStorageUtils.instance
                            .getStringList("groupIdList");
                        if (storedList != null) {
                          groupIdList = storedList.map(int.parse).toList();
                        }
                      }
                      int groupId =
                          state.getGroupsModel?.data?[index].groupId?.groupId ??
                              0;
                      groupIdList.add(groupId);
                      List<String> stringGroupIdList = groupIdList
                          .map((groupId) => groupId.toString())
                          .toList();
                      LocalStorageUtils.instance
                          .setStringList("groupIdList", stringGroupIdList);
                      context.push(Routes.homeScreen);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      padding: const EdgeInsets.all(8),
                      height: 80.h,
                      color: AppColors.backgroundDark,
                      child: Row(
                        children: [
                          SizedBoxWidget(
                            height: 50.h,
                            width: 50.w,
                            child: Image.network(
                              state.getGroupsModel.data?[index].groupId?.logoUrl??"https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg",
                            ),
                          ),
                          SizedBoxWidget(
                            width: 10.w,
                          ),
                          Expanded(
                            child: SizedBoxWidget(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    data: state.getGroupsModel.data?[index]
                                            .groupId?.name ??
                                        "Not found",
                                    fontSize: 14.sp,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  TextWidget(
                                    data: state.getGroupsModel.data?[index]
                                            .groupId?.type ??
                                        "Not found",
                                    fontSize: 11.sp,
                                    color: AppColors.textGrey,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  TextWidget(
                                    data: state.getGroupsModel.data?[index]
                                            .groupId?.shortName ??
                                        "not found",
                                    color: AppColors.textGrey,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 10.sp,
                                    maxLines: 1,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBoxWidget(
                            height: 55.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconWidget(iconData: Icons.arrow_forward)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(
                child: TextWidget(
              data: "No data available",
            ));
          }
        }
        return const TextWidget(
          data: "Not Found",
        );
      },
    ));
  }
}
