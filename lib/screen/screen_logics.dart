import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/requests/nasa_cubit.dart';
import 'package:task1/requests/nasa_cubit_state.dart';
import 'package:task1/screen/errorScreen/error_screen.dart';
import 'package:task1/screen/homeScreen/home_screen.dart';

class ScreenLogics extends StatefulWidget {
  const ScreenLogics({super.key});

  @override
  State<ScreenLogics> createState() => _ScreenLogicsState();
}

class _ScreenLogicsState extends State<ScreenLogics> {

  @override
  Widget build(BuildContext context){
    return MultiBlocProvider(
      providers: [
        BlocProvider<NasaCubit>(
          create: (context) => NasaCubit(),
        ),
      ],
      child: BlocBuilder<NasaCubit, NasaState>(
          builder: (context, state) {
            final nasaCubit = context.watch<NasaCubit>();
            if (state is NasaLoadingState) {
              nasaCubit.loadData();
              return const Center(child: CircularProgressIndicator(color: Colors.white,),);
            }
            if (state is NasaLoadedState) {
              return HomeScreen(nasaData: state.data);
            }
            if (state is NasaErrorState) {
              return ErrorScreen(cubit: nasaCubit);
            }
            return const Center(
              child: Column(
                children: [
                  Text('Something went wrong')
                ],
              )
            );
          },
        ),
    );
  }
}