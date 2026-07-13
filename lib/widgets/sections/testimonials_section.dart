import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_data.dart';
import '../../core/app_text_styles.dart';
import '../common/glass_card.dart';
import '../common/reveal_on_scroll.dart';
import '../common/section_shell.dart';

class TestimonialsSection extends StatelessWidget {
  final Key sectionKey;
  const TestimonialsSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      sectionKey: sectionKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RevealOnScroll(
            child: SectionHeading(
              index: '07',
              kicker: 'Testimonials',
              title: 'What people say',
            ),
          ),
          const SizedBox(height: 32),
          RevealOnScroll(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: GlassCard(
                hoverLift: false,
                glowOnHover: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.format_quote_rounded, color: AppColors.accent, size: 28),
                    const SizedBox(height: 12),
                    Text(
                      AppData.testimonials.first.quote,
                      style: AppTextStyles.body(size: 15.5, height: 1.7),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppData.testimonials.first.role,
                      style: AppTextStyles.mono(size: 11, color: AppColors.textMuted),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
