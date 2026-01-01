import 'package:flutter/material.dart';
import 'type.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: 'poppins',
  textTheme: const TextTheme(
    headlineLarge: AppTextStyle.title,          // 큰 타이틀
    titleMedium: AppTextStyle.largeRegular,     // 서브 타이틀
    bodyLarge: AppTextStyle.bodyBold,            // 본문 강조
    bodyMedium: AppTextStyle.bodyRegular,        // 본문
    labelLarge: AppTextStyle.smallBold,          // 작은 강조 텍스트
    labelSmall: AppTextStyle.smallRegular,       // 캡션
  ),
); 