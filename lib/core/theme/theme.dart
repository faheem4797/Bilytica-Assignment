import 'package:bilytica_assignment/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPallete.kWhiteColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppPallete.kPrimaryColor,
    ),
    textTheme: GoogleFonts.montserratTextTheme(),
  );
}
