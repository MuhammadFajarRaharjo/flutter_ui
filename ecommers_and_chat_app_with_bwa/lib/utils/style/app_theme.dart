import 'package:ecommers_and_chat_app_with_bwa/utils/constants/box_size.dart';
import 'package:flutter/material.dart';

import 'app_style.dart';

class AppTheme {
  static final theme = ThemeData.dark(
    useMaterial3: true,
  ).copyWith(
    scaffoldBackgroundColor: AppStyle.darkNavy1F,
    textTheme: TextTheme(
      titleSmall: AppStyle.poppinsRegular,
    ),
    appBarTheme: AppBarTheme(
      toolbarHeight: 87,
      backgroundColor: AppStyle.darkNavy24,
      titleTextStyle: AppStyle.poppinsMedium.copyWith(fontSize: 18),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppStyle.purple,
        textStyle: AppStyle.poppinsMedium.copyWith(fontSize: BoxSize.size16),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          vertical: BoxSize.size12,
          horizontal: BoxSize.size12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BoxSize.radius12),
          side: BorderSide.none,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BoxSize.radius12),
          side: const BorderSide(color: AppStyle.purple, width: 2),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: BoxSize.size12,
          horizontal: BoxSize.size12,
        ),
        textStyle: AppStyle.poppinsRegular.copyWith(
          fontSize: 14,
          color: AppStyle.purple,
        ),
      ),
    ),
  );
}
