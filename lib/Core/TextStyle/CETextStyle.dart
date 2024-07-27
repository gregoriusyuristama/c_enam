import 'package:c_enam/Core/Colors/CEColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CETextStyle {
  static final titleStyle = GoogleFonts.inter(
    textStyle: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
  );

  static final hintTextStyle = GoogleFonts.inter(
    textStyle: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
  );

  static final cardTextStyle = GoogleFonts.inter(
    textStyle: TextStyle(
        fontSize: 14, fontWeight: FontWeight.normal, color: CEcolors.blackText),
  );
  static final chipTextStyle = GoogleFonts.inter(
    textStyle: TextStyle(
        fontSize: 12, fontWeight: FontWeight.normal, color: CEcolors.green),
  );

  static final regular12 = GoogleFonts.inter(
    textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
  );

  static final regular14 = GoogleFonts.inter(
    textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
  );

  static final regular18 = GoogleFonts.inter(
    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
  );

  static final semiBold21 = GoogleFonts.inter(
    textStyle: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
  );

  static final semiBold16 = GoogleFonts.inter(
    textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
  );
}
