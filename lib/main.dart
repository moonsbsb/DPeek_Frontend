import 'package:flutter/material.dart';
import 'package:mypal/theme/app_theme.dart';
import 'package:mypal/screen/onboard/onBoardingScreen.dart';
import 'package:mypal/screen/MainScreen.dart';

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
      theme: appTheme,
      home: const MainScreen(),
    );
  }
}
