import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_adviser/logic/dropdown/dropdowncubit_cubit.dart';
import 'package:legal_adviser/logic/image-silder/image_slider_cubit.dart';
import 'package:legal_adviser/logic/reminder/reminder_cubit.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> blocProviders = [
  BlocProvider(create: (context) => DropdownCubit()),
  BlocProvider(create: (context) => ReminderCubit()),
   BlocProvider(create: (context) => SliderCubit()),
];
