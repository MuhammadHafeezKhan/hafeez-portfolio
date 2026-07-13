// import 'package:flutter/material.dart';
//
// /// Central color system for the whole app.
// ///
// /// Redesigned around a *layered elevation* model (the way Linear, Vercel,
// /// and Raycast build dark UI): instead of one flat near-black, every raised
// /// surface gets progressively lighter, and borders are translucent white
// /// rather than a flat dark hex — which is what makes dark UIs feel
// /// "premium" instead of "just dark." Accent colors are derived from
// /// Hafeez's LinkedIn banner (sage green + steel blue) but brightened for
// /// better contrast against the lighter background.
// class AppColors {
//   AppColors._();
//
//   // ---------------------------------------------------------------------
//   // Elevation layers (each level sits visually "above" the last)
//   // ---------------------------------------------------------------------
//   static const Color background = Color(0xFF12151B); // base canvas
//   static const Color backgroundAlt = Color(0xFF15181F); // alt section tint
//   static const Color surface = Color(0xFF191D25); // level 1 (cards)
//   static const Color surfaceElevated = Color(0xFF20242E); // level 2 (hover/active cards)
//   static const Color surfaceHover = Color(0xFF272C37); // level 3 (chips on hover, inputs)
//
//   // ---------------------------------------------------------------------
//   // Borders — translucent white reads as "premium" on dark surfaces
//   // ---------------------------------------------------------------------
//   static const Color border = Color(0x1EFFFFFF); // ~12%
//   static const Color borderSubtle = Color(0x12FFFFFF); // ~7%
//   static const Color borderStrong = Color(0x33FFFFFF); // ~20%
//
//   // ---------------------------------------------------------------------
//   // Text
//   // ---------------------------------------------------------------------
//   static const Color textPrimary = Color(0xFFF3F5F7);
//   static const Color textSecondary = Color(0xFFAAB1BC);
//   static const Color textMuted = Color(0xFF747C88);
//
//   // ---------------------------------------------------------------------
//   // Accents (from the LinkedIn banner, brightened for the lighter bg)
//   // ---------------------------------------------------------------------
//   static const Color accent = Color(0xFF7FC8A5); // sage green
//   static const Color accentBright = Color(0xFFA7E6C6);
//   static const Color accentDeep = Color(0xFF4E8468);
//   static const Color accentSoft = Color(0x1E7FC8A5); // ~12% wash for chips/badges
//
//   static const Color secondary = Color(0xFF74A9CB); // steel blue
//   static const Color secondaryBright = Color(0xFF9FCBE4);
//   static const Color secondarySoft = Color(0x1E74A9CB);
//
//   // A third, quieter warm tone used sparingly for variety (project tags etc.)
//   static const Color tertiary = Color(0xFFCBAE7C);
//
//   // ---------------------------------------------------------------------
//   // Status
//   // ---------------------------------------------------------------------
//   static const Color success = Color(0xFF7FC8A5);
//   static const Color error = Color(0xFFE38C82);
//
//   // ---------------------------------------------------------------------
//   // Gradients
//   // ---------------------------------------------------------------------
//   static const LinearGradient accentGradient = LinearGradient(
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//     colors: [accent, secondary],
//   );
//
//   static const LinearGradient accentGradientSoft = LinearGradient(
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//     colors: [accentSoft, secondarySoft],
//   );
//
//   /// Used for the shimmering headline text treatment.
//   static const LinearGradient textShine = LinearGradient(
//     begin: Alignment(-1, 0),
//     end: Alignment(1, 0),
//     colors: [textPrimary, accentBright, textPrimary],
//     stops: [0.35, 0.5, 0.65],
//   );
//
//   static const RadialGradient heroGlowPrimary = RadialGradient(
//     center: Alignment(0.8, -0.5),
//     radius: 1.3,
//     colors: [Color(0x3D7FC8A5), Color(0x0012151B)],
//   );
//
//   static const RadialGradient heroGlowSecondary = RadialGradient(
//     center: Alignment(-0.85, 0.75),
//     radius: 1.15,
//     colors: [Color(0x2874A9CB), Color(0x0012151B)],
//   );
//
//   static const RadialGradient cardSpotlight = RadialGradient(
//     center: Alignment.topCenter,
//     radius: 1.1,
//     colors: [Color(0x147FC8A5), Color(0x0012151B)],
//   );
//
//   // Glow shadows for hover states — a soft accent-tinted lift.
//   static List<BoxShadow> glow({double opacity = 0.28, double blur = 32}) => [
//         BoxShadow(color: accent.withOpacity(opacity), blurRadius: blur, offset: const Offset(0, 10)),
//       ];
//
//   static List<BoxShadow> elevation({double opacity = 0.35, double blur = 24}) => [
//         BoxShadow(color: Colors.black.withOpacity(opacity), blurRadius: blur, offset: const Offset(0, 12)),
//       ];
// }
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ---------------------------------------------------------------------
  // Elevation layers
  // ---------------------------------------------------------------------

  static const Color background = Color(0xFF0D1117);
  static const Color backgroundAlt = Color(0xFF131A24);
  static const Color surface = Color(0xFF1A2230);
  static const Color surfaceElevated = Color(0xFF232E40);
  static const Color surfaceHover = Color(0xFF2E3A50);

  // ---------------------------------------------------------------------
  // Borders
  // ---------------------------------------------------------------------

  static const Color border = Color(0x1FFFFFFF);
  static const Color borderSubtle = Color(0x12FFFFFF);
  static const Color borderStrong = Color(0x33FFFFFF);

  // ---------------------------------------------------------------------
  // Text
  // ---------------------------------------------------------------------

  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFFCBD5E1);
  static const Color textMuted = Color(0xFF94A3B8);

  // ---------------------------------------------------------------------
  // Accent
  // ---------------------------------------------------------------------

  static const Color accent = Color(0xFF4DA3FF);
  static const Color accentBright = Color(0xFF74D8FF);
  static const Color accentDeep = Color(0xFF2B7DE9);
  static const Color accentSoft = Color(0x224DA3FF);

  static const Color secondary = Color(0xFF5B6EE1);
  static const Color secondaryBright = Color(0xFF8EA2FF);
  static const Color secondarySoft = Color(0x225B6EE1);

  // Highlight
  static const Color tertiary = Color(0xFFFFC857);

  // ---------------------------------------------------------------------
  // Status
  // ---------------------------------------------------------------------

  static const Color success = Color(0xFF22C55E);
  static const Color error = Color(0xFFFF5F6D);

  // ---------------------------------------------------------------------
  // Gradients
  // ---------------------------------------------------------------------

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      accent,
      secondary,
    ],
  );

  static const LinearGradient accentGradientSoft = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      accentSoft,
      secondarySoft,
    ],
  );

  static const LinearGradient textShine = LinearGradient(
    begin: Alignment(-1, 0),
    end: Alignment(1, 0),
    colors: [
      textPrimary,
      accentBright,
      textPrimary,
    ],
    stops: [
      0.35,
      0.5,
      0.65,
    ],
  );

  static const RadialGradient heroGlowPrimary = RadialGradient(
    center: Alignment(0.8, -0.5),
    radius: 1.3,
    colors: [
      Color(0x334DA3FF),
      Color(0x000D1117),
    ],
  );

  static const RadialGradient heroGlowSecondary = RadialGradient(
    center: Alignment(-0.85, 0.75),
    radius: 1.15,
    colors: [
      Color(0x225B6EE1),
      Color(0x000D1117),
    ],
  );

  static const RadialGradient cardSpotlight = RadialGradient(
    center: Alignment.topCenter,
    radius: 1.1,
    colors: [
      Color(0x184DA3FF),
      Color(0x000D1117),
    ],
  );

  // ---------------------------------------------------------------------
  // Shadows
  // ---------------------------------------------------------------------

  static List<BoxShadow> glow({
    double opacity = 0.30,
    double blur = 32,
  }) =>
      [
        BoxShadow(
          color: accent.withOpacity(opacity),
          blurRadius: blur,
          spreadRadius: 1,
          offset: const Offset(0, 10),
        ),
      ];

  static List<BoxShadow> elevation({
    double opacity = 0.35,
    double blur = 24,
  }) =>
      [
        BoxShadow(
          color: Colors.black.withOpacity(opacity),
          blurRadius: blur,
          offset: const Offset(0, 12),
        ),
      ];
}