import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getalldata/cubit/getalldata_cubit.dart';
import 'package:provider/single_child_widget.dart';


List<SingleChildWidget> blocprovider=[
  BlocProvider(create: (context)=>GetalldataCubit(),)
];