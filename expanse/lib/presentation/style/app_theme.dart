import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import 'app_text_style.dart';

class AppTheme {
  static final light = ThemeData.light(useMaterial3: true).copyWith(
    colorScheme: const ColorScheme.light(primary: kPrimaryColor),
    scaffoldBackgroundColor: kWhite80,
    textTheme: TextTheme(
      bodyLarge: interSemibold.copyWith(fontSize: 18, color: kTextPrimary),
      bodyMedium: interMedium.copyWith(color: kTextPrimary),
      bodySmall: interRegular.copyWith(color: kTextPrimary),
      headlineMedium: interBold.copyWith(color: kTextPrimary, fontSize: 32),
      headlineLarge: interSemibold.copyWith(color: kTextPrimary, fontSize: 40),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        padding: const EdgeInsets.only(right: 0),
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      ),
    ),
    iconTheme: const IconThemeData(color: kPrimaryColor),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: interSemibold.copyWith(fontSize: 18, color: kTextPrimary),
    ),
  );
}
