import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_data.dart';
import '../../core/app_text_styles.dart';
import '../../core/breakpoints.dart';
import '../../models/experience_item.dart';
import '../common/glass_card.dart';
import '../common/reveal_on_scroll.dart';
import '../common/section_shell.dart';

class ExperienceSection extends StatelessWidget {
  final Key sectionKey;
  const ExperienceSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      sectionKey: sectionKey,
      tint: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RevealOnScroll(
            child: SectionHeading(
              index: '02',
              kicker: 'Experience',
              title: 'Where I\u2019ve made an impact',
              subtitle:
                  'From shipping production apps to leading a team and owning '
                  'technical direction.',
            ),
          ),
          const SizedBox(height: 48),
          for (int i = 0; i < AppData.experience.length; i++)
            RevealOnScroll(
              delay: Duration(milliseconds: i * 130),
              child: _ExperienceRow(
                item: AppData.experience[i],
                isLast: i == AppData.experience.length - 1,
              ),
            ),
        ],
      ),
    );
  }
}

class _ExperienceRow extends StatelessWidget {
  final ExperienceItem item;
  final bool isLast;

  const _ExperienceRow({required this.item, required this.isLast});

  @override
  Widget build(BuildContext context) {
    final isMobile = Breakpoints.isMobile(context);

    final timeline = Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: item.isCurrent ? AppColors.accentSoft : AppColors.surfaceElevated,
            border: Border.all(
              color: item.isCurrent ? AppColors.accent : AppColors.border,
              width: 1.4,
            ),
          ),
          child: Icon(
            item.isCurrent ? Icons.workspace_premium_rounded : Icons.work_outline_rounded,
            size: 18,
            color: item.isCurrent ? AppColors.accentBright : AppColors.textMuted,
          ),
        ),
        if (!isLast)
          Expanded(
            child: Container(
              width: 1.4,
              margin: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.border, AppColors.border.withOpacity(0.2)],
                ),
              ),
            ),
          ),
      ],
    );

    final card = Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 32),
      child: GlassCard(
        hoverLift: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 12,
              runSpacing: 8,
              children: [
                Text(
                  item.role,
                  style: AppTextStyles.heading(size: isMobile ? 18 : 20, weight: FontWeight.w700),
                ),
                if (item.isCurrent)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.accentSoft,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.accent.withOpacity(0.4)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(color: AppColors.accentBright, shape: BoxShape.circle),
                        ),
                        const SizedBox(width: 6),
                        Text('CURRENT', style: AppTextStyles.mono(size: 10, color: AppColors.accentBright)),
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              runSpacing: 4,
              children: [
                Text(
                  item.company,
                  style: AppTextStyles.body(size: 14, weight: FontWeight.w700, color: AppColors.accentBright),
                ),
                if (!isMobile) ...[
                  Container(width: 4, height: 4, decoration: const BoxDecoration(color: AppColors.textMuted, shape: BoxShape.circle)),
                ],
                Text(item.period, style: AppTextStyles.mono(size: 11.5, color: AppColors.textMuted)),
              ],
            ),
            const SizedBox(height: 16),
            Text(item.summary, style: AppTextStyles.body(size: 15, height: 1.7)),
            const SizedBox(height: 18),
            Container(height: 1, color: AppColors.borderSubtle),
            const SizedBox(height: 18),
            for (final h in item.highlights)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Icon(Icons.arrow_right_rounded, size: 18, color: AppColors.accent),
                    ),
                    const SizedBox(width: 4),
                    Expanded(child: Text(h, style: AppTextStyles.body(size: 14, height: 1.6))),
                  ],
                ),
              ),
          ],
        ),
      ),
    );

    if (isMobile) {
      return card;
    }

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 40, child: timeline),
          const SizedBox(width: 28),
          Expanded(child: card),
        ],
      ),
    );
  }
}
