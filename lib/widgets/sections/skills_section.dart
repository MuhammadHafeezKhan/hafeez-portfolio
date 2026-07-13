import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_data.dart';
import '../../core/app_text_styles.dart';
import '../../core/breakpoints.dart';
import '../../models/skill_item.dart';
import '../common/reveal_on_scroll.dart';
import '../common/section_shell.dart';

class SkillsSection extends StatelessWidget {
  final Key sectionKey;
  const SkillsSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Breakpoints.isDesktop(context);

    final grouped = <String, List<TechItem>>{};
    for (final tech in AppData.techStack) {
      grouped.putIfAbsent(tech.category, () => []).add(tech);
    }

    final ratedColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < AppData.ratedSkills.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: RevealOnScroll(
              delay: Duration(milliseconds: i * 60),
              child: _SkillBar(skill: AppData.ratedSkills[i]),
            ),
          ),
      ],
    );

    final techGroups = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final entry in grouped.entries)
          Padding(
            padding: const EdgeInsets.only(bottom: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.key.toUpperCase(),
                  style: AppTextStyles.mono(size: 10.5, color: AppColors.textMuted, letterSpacing: 1.6),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [for (final tech in entry.value) _TechChip(tech: tech)],
                ),
              ],
            ),
          ),
      ],
    );

    return SectionShell(
      sectionKey: sectionKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RevealOnScroll(
            child: SectionHeading(
              index: '03',
              kicker: 'Skills',
              title: 'A practical, production-tested toolkit',
              subtitle:
                  'Skills sharpened across real apps — not just what\u2019s on paper.',
            ),
          ),
          const SizedBox(height: 48),
          isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 5, child: ratedColumn),
                    const SizedBox(width: 64),
                    Expanded(flex: 6, child: techGroups),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ratedColumn,
                    const SizedBox(height: 20),
                    techGroups,
                  ],
                ),
        ],
      ),
    );
  }
}

class _SkillBar extends StatefulWidget {
  final RatedSkill skill;
  const _SkillBar({required this.skill});

  @override
  State<_SkillBar> createState() => _SkillBarState();
}

class _SkillBarState extends State<_SkillBar> {
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) setState(() => _progress = widget.skill.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                widget.skill.name,
                style: AppTextStyles.body(size: 14, weight: FontWeight.w600, color: AppColors.textPrimary),
              ),
            ),
            Text(
              '${(widget.skill.value * 100).round()}%',
              style: AppTextStyles.mono(size: 12, color: AppColors.accentBright),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 7,
              color: AppColors.surfaceElevated,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeOutCubic,
                  tween: Tween(begin: 0, end: _progress),
                  builder: (context, value, child) {
                    return FractionallySizedBox(widthFactor: value, child: child);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: AppColors.accentGradient,
                      boxShadow: [
                        BoxShadow(color: AppColors.accent.withOpacity(0.5), blurRadius: 8, spreadRadius: -1),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TechChip extends StatefulWidget {
  final TechItem tech;
  const _TechChip({required this.tech});

  @override
  State<_TechChip> createState() => _TechChipState();
}

class _TechChipState extends State<_TechChip> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
        transform: Matrix4.identity()..translate(0.0, _hovering ? -2.0 : 0.0),
        decoration: BoxDecoration(
          color: _hovering ? AppColors.surfaceElevated : AppColors.surface,
          borderRadius: BorderRadius.circular(11),
          border: Border.all(color: _hovering ? AppColors.accent.withOpacity(0.45) : AppColors.border),
          boxShadow: _hovering
              ? [BoxShadow(color: AppColors.accent.withOpacity(0.14), blurRadius: 16, offset: const Offset(0, 6))]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.tech.image != null)
              Image.asset(widget.tech.image!, width: 18, height: 18, fit: BoxFit.contain)
            else
              Icon(widget.tech.icon, size: 18, color: AppColors.accentBright),
            const SizedBox(width: 9),
            Text(widget.tech.name, style: AppTextStyles.body(size: 13, color: AppColors.textPrimary)),
          ],
        ),
      ),
    );
  }
}
