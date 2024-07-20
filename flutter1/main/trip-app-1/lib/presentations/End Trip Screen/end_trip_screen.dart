import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip_app/constants/appstrings.dart';
import 'package:trip_app/logic/get_duration_logic/get_duration_cubit.dart';
import 'package:trip_app/logic/update_location_logic/update_location_cubit.dart';
import 'package:trip_app/model/start_trip_model/start_trip_model.dart';
import 'package:trip_app/presentations/map_screen/map_screen.dart';
import 'package:trip_app/utils/peferance/peferance.dart';
import 'package:trip_app/utils/routes/app_utils/snackbar/snackbar.dart';
import 'package:trip_app/utils/routes/routes.dart';
import 'package:trip_app/widgets/buttonWidget.dart';
import 'package:trip_app/widgets/footerWidget.dart';
import 'package:trip_app/widgets/sizedBoxWidget.dart';
import 'package:trip_app/widgets/textFormFieldWidet.dart';
import 'package:trip_app/widgets/textWidget.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

class EndTripScreen extends StatefulWidget {
  @override
  State<EndTripScreen> createState() => _EndTripScreenState();
}

class _EndTripScreenState extends State<EndTripScreen> {
  final TextEditingController updatelocationController =
      TextEditingController();
  late Timer _distanceTimer;
  String formattedDistance = '';
  late StartTripModel _startTripModel;
  @override
  void initState() {
    super.initState();
    _distanceTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      context.read<UpdateLocationCubit>().stream.listen((updateLocationState) {
        if (updateLocationState is UpdateLocationLoaded) {
          double? distance =
              updateLocationState.updateLocationModel?.updatedTrip?.distance;
          if (distance != null) {
            setState(() {
              formattedDistance = distance.toStringAsFixed(2);
            });
          } else {
            setState(() {
              formattedDistance = 'Distance not available';
            });
          }
        }
      });
    });
    _loadStartTripModel();
  }

  Future<void> _loadStartTripModel() async {
    final startTripModelString =
        LocalStorageUtils.instance.getString('startTripModel');
    if (startTripModelString != null) {
      final startTripModelJson = jsonDecode(startTripModelString);
      setState(() {
        _startTripModel = StartTripModel.fromJson(startTripModelJson);
      });
    }
  }

  Future<void> _onEndTripPressed() async {
    bool shouldEndTrip = await showExitConfirmationDialog();

    if (shouldEndTrip) {
      context.read<GetDurationCubit>().getDurationTime();
    }
  }

  final FocusNode _focusNode = FocusNode();
  @override
  void dispose() {
    _focusNode.dispose();
    _distanceTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    tzdata.initializeTimeZones();
    tz.Location istLocation = tz.getLocation('Asia/Kolkata');
    tz.TZDateTime istDateTime = tz.TZDateTime.from(
        _startTripModel.newTrip?.startTime ?? DateTime.now(), istLocation);
    String formattedISTTime = DateFormat('hh:mm a').format(istDateTime);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                context: context,
                data: _startTripModel.newTrip?.createdAt != null
                    ? DateFormat('dd-MM-yyyy').format(
                        _startTripModel.newTrip?.createdAt ?? DateTime.now())
                    : 'No date available',
              ),
              TextWidget(
                  context: context,
                  data:
                      "Trip to ${_startTripModel.newTrip?.destination?[0] ?? "not found"}",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).shadowColor),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        context: context,
                        data: AppString.starttime,
                        fontSize: 14.sp,
                        color: Theme.of(context).hintColor,
                      ),
                      TextWidget(
                          context: context,
                          data: formattedISTTime.toString(),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                  SizedBoxWidget(
                    width: 80.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        context: context,
                        data: AppString.endtime,
                        fontSize: 14.sp,
                        color: Theme.of(context).hintColor,
                      ),
                      BlocBuilder<GetDurationCubit, GetDurationState>(
                        builder: (context, getDurationState) {
                          if (getDurationState is GetDurationLoading) {
                            return Container(
                              margin: EdgeInsets.only(left: 10.w),
                              height: 25.h,
                              width: 25.w,
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            );
                          } else if (getDurationState is GetDurationError) {
                            return TextWidget(
                              context: context,
                              data: getDurationState.errorMessage,
                            );
                          } else if (getDurationState is GetDurationLoaded) {
                            String utcEndTimeString = getDurationState
                                .getDurationModel!.endTime
                                .toString();
                            DateTime utcEndTime =
                                DateTime.parse(utcEndTimeString);
                            tz.Location istLocation =
                                tz.getLocation('Asia/Kolkata');
                            tz.TZDateTime istDateTime =
                                tz.TZDateTime.from(utcEndTime, istLocation);
                            String endTime =
                                DateFormat('hh:mm a').format(istDateTime);
                            tzdata.initializeTimeZones();
                            return TextWidget(
                              context: context,
                              data: endTime.toString(),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            );
                          }
                          return Text(
                            "00:00 AM/PM",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10.h),
              Container(
                height: 50,
                child: TextFormField(
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: AppString.addmorelocation,
                    suffixIcon: InkWell(
                      onTap: () {
                        var latString = GetStorage().read('latitude');
                        var lonString = GetStorage().read('longitude');

                        var lat = double.parse(latString);
                        var lon = double.parse(lonString);

                        var destinationLatLong = [lat, lon];
                        if (updatelocationController.text.trim().isNotEmpty) {
                          context
                              .read<UpdateLocationCubit>()
                              .updateLocationData(
                                  destination: updatelocationController.text,
                                  destinationLatLong: destinationLatLong);
                          SnackBarWidget.showSnackbar(
                              context, "Destination updated successfully",
                              color: const Color.fromARGB(255, 27, 154, 1));
                        } else if (updatelocationController.text
                            .trim()
                            .isEmpty) {
                          SnackBarWidget.showSnackbar(
                              context, "Enter Destination Name",
                              color: const Color.fromARGB(255, 198, 8, 8));
                        }
                      },
                      child: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  controller: updatelocationController,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).shadowColor,
                  ),
                ),
              ),
              SizedBox(height: 13.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 328.h,
                    width: 320.w,
                    child: const Center(
                      child: GoogleMapScreen(),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            context: context,
                            data: AppString.kmtravelld,
                            fontSize: 14.sp,
                            color: Theme.of(context).hintColor,
                          ),
                          BlocBuilder<UpdateLocationCubit, UpdateLocationState>(
                            builder: (context, updateLocationState) {
                              if (updateLocationState
                                  is UpdateLocationLoading) {
                                return SizedBoxWidget(
                                  height: 25.h,
                                  width: 25.w,
                                  child: const CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                );
                              } else if (updateLocationState
                                  is UpdateLocationError) {
                                return TextWidget(
                                  context: context,
                                  data: updateLocationState.errorMessage,
                                );
                              } else if (updateLocationState
                                  is UpdateLocationLoaded) {
                                double? distance = updateLocationState
                                    .updateLocationModel?.updatedTrip?.distance;
                                if (distance != null) {
                                  String formattedDistance =
                                      distance.toStringAsFixed(2);
                                  return TextWidget(
                                    context: context,
                                    data: "$formattedDistance Km",
                                  );
                                } else {
                                  return TextWidget(
                                    context: context,
                                    data: 'Distance not available',
                                  );
                                }
                              }
                              return TextWidget(
                                data: "0.000 Km",
                                color: Colors.grey,
                                context: context,
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBoxWidget(
                        width: 80.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            context: context,
                            data: AppString.totaltime,
                            fontSize: 14.sp,
                            color: Theme.of(context).hintColor,
                          ),
                          BlocBuilder<GetDurationCubit, GetDurationState>(
                            builder: (context, getDurationState) {
                              if (getDurationState is GetDurationLoading) {
                                return SizedBoxWidget(
                                  height: 20.h,
                                  width: 20.w,
                                  child: const CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                );
                              } else if (getDurationState is GetDurationError) {
                                return TextWidget(
                                  context: context,
                                  data: getDurationState.errorMessage,
                                );
                              } else if (getDurationState
                                  is GetDurationLoaded) {
                                final durationModel =
                                    getDurationState.getDurationModel;
                                if (durationModel != null &&
                                    durationModel.duration != null) {
                                  final hours = durationModel.duration!.hours;
                                  final minutes =
                                      durationModel.duration!.minutes! % 60;
                                  return TextWidget(
                                    context: context,
                                    data: '$hours hours $minutes min',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).shadowColor,
                                  );
                                }
                              }
                              return TextWidget(
                                data: "00 hours 00 min",
                                color: Colors.grey,
                                context: context,
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.black,
                        border: Border.all(width: 1.w),
                      ),
                      child: ButtonWidget(
                        context: context,
                        buttonText: AppString.adddelar,
                        backGroundColor: Theme.of(context).shadowColor,
                        buttonTextColor: Theme.of(context).cardColor,
                        buttonTextSize: 10.sp,
                        height: 40.h,
                        width: 94.w,
                        radius: 4.r,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.black,
                        border: Border.all(width: 1.w),
                      ),
                      child: ButtonWidget(
                        context: context,
                        buttonText: AppString.takeorder,
                        backGroundColor: Colors.black,
                        buttonTextColor: Colors.white,
                        buttonTextSize: 12.sp,
                        height: 40.h,
                        width: 100.w,
                        radius: 4,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        bool shouldEndTrip = await showExitConfirmationDialog();
                        shouldEndTrip;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.white,
                          border: Border.all(width: 1.w),
                        ),
                        child: ButtonWidget(
                          onPressed: _onEndTripPressed,
                          context: context,
                          buttonText: AppString.endtrip,
                          backGroundColor: Colors.white,
                          buttonTextColor: Theme.of(context).shadowColor,
                          buttonTextSize: 11.sp,
                          buttonTextfontWeight: FontWeight.w900,
                          height: 39.h,
                          width: 90.w,
                          radius: 4.r,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> showExitConfirmationDialog() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextWidget(
                data: 'Are you want to sure end the trip?',
                context: context,
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
              ),
            ),
            contentPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: TextWidget(
                  data: 'Cancel',
                  context: context,
                  fontSize: 15.sp,
                  color: Colors.red,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navigator.of(context).pop(true);
                  context.push(Routes.routeScreen);
                },
                child: TextWidget(
                  data: 'Confirm',
                  context: context,
                  fontSize: 15.sp,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ) ??
        false;
  }
}
