import 'package:baapapp/constants/app_colors.dart';
import 'package:baapapp/logic/menu_logic/menu_cubit.dart';
import 'package:baapapp/utils/app_utils/extensions.dart';
import 'package:baapapp/widgets/sizedbox_widget.dart';
import 'package:baapapp/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/service_request_response_model/service_request_response_model.dart';

class MenuListTile extends StatelessWidget {
  const MenuListTile({super.key, this.menuModel, this.dateTime});

  final MenuModel? menuModel;
  final String? dateTime;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceRequestCubit, ServiceRequestState>(
        builder: (context, state) {
      var responseCount = menuModel?.serviceResponsesCount ?? 0;
      var serviceRequestId = menuModel?.servicerequestId ?? 0;

      return Slidable(
        endActionPane: ActionPane(
            extentRatio: 0.3,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  context
                      .read<ServiceRequestCubit>()
                      .putServiceRequests(serviceRequestId);
                },
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.close,
                label: 'Cancel',
              ),
            ]),
        child: Container(
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: AppColors.darkGreyColor,
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 10.w,
              right: 10.w,
              top: 9.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: (dateTime ?? '').isEmpty ? '------' : dateTime,
                  color: AppColors.menuGreyColor,
                  fontSize: 13.sp,
                ),
                const SizedBoxWidget(
                  height: 10,
                ),
                SizedBox(
                  width: 300.w,
                  child: TextWidget(
                    text: (menuModel?.title ?? '').isEmpty
                        ? '--------'
                        : menuModel?.title,
                    color: Colors.white,
                    fontSize: 17.sp,
                    textOverflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBoxWidget(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 10.w,
                        right: 10.w,
                        top: 5.h,
                        bottom: 5.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.darkGreyColor..withOpacity(0.5),
                        border: Border.all(
                            color: AppColors.lightGreyColor.withOpacity(0.4),
                            width: 2),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: TextWidget(
                        text: (menuModel?.status.toString() ?? '').isEmpty
                            ? '------'
                            : menuModel?.status.toString().capitalize(),
                        color: getStatusColor(menuModel?.status),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBoxWidget(
                      width: 15,
                    ),
                    state.menuModel?.first.serviceResponsesCount != null
                        ? Row(
                            children: [
                              TextWidget(
                                text: 'संभाषण',
                                color: Colors.grey,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              TextWidget(
                                text: ' ($responseCount)',
                                color: Colors.grey,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          )
                        : const SizedBox()
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Color getStatusColor(String? status) {
    switch (status) {
      case 'new':
        return AppColors.newColor;
      case 'inprogress':
        return AppColors.inprogressColor;
      case 'open':
        return AppColors.openColor;
      case 'completed':
        return AppColors.completedColor;
      case 'rejected':
        return AppColors.rejectColor;
      default:
        return AppColors.lightGreyColor;
    }
  }
}
