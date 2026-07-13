import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Central typography. Headings use Space Grotesk for a premium,
/// slightly technical feel; body copy uses Inter for readability;
/// small labels/kickers use the bundled monospace font for a
/// developer-portfolio accent.
class AppTextStyles {
  AppTextStyles._();

  static TextStyle heading({
    double size = 48,
    FontWeight weight = FontWeight.w700,
    Color color = AppColors.textPrimary,
    double letterSpacing = -1.0,
    double? height,
  }) {
    return GoogleFonts.spaceGrotesk(
      fontSize: size,
      fontWeight: weight,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle body({
    double size = 16,
    FontWeight weight = FontWeight.w400,
    Color color = AppColors.textSecondary,
    double? height,
  }) {
    return GoogleFonts.inter(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height ?? 1.6,
    );
  }

  static TextStyle mono({
    double size = 12,
    FontWeight weight = FontWeight.w600,
    Color color = AppColors.accent,
    double letterSpacing = 1.5,
  }) {
    return TextStyle(
      fontFamily: 'sfmono',
      fontSize: size,
      fontWeight: weight,
      color: color,
      letterSpacing: letterSpacing,
    );
  }
}
