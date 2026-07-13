import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_data.dart';
import '../../core/app_text_styles.dart';
import '../../core/breakpoints.dart';
import '../common/glass_card.dart';
import '../common/reveal_on_scroll.dart';
import '../common/section_shell.dart';

class AboutSection extends StatelessWidget {
  final Key sectionKey;
  const AboutSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Breakpoints.isDesktop(context);
    final isMobile = Breakpoints.isMobile(context);

    final stats = Wrap(
      spacing: 36,
      runSpacing: 20,
      children: [
        _StatBlock(value: AppData.yearsExperience, label: 'YEARS EXPERIENCE'),
        const _StatBlock(value: '15+', label: 'PROJECTS SHIPPED'),
        const _StatBlock(value: '2', label: 'TEAMS LED'),
      ],
    );

    final textContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RevealOnScroll(
          child: const SectionHeading(
            index: '01',
            kicker: 'About',
            title: 'Building apps people actually enjoy using',
          ),
        ),
        const SizedBox(height: 26),
        RevealOnScroll(
          delay: const Duration(milliseconds: 80),
          child: Text(AppData.aboutParagraph1, style: AppTextStyles.body(size: 16, height: 1.75)),
        ),
        const SizedBox(height: 16),
        RevealOnScroll(
          delay: const Duration(milliseconds: 140),
          child: Text(AppData.aboutParagraph2, style: AppTextStyles.body(size: 16, height: 1.75)),
        ),
        const SizedBox(height: 32),
        RevealOnScroll(delay: const Duration(milliseconds: 200), child: stats),
      ],
    );

    final focusCard = GlassCard(
      hoverLift: false,
      glowOnHover: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: AppColors.accentSoft,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: const Icon(Icons.bolt_rounded, color: AppColors.accentBright, size: 18),
              ),
              const SizedBox(width: 12),
              Text('Focus areas', style: AppTextStyles.heading(size: 18, weight: FontWeight.w700)),
            ],
          ),
          const SizedBox(height: 20),
          for (final area in AppData.aboutFocusAreas)
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(color: AppColors.accent, shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(area, style: AppTextStyles.body(size: 14.5)),
                  ),
                ],
              ),
            ),
        ],
      ),
    );

    final terminalCard = _TerminalCard();

    final rightColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        focusCard,
        const SizedBox(height: 20),
        terminalCard,
      ],
    );

    return SectionShell(
      sectionKey: sectionKey,
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 6, child: textContent),
                const SizedBox(width: 56),
                Expanded(
                  flex: 5,
                  child: RevealOnScroll(delay: const Duration(milliseconds: 120), child: rightColumn),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textContent,
                SizedBox(height: isMobile ? 32 : 40),
                RevealOnScroll(child: rightColumn),
              ],
            ),
    );
  }
}

class _StatBlock extends StatelessWidget {
  final String value;
  final String label;
  const _StatBlock({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => AppColors.accentGradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: Text(
            value,
            style: AppTextStyles.heading(size: 32, weight: FontWeight.w800, color: Colors.white),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: AppTextStyles.mono(size: 10, color: AppColors.textMuted)),
      ],
    );
  }
}

/// A small decorative "terminal window" card — a bit of developer
/// personality that signals craft without being gimmicky.
class _TerminalCard extends StatefulWidget {
  @override
  State<_TerminalCard> createState() => _TerminalCardState();
}

class _TerminalCardState extends State<_TerminalCard> {
  static const List<String> _lines = [
    '\$ whoami',
    '> ${AppData.name} — Senior Flutter Developer',
    '\$ current_focus --list',
    '> Web3 · Real-time systems · Team leadership',
    '\$ status',
    '> Open to new opportunities ✓',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.borderSubtle)),
            ),
            child: Row(
              children: [
                _dot(AppColors.error),
                const SizedBox(width: 6),
                _dot(AppColors.tertiary),
                const SizedBox(width: 6),
                _dot(AppColors.success),
                const Spacer(),
                Text('hafeez.sh', style: AppTextStyles.mono(size: 10, color: AppColors.textMuted)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final line in _lines)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      line,
                      style: AppTextStyles.mono(
                        size: 12.5,
                        letterSpacing: 0,
                        color: line.startsWith('\$') ? AppColors.textSecondary : AppColors.accentBright,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dot(Color color) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: color.withOpacity(0.85), shape: BoxShape.circle),
    );
  }
}
