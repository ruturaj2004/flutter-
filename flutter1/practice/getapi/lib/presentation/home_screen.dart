import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getapi/cubit/get_data_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<GetDataCubit>().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetAPI"),
      ),
      body: BlocBuilder<GetDataCubit, GetDataState>(
        builder: (context, state) {
          if (state is GetDataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetDataError) {
            return Text("Error to data loading ${state.error}");
          } else if (state is GetDataLoaded) {
            return Column(
              children: [
                Text(state.getResponse?.data?.name ?? ""),
              ],
            );
          }
          return const Text("");
        },
      ),
    );
  }
}
