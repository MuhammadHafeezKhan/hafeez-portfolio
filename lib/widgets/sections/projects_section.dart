import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_data.dart';
import '../../core/app_text_styles.dart';
import '../../core/breakpoints.dart';
import '../common/reveal_on_scroll.dart';
import '../common/section_shell.dart';
import 'project_card.dart';
import 'project_detail_dialog.dart';

class ProjectsSection extends StatelessWidget {
  final Key sectionKey;
  const ProjectsSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final deviceType = Breakpoints.deviceTypeOf(context);
    final columns = deviceType == DeviceType.desktop
        ? 3
        : deviceType == DeviceType.tablet
            ? 2
            : 1;

    return SectionShell(
      sectionKey: sectionKey,
      tint: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RevealOnScroll(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Expanded(
                  child: SectionHeading(
                    index: '04',
                    kicker: 'Projects',
                    title: 'Selected work',
                    subtitle:
                        'Production apps I\u2019ve built end to end — tap any card '
                        'for the full breakdown.',
                  ),
                ),
                if (!Breakpoints.isMobile(context))
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      '${AppData.projects.length} PROJECTS',
                      style: AppTextStyles.mono(size: 11, color: AppColors.textMuted),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 44),
          LayoutBuilder(
            builder: (context, constraints) {
              const spacing = 24.0;
              final cardWidth = (constraints.maxWidth - spacing * (columns - 1)) / columns;
              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: [
                  for (int i = 0; i < AppData.projects.length; i++)
                    SizedBox(
                      width: cardWidth,
                      child: RevealOnScroll(
                        delay: Duration(milliseconds: (i % columns) * 110),
                        child: ProjectCard(
                          project: AppData.projects[i],
                          onOpenDetails: () =>
                              showProjectDetailDialog(context, AppData.projects[i]),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
