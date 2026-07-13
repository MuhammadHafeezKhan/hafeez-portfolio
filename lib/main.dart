import 'package:flutter/material.dart';
import 'core/app_colors.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hafeez Khan — Senior Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.accent,
          brightness: Brightness.dark,
          primary: AppColors.accent,
          surface: AppColors.surface,
        ),
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.accent,
          selectionColor: AppColors.accent.withOpacity(0.25),
          selectionHandleColor: AppColors.accent,
        ),
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(AppColors.border),
          trackColor: MaterialStateProperty.all(Colors.transparent),
          interactive: true,
        ),
      ),
      home: const HomePage(),
    );
  }
}
