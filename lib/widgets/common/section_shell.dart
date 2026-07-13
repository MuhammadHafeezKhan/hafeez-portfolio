import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_text_styles.dart';
import '../../core/breakpoints.dart';

/// Wraps section content with consistent max-width + responsive padding.
/// Alternating [tint] creates a very subtle rhythm between sections so the
/// page doesn't read as one flat, undifferentiated slab of dark background.
class SectionShell extends StatelessWidget {
  final Widget child;
  final Key? sectionKey;
  final bool tint;
  final bool topBorder;

  const SectionShell({
    super.key,
    this.sectionKey,
    required this.child,
    this.tint = false,
    this.topBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    final hPad = Breakpoints.horizontalPadding(context);
    final isMobile = Breakpoints.isMobile(context);
    return Container(
      key: sectionKey,
      width: double.infinity,
      decoration: BoxDecoration(
        color: tint ? AppColors.backgroundAlt : AppColors.background,
        border: topBorder
            ? const Border(top: BorderSide(color: AppColors.borderSubtle))
            : null,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: hPad,
        vertical: isMobile ? 60 : 110,
      ),
      child: child,
    );
  }
}

/// The small monospace "kicker" label + big heading used at the top of
/// every section (e.g. "EXPERIENCE" / "Where I've made an impact"), with
/// an optional numbered index badge for a premium editorial feel.
class SectionHeading extends StatelessWidget {
  final String kicker;
  final String title;
  final String? subtitle;
  final String? index;
  final CrossAxisAlignment alignment;

  const SectionHeading({
    super.key,
    required this.kicker,
    required this.title,
    this.subtitle,
    this.index,
    this.alignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Breakpoints.isMobile(context);
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (index != null) ...[
              Text(index!, style: AppTextStyles.mono(size: 11, color: AppColors.textMuted)),
              const SizedBox(width: 10),
              Container(width: 1, height: 12, color: AppColors.borderStrong),
              const SizedBox(width: 10),
            ] else
              Container(
                width: 24,
                height: 2,
                color: AppColors.accent,
                margin: const EdgeInsets.only(right: 10),
              ),
            Text(kicker.toUpperCase(), style: AppTextStyles.mono()),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: AppTextStyles.heading(size: isMobile ? 30 : 42),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 620),
            child: Text(subtitle!, style: AppTextStyles.body(size: 16.5)),
          ),
        ],
      ],
    );
  }
}
