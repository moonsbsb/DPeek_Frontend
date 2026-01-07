import 'package:flutter/widgets.dart';
import 'package:mypal/theme/AppColor.dart';

class Appgradient {
  static const LinearGradient home = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Appcolor.gradientStart,
      Appcolor.background
    ],
  );
}