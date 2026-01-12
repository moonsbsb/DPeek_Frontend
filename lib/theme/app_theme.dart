import 'package:flutter/material.dart';
import 'package:mypal/theme/AppColor.dart';
import 'package:mypal/theme/AppTextStyle.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: 'poppins',

  textTheme: const TextTheme(
    headlineLarge: AppTextStyle.title,          // 큰 타이틀
    titleLarge: AppTextStyle.display,
    titleMedium: AppTextStyle.largeRegular,     // 서브 타이틀
    bodyLarge: AppTextStyle.bodyBold,            // 본문 강조
    bodyMedium: AppTextStyle.bodyRegular,        // 본문
    labelLarge: AppTextStyle.smallBold,          // 작은 강조 텍스트
    labelSmall: AppTextStyle.smallRegular,       // 캡션
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Appcolor.BtnPrimary,
      foregroundColor: Appcolor.white,
      minimumSize: const Size.fromHeight(52),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      textStyle: AppTextStyle.largeRegular,
    ),
  ),
); 