import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_text_styles.dart';
import '../../core/breakpoints.dart';
import '../common/reveal_on_scroll.dart';
import '../common/section_shell.dart';

/// A structurally-ready but empty section — used for "Open Source" and
/// "Writing" until real content is added to `AppData`. Once items exist
/// in `AppData.openSourcePackages` / `AppData.writingPosts`, replace the
/// body of this widget's usage with a real grid (the layout scaffolding
/// for that already exists in ProjectsSection as a reference pattern).
class ComingSoonSection extends StatelessWidget {
  final Key sectionKey;
  final String index;
  final String kicker;
  final String title;
  final String message;
  final IconData icon;
  final bool tint;

  const ComingSoonSection({
    super.key,
    required this.sectionKey,
    required this.index,
    required this.kicker,
    required this.title,
    required this.message,
    required this.icon,
    this.tint = false,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Breakpoints.isMobile(context);
    return SectionShell(
      sectionKey: sectionKey,
      tint: tint,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RevealOnScroll(
            child: SectionHeading(index: index, kicker: kicker, title: title),
          ),
          const SizedBox(height: 32),
          RevealOnScroll(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: isMobile ? 44 : 60, horizontal: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.border),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.surface.withOpacity(0.5), AppColors.surface.withOpacity(0.2)],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.accentSoft,
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Icon(icon, size: 24, color: AppColors.accentBright),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body(size: 14, color: AppColors.textMuted, height: 1.6),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
