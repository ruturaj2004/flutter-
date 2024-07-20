// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:salesman_app/logic/add_product_logic/add_product_cubit.dart';
import 'package:salesman_app/logic/create_customer_logic/create_customer_cubit.dart';
import 'package:salesman_app/logic/get_group_logic/get_groups_cubit.dart';
import 'package:salesman_app/logic/search_customer_logic/search_customer_cubit.dart';
import 'package:salesman_app/logic/search_products_logic/search_products_cubit.dart';
import 'package:salesman_app/logic/send_otp_logic/send_otp_cubit.dart';
import 'package:salesman_app/logic/verify_otp_logic/verify_otp_cubit.dart';

import '../logic/cart_logic/cart_cubit_cubit.dart';

List<SingleChildWidget> blocProviders = [
  BlocProvider(create: (context) => SendOtpCubit()),
  BlocProvider(create: (context) => VerifyOtpCubit()),
  BlocProvider(create: (context) => GetGroupsCubit()),
  BlocProvider(create: (context) => SearchCustomerCubit()),
  BlocProvider(create: (context) => SearchProductsCubit()),
  BlocProvider(create: (context) => CreateCustomerCubit()),
  BlocProvider(create: (context) => CartCubit()),
  BlocProvider(create: (context) => AddProductCubit()),
];
