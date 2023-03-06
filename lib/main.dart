// ignore_for_file: avoid_print
import 'package:basketball_counter_app/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const PointsCounter());
}

class PointsCounter extends StatelessWidget {
  const PointsCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CounterCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false, home: HomeScreen()),
    );
  }
}
