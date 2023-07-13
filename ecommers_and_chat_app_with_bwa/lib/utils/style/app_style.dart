import 'dart:ui';

import 'package:ecommers_and_chat_app_with_bwa/utils/constants/box_size.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  //* Constant colors
  static const darkNavy1F = Color(0xFF1F1D2B);
  static const darkNavy24 = Color(0xFF242231);
  static const darkNavy25 = Color(0xFF252836);
  static const navy = Color(0xFF2B2937);
  static const greyB7 = Color(0xFFB7B6BF);
  static const grey99 = Color(0xFF999999);
  static const grey50 = Color(0xFF504F5E);
  static const darkGrey39 = Color(0xFF39374B);
  static const darkGrey30 = Color(0xFF302E37);
  static const blue2C = Color(0xFF2C96F1);
  static const salmon = Color(0xFFED6363);
  static const blue38 = Color(0xFF38ABBE);
  static const green51 = Color(0xFF51C17E);
  static const purple = Color(0xFF6C5ECF);
  static const whiteEC = Color(0xFFECEDEF);

  //* Constant Fonts
  static final poppinsLight = GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    fontSize: 13,
    color: grey50,
  );
  static final poppinsRegular = GoogleFonts.poppins(
    fontWeight: FontWeight.normal,
    fontSize: BoxSize.size16,
  );
  static final poppinsRegularSecondary = GoogleFonts.poppins(
    fontWeight: FontWeight.normal,
    color: grey50,
    fontSize: BoxSize.size16,
  );
  static final poppinsMedium = GoogleFonts.poppins(fontWeight: FontWeight.w500);
  static final poppinsSemiBold = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
  );
}
