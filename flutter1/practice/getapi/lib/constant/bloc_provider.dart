import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getapi/cubit/get_data_cubit.dart';
import 'package:provider/single_child_widget.dart';
List<SingleChildWidget> blcprovider=[
   BlocProvider(create: (context) => GetDataCubit(),)
];