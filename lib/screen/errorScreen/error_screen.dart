import 'package:flutter/material.dart';
import 'package:task1/requests/nasa_cubit.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.cubit});

  final NasaCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Something went wrong', style: TextStyle(color: Colors.white, fontSize: 20),),
            TextButton(
              onPressed: (){
                cubit.loadData();
              }, 
              child: const Text('Reload data', style: TextStyle(color: Colors.white),)
            )
          ]
        ),
      )
    );
  }
}