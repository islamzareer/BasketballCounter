import 'package:basketball_counter/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Stack(
          children: [
            Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.black45,
                  title: const Text('Points Counter'),
                ),
                body: const PointsCounter()),
          ],
        )));
  }
}
