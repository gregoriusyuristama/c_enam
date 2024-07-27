import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CETextStyle {
  static final titleStyle = GoogleFonts.inter(
    textStyle: const TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
  );
  static final headingSection = GoogleFonts.inter(
    textStyle: const TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
  );

  static final hintTextStyle = GoogleFonts.inter(
    textStyle: const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black12),
  );
  static final titleCsAppBar = GoogleFonts.inter(
    textStyle: const TextStyle(
        fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
  );
  static final textBadge = GoogleFonts.inter(
    textStyle: const TextStyle(
        fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
  );
  static final textBadgeActive = GoogleFonts.inter(
    textStyle: const TextStyle(
        fontSize: 12, fontWeight: FontWeight.w800, color: Color(0xFF005339)),
  );
  static final titleBanner = GoogleFonts.inter(
    textStyle: const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black),
  );
  static final subTitleBanner = GoogleFonts.inter(
    textStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 30, 30, 30)),
  );
  static final subTitleBannerBold = GoogleFonts.inter(
    textStyle: const TextStyle(
        fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black),
  );
}
