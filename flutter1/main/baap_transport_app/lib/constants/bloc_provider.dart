// ignore_for_file: depend_on_referenced_packages
import 'package:baap_trasport_app/app/login/cubit/send_otp_cubit.dart';
import 'package:baap_trasport_app/app/start_trip/cubit/dropdown_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> blocProvider = [

  BlocProvider(create: (context) => SendOtpCubit()),
  BlocProvider(create: (context) => DropdownCubit()),


];
