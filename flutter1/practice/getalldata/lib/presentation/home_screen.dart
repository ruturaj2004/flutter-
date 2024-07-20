import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getalldata/cubit/getalldata_cubit.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     context.read<GetalldataCubit>().getData();
//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Get api ..........."),
//       ),
//       body: BlocBuilder<GetalldataCubit, GetalldataState>(
//         builder: (context, state) {
//           if(state is GetalldataLoading){
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }else if(state is GetalldataError){
//             return Text("Error to data loading ${state.error}");
//           }else if(state is GetalldataLoaded){
//             return  Column(
//             children: [
//               Text(state.getResponse?.data?.name??""),
//             ],
//           );
//           }
//        return Text("");
//         }

//       ),
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    context.read<GetalldataCubit>().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<GetalldataCubit, GetalldataState>(
            builder: (context, state) {
              if (state is GetalldataLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetalldataLoaded){
                return Text(state.getResponse?.data?.name??"");
              }
              return Text("");
            },
          )
        ],
      ),
    );
  }
}
