// ignore: depend_on_referenced_packages
import 'package:provider/single_child_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_app/Logic/verify_otp_logic/cubit/verify_otp_logic_cubit.dart';
import 'package:trip_app/logic/get_duration_logic/get_duration_cubit.dart';
import 'package:trip_app/logic/group_data_logic/group_data_cubit.dart';
import 'package:trip_app/logic/phone_screen_logic/cubit/phone_screen_cubit.dart';
import 'package:trip_app/logic/start_trip_cubit/start_trip_logic_cubit.dart';
import 'package:trip_app/logic/update_location_logic/update_location_cubit.dart';

List<SingleChildWidget> blocProviders = [
  BlocProvider(create: (context) => SendOtpCubit()),
  BlocProvider(create: (context) => VerifyOtpLogicCubit()),
  BlocProvider(create: (context) => StartTripLogicCubit()),
  BlocProvider(create: (context) => UpdateLocationCubit()),
  BlocProvider(create: (context) => GetDurationCubit()),
  BlocProvider(create: (context) => GroupDataCubit()),

];
