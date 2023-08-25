import 'package:flutter/material.dart';

//* Colors
const kPrimaryColor = Color(0xFF7F3DFF);
const kWhite60 = Color(0xFFF1F1FA);
const kWhite80 = Color(0xFFFCFCFC);
const kWhite20 = Color(0xFFE3E5E5);
const kViolet20 = Color(0xFFEEE5FF);
const kRed = Color(0xFFFD3C4A);
const kRed20 = Color(0xFFFDD5D7);
const kGreen = Color(0xFF00A86B);
const kGreen20 = Color(0xFFCFFAEA);
const kBlue = Color(0xFF0077FF);
const kBlue20 = Color(0xFFBDDCFF);
const kCream = Color(0xFFFFF6E5);
const kYellow = Color(0xFFFCAC12);
const kYellow20 = Color(0xFFFCEED4);
const kTextPrimary = Color(0xFF0D0E0F);
const kTextSecondary = Color(0xFF91919F);

//* Gradient Colors
const gradientCream = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [kCream, Color(0x00F8EDD8)],
);

List<Color> _gradientPurple = [
  const Color(0x008B50FF),
  const Color(0x3d8B50FF)
];

final gradientFadePurple = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: _gradientPurple,
);

final gradientFadePurpleReversed = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: _gradientPurple.reversed.toList(),
);
