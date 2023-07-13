import 'package:flutter/material.dart';

class BoxSize {
  static const size30 = 30.0;
  static const size24 = 24.0;
  static const size22 = 22.0;
  static const size20 = 20.0;
  static const size16 = 16.0;
  static const size12 = 12.0;
  static const size10 = 10.0;
  static const size5 = 5.0;

  static const radius12 = 12.0;
  static const radius30 = 30.0;

  static double proportionalHeight(BuildContext context, double height) =>
      MediaQuery.sizeOf(context).height * (height / 100);
  static double proportionalWidth(BuildContext context, double width) =>
      MediaQuery.sizeOf(context).width * (width / 100);
}
