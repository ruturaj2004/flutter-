import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip_app/constants/appcolors.dart';
import 'package:trip_app/constants/appstrings.dart';
import 'package:trip_app/logic/group_data_logic/group_data_cubit.dart';
import 'package:trip_app/logic/start_trip_cubit/start_trip_logic_cubit.dart';
import 'package:trip_app/logic/start_trip_cubit/start_trip_logic_state.dart';
import 'package:trip_app/presentations/map_screen/map_screen.dart';
import 'package:trip_app/utils/peferance/peferance.dart';
import 'package:trip_app/utils/routes/app_utils/snackbar/snackbar.dart';
import 'package:trip_app/utils/routes/routes.dart';
import 'package:trip_app/widgets/buttonWidget.dart';
import 'package:trip_app/widgets/footerWidget.dart';
import 'package:trip_app/widgets/sizedBoxWidget.dart';
import 'package:trip_app/widgets/textFormFieldWidet.dart';
import 'package:trip_app/widgets/textWidget.dart';
import 'package:geolocator/geolocator.dart';
import '../../utils/routes/app_utils/keyboard_dismis/keyboard_utils.dart';

class RouteScreen extends StatefulWidget {
  const RouteScreen({super.key, String? phoneNumber});

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  final TextEditingController _locationNameController = TextEditingController();
  final List<TextEditingController> _targetLocationControllers = [];
  late Timer _gpsTimer;

  @override
  void initState() {
    super.initState();
    refreshTokenAndDecodeToken();
    _targetLocationControllers.add(TextEditingController());
    context.read<GroupDataCubit>().groupDataDetail();
    checkGps();
    _gpsTimer = Timer.periodic(const Duration(minutes: 1), (timer) {
      checkGps();
    });
  }

  @override
  void dispose() {
    _gpsTimer.cancel();
    refreshTokenAndDecodeToken.call();
    super.dispose();
  }

