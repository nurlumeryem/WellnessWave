import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/meditation/presentation/pages/meditation_screen.dart';
import 'package:flutter_application_1/presentation/onboarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
        ),
        home: MeditationScreen());
  }
}
