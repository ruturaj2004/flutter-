import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getap/cubit/get_cubit.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> provider=[
  BlocProvider(create: (context)=>GetCubit())
];