import 'dart:developer';

import 'package:baapapp/constants/app_colors.dart';
import 'package:baapapp/logic/menu_detail_logic/menu_detail_cubit.dart';
import 'package:baapapp/utils/app_utils/extensions.dart';
import 'package:baapapp/widgets/custom_circular_progress_indicator.dart';

import 'package:baapapp/widgets/service_response_list_tile.dart';
import 'package:baapapp/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class MenuDetailScreen extends StatefulWidget {
  const MenuDetailScreen(
      {super.key,
      this.servicerequestId,
      this.title,
      this.dateTime,
      this.status,
      this.handledById});

  final int? servicerequestId;
  final int? handledById;
  final String? title;
  final String? dateTime;
  final String? status;

  @override
  State<MenuDetailScreen> createState() => _MenuDetailScreenState();
}

class _MenuDetailScreenState extends State<MenuDetailScreen> {
  final TextEditingController _responseController = TextEditingController();

  @override
  void initState() {
    context
        .read<ServiceRequestDetailCubit>()
        .getDetailServiceRequests(servicerequestId: widget.servicerequestId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(widget.servicerequestId.toString());
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backgroundDark,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          _headerWidget(),
          SizedBox(
            height: 10.h,
          ),
          //change
          const Divider(
            height: 10,
            color: Color(0XFF4A4B57),
            thickness: 2,
            endIndent: 5,
            indent: 5,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: _sizeBoxWidget(),
            ),
          ),
          // const Spacer(),
          _communicationWidget(),
        ]),
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(10),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       TextWidget(
      //         text: "Made in Paregaon LIVE with ",
      //         color: Colors.grey,
      //         fontSize: 13.sp,
      //       ),
      //       TextWidget(
      //         text: "Pride",
      //         color: const Color(0XFFE676A4),
      //         fontSize: 12.sp,
      //       )
      //     ],
      //   ),
      // ),
    ));
  }

  _communicationWidget() {
    return BlocBuilder<ServiceRequestDetailCubit, ServiceRequestDetailState>(
        builder: (context, state) {
      return state.serviceRequestDetail?.isEmpty ?? false
          ? const SizedBox()
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 48.h,
                  width: 280.w,
                  decoration: BoxDecoration(
                      color: AppColors.containerColor,
                      borderRadius: BorderRadius.circular(32)),
                  child: TextFormField(
                    // change
                    maxLines: 2,
                    cursorColor: AppColors.textGrey,
                    style: const TextStyle(color: AppColors.textGrey),
                    decoration: const InputDecoration(
                      hintText: 'प्रतिक्रिया',
                      hintStyle: TextStyle(color: AppColors.textGrey),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 14.0, horizontal: 22.0),
                      border: InputBorder.none,
                    ),
                    controller: _responseController,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                InkWell(
                  onTap: () {
                    context
                        .read<ServiceRequestDetailCubit>()
                        .postServiceRequestsResponse(
                          servicerequestId: widget.servicerequestId,                       
                          response: _responseController.text.trim(),
                        );

                    _responseController.clear();
                  },
                  child: Icon(
                    Icons.send,
                    color: AppColors.whiteColor,
                    size: 25.sp,
                  ),
                )
              ],
            );
    });
  }

  _headerWidget() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            context.pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: AppColors.whiteColor,
            size: 22.sp,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 190.w,
              child: TextWidget(
                text: (widget.title ?? '').isEmpty ? '--------' : widget.title,
                fontSize: 19.sp,
                color: AppColors.whiteColor,
                textOverflow: TextOverflow.ellipsis,
              ),
            ),
            //
            TextWidget(
              text: (widget.dateTime ?? '').isEmpty
                  ? '--------'
                  : widget.dateTime.toString(),
              fontSize: 12.sp,
              color: AppColors.textGrey.withOpacity(0.5),
            ),
          ],
        ),
        const Spacer(),
        Container(
          padding: EdgeInsets.only(
            left: 10.w,
            right: 10.w,
            top: 5.h,
            bottom: 5.h,
          ),
          decoration: BoxDecoration(
            // color: AppColors.lightGreyColor.withOpacity(0.4),
            border: Border.all(
                color: AppColors.lightGreyColor.withOpacity(0.4), width: 2),
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: TextWidget(
            text: widget.status.toString().capitalize(),
            color: getStatusColor(widget.status),
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
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

  _sizeBoxWidget() {
    return BlocBuilder<ServiceRequestDetailCubit, ServiceRequestDetailState>(
        builder: ((context, state) {
      if (state is ServiceRequestDetailLoading) {
        return Center(
          child: Container(
              color: AppColors.backgroundDark,
              height: 20.h,
              child: const CustomCircularProgressIndidator()),
        );
      }
      if (state is ServiceResponseSuccess) {
        context.read<ServiceRequestDetailCubit>().getDetailServiceRequests(
            servicerequestId: widget.servicerequestId);
      }
      if (state is ServiceRequestDetailError) {
        return Center(
          child: TextWidget(
            text: state.error ?? "कोणतीही माहिती मिळाली नाही ",
            color: AppColors.textGrey,
            fontSize: 17.sp,
          ),
        );
      }

      return (state.serviceRequestDetail == null ||
              state.serviceRequestDetail!.isEmpty)
          ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextWidget(
                text:
                    'तुमची विनंती आमच्या टीम ला पाठवली आहे, त्यावर लवकरच तुम्हाला प्रतिसाद दिला जाईल',
                color: AppColors.textGrey,
                fontSize: 16.sp,
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 580.h,
                  child: ListView.builder(
                      itemCount: state.serviceRequestDetail?.length ?? 0,
                      itemBuilder: (context, index) {
                        log("${state.serviceRequestDetail?.length}");

                        String date = state
                                .serviceRequestDetail?[index].dateTime
                                .toString() ??
                            '';
                        DateTime dateTime = DateTime.parse(date);
                        // initializeDateFormatting();
                        DateTime localDateTime = dateTime.toLocal();
                        String formattedDate =
                            DateFormat('dd MMM yyyy   hh:mm a')
                                .format(localDateTime);
                        return Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: ServiceResponseTile(
                              serviceDetailsModel:
                                  state.serviceRequestDetail?[index],
                              dateTime: formattedDate,
                            ));
                      }),
                ),
              ],
            );
    }));
  }
}
