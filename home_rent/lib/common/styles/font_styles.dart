import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontStyles {
  /// fonst family
  static final ralewayBold = GoogleFonts.raleway(
    fontWeight: FontWeight.w700,
  );

  static final ralewaySemibold = GoogleFonts.raleway(
    fontWeight: FontWeight.w600,
  );

  static final ralewayMedium = GoogleFonts.raleway(
    fontWeight: FontWeight.w500,
  );

  static final ralewayRegular = GoogleFonts.raleway(
    fontWeight: FontWeight.w400,
  );

  static final ralewayRegular12 = ralewayRegular.copyWith(fontSize: 12);
  static final ralewayRegular16 = ralewayRegular.copyWith(fontSize: 16);

  static final ralewayMedium12 = ralewayMedium.copyWith(fontSize: 12);
  static final ralewayMedium16 = ralewayMedium.copyWith(fontSize: 16);
  static final ralewayMedium20 = ralewayMedium.copyWith(fontSize: 20);

  static final ralewaySemibold20 = ralewaySemibold.copyWith(fontSize: 20);
}