  bool areTargetLocationsEmpty() {
    for (var controller in _targetLocationControllers) {
      if (controller.text.trim().isEmpty) {
        return true;
      }
    }
    return false;
  }

  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";
  late StreamSubscription<Position> positionStream;
  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          SnackBarWidget.showSnackbar(context, "Location permission is denied");
          print("Location permission is denied");
        } else if (permission == LocationPermission.deniedForever) {
          SnackBarWidget.showSnackbar(
              context, "Location Permission Denied is permanently denied");
          print("Location Permission Denied is permanently denied");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }
      if (haspermission) {
        setState(() {});
        getLocation();
      }
    } else {
      print("GPS Service is not enabled, turn on GPS location");
      SnackBarWidget.showSnackbar(
          context, "GPS Service is not enabled, turn on GPS location",
          color: Color.fromARGB(255, 190, 98, 13));
    }
    setState(() {});
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.longitude.toString());
    print(position.latitude.toString());

    long = position.longitude.toString();
    lat = position.latitude.toString();

    GetStorage().write("latitude", lat);
    GetStorage().write("longitude", long);
    LocalStorageUtils.saveGeoLocation(position.latitude, position.longitude);
    setState(() {});
  }

  late String userName = "";
  Future<void> refreshTokenAndDecodeToken() async {
    String? refreshToken = LocalStorageUtils.instance.getString('refreshToken');

    if (refreshToken == null) {
      context.push(Routes.loginBaapAppScreen);
      AlertDialog(
        actions: [
          TextWidget(
            context: context,
            data: "You are not Login In Baap App",
          )
        ],
      );
      return;
    }

    Map<String, dynamic>? decodedToken = JwtDecoder.decode(refreshToken);

    setState(() {
      userName = decodedToken['name'];
    });
    print("\x1B[32m. Token Response$decodedToken\x1B[0m");
    print("\x1B[32m. Token Response$userName\x1B[0m");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await _showExitConfirmationDialog();
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.only(
                top: 20.h, bottom: 20.h, left: 5.w, right: 28.w),
            child: BlocConsumer<StartTripLogicCubit, StartTripLogicState>(
              listener: (context, startTripLogicState) {
                if (startTripLogicState is StartTripLoading) {
                  const CircularProgressIndicator();
                } else if (startTripLogicState is StartTripError) {
                  SnackBarWidget.showSnackbar(
                    context,
                    "Enter Both Fields",
                    color: const Color(0xFFFF0000),
                  );
                } else if (startTripLogicState is StartTripSuccess) {
                  print(startTripLogicState.startTripModel?.newTrip);
                  SharedPreferences.getInstance().then((prefs) {
                    final startTripModelJson =
                        startTripLogicState.startTripModel?.toJson();
                    final startTripModelString = jsonEncode(startTripModelJson);

                    prefs.setString('startTripModel', startTripModelString);
                  });
                  context.push(
                    Routes.endTripScreen,
                  );
                }
              },
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    KeyBoardUtils.hideKeyBoard(context);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 35.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BlocBuilder<GroupDataCubit, GroupDataState>(
                                  builder: (context, state) {
                                    if (state is GroupDataLoading) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    if (state is GroupDataLoaded) {
                                      return Row(
                                        children: [
                                          Image.network(
                                            state.gropuDataModel?.data
                                                    ?.logoUrl ??
                                                "",
                                            height: 45.h,
                                            width: 45.w,
                                          ),
                                          SizedBoxWidget(
                                            width: 5.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextWidget(
                                                context: context,
                                                data: state
                                                    .gropuDataModel?.data?.name,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 16.sp,
                                                height: 0.8.h,
                                              ),
                                              SizedBoxWidget(height: 4.h),
                                              TextWidget(
                                                context: context,
                                                data: state.gropuDataModel?.data
                                                    ?.shortName,
                                                color: AppColors.textGreyColor,
                                                fontSize: 11.sp,
                                                height: 1.5.h,
                                              ),
                                            ],
                                          )
                                        ],
                                      );
                                    }
                                    return TextWidget(
                                      data: "NUll",
                                      context: context,
                                    );
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 35.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  context: context,
                                  data: AppString.welcomeText,
                                  fontSize: 13.sp,
                                ),
                                TextWidget(
                                  context: context,
                                  data: userName,
                                ),
                              ],
                            ),
                          ),
                          SizedBoxWidget(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              const Column(
                                children: [
                                  Icon(Icons.radio_button_checked),
                                  RotatedBox(
                                    quarterTurns: 1,
                                    child: Text("··········"),
                                  ),
                                  Icon(Icons.location_on),
                                ],
                              ),
                              SizedBoxWidget(
                                width: 10.w,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    TextFormFieldWidget(
                                      constraints:
                                          BoxConstraints.expand(height: 50.h),
                                      border: const OutlineInputBorder(),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp,
                                      hintText: "Enter Current Location",
                                      controller: _locationNameController,
                                    ),
                                    SizedBoxWidget(
                                      height: 14.h,
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          _targetLocationControllers.length,
                                      itemBuilder: (context, index) {
                                        return TextFormFieldWidget(
                                          constraints: BoxConstraints.expand(
                                              height: 50.h),
                                          border: const OutlineInputBorder(),
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          hintText: "Enter Target Location",
                                          fontSize: 13.sp,
                                          controller:
                                              _targetLocationControllers[index],
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter Target Location Name';
                                            }
                                            return null;
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBoxWidget(
                            height: 10.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 32.w),
                            height: 330.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                color: const Color.fromARGB(109, 6, 82, 145)),
                            child: const GoogleMapScreen(),
                          ),
                          SizedBoxWidget(
                            height: 10.h,
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 32.w),
                        child: ButtonWidget(
                          context: context,
                          buttonText: 'Start Trip',
                          backGroundColor: Theme.of(context).shadowColor,
                          buttonTextColor: Theme.of(context).cardColor,
                          buttonTextSize: 14.sp,
                          buttonTextfontWeight: FontWeight.w300,
                          height: 40.h,
                          width: 110.w,
                          radius: 4.r,
                          onPressed: () {
                            if (_locationNameController.text.trim().isEmpty) {
                              SnackBarWidget.showSnackbar(
                                  context, 'Please enter the Current Location',
                                  color: const Color(0xFFFF0000));
                            } else if (areTargetLocationsEmpty()) {
                              SnackBarWidget.showSnackbar(
                                  context, 'Please enter Target Location',
                                  color: const Color(0xFFFF0000));
                            } else {
                              context.read<StartTripLogicCubit>().startTrip(
                                fromLatLong: [
                                  position.latitude,
                                  position.longitude
                                ],
                                destinationLatLong: [], // You may need to get the actual end location
                                from: _locationNameController.text.trim(),
                                destination: _targetLocationControllers
                                    .map((controller) => controller.text.trim())
                                    .toList(),
                              );
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 32.w),
                        child: const FooterWidget(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _showExitConfirmationDialog() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: TextWidget(
              data: 'Exit App',
              context: context,
              fontWeight: FontWeight.w700,
            ),
            content: TextWidget(
                data: 'Are you sure you want to exit the app?',
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                context: context),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: TextWidget(
                  data: 'Cancel',
                  context: context,
                  color: const Color.fromARGB(255, 0, 12, 150),
                  fontSize: 14.sp,
                ),
              ),
              TextButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: TextWidget(
                  data: 'Exit',
                  context: context,
                  color: Colors.red,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ) ??
        false;
  }
}
