import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Central place for the app's colors, spacing and text styles so every
/// screen stays visually consistent with the original wireframes.
class AppColors {
  AppColors._();

  static const Color primaryGreen = Color(0xFF3DDC64);
  static const Color primaryGreenDark = Color(0xFF17B04B);
  static const Color primaryBlue = Color(0xFF4E7CF6);
  static const Color headerPink = Color(0xFFFBD9E0);
  static const Color background = Color(0xFFF7F7F9);
  static const Color cardBorder = Color(0xFFE7E7EA);
  static const Color textDark = Color(0xFF262626);
  static const Color textGrey = Color(0xFF8B8B8E);
  static const Color star = Color(0xFF3DDC64);
}

class AppTextStyles {
  AppTextStyles._();

  static TextStyle _hand({
    double size = 16,
    FontWeight weight = FontWeight.w400,
    Color color = AppColors.textDark,
  }) =>
      GoogleFonts.patrickHand(
        fontSize: size,
        fontWeight: weight,
        color: color,
      );

  static TextStyle title(BuildContext context) => _hand(size: 22);
  static TextStyle heading(BuildContext context) => _hand(size: 20);
  static TextStyle body(BuildContext context) => _hand(size: 16, color: AppColors.textGrey);
  static TextStyle label(BuildContext context) => _hand(size: 16);
  static TextStyle small(BuildContext context) => _hand(size: 13, color: AppColors.textGrey);
}

ThemeData buildAppTheme() {
  final base = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryGreen,
      primary: AppColors.primaryGreen,
    ),
  );

  return base.copyWith(
    textTheme: GoogleFonts.patrickHandTextTheme(base.textTheme),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: AppColors.textDark),
      titleTextStyle: GoogleFonts.patrickHand(
        fontSize: 20,
        color: AppColors.textDark,
      ),
    ),
  );
}
