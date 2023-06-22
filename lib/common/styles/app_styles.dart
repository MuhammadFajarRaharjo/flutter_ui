import 'package:flutter/material.dart';

import '../constants/my_colors.dart';
import 'box_style.dart';

class AppStyles {
  ///
  /// Input Border style
  ///
  static final inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(BoxStyle.borderRadius10),
    borderSide: const BorderSide(
      color: Colors.white,
    ),
  );

  ///
  /// Linear Gradient
  ///
  static final Gradient sinearGradientBlack = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Colors.black.withOpacity(0.8),
      MyColors.black0D.withOpacity(0),
    ],
    tileMode: TileMode.clamp,
  );

  static const Gradient linearGradientBlue = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      MyColors.lightBlue,
      MyColors.blue,
    ],
    tileMode: TileMode.clamp,
  );

  static final Gradient linearGradientWhite = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.white.withOpacity(0),
      Colors.white,
    ],
    tileMode: TileMode.clamp,
  );
}
