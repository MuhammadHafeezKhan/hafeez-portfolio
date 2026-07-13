import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_text_styles.dart';
import '../../core/launch_utils.dart';
import '../../models/project.dart';
import '../common/app_buttons.dart';

void showProjectDetailDialog(BuildContext context, Project project) {
  showGeneralDialog(
    context: context,
    barrierLabel: project.name,
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.55),
    transitionDuration: const Duration(milliseconds: 260),
    pageBuilder: (context, anim1, anim2) {
      final width = MediaQuery.of(context).size.width;
      final dialogWidth = width > 700 ? 660.0 : width * 0.92;

      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: dialogWidth, maxHeight: MediaQuery.of(context).size.height * 0.86),
            child: Material(
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: AppColors.border),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 40, offset: const Offset(0, 20))],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Image.asset(project.image, fit: BoxFit.cover),
                          ),
                        ),
                        Positioned(
                          top: 14,
                          right: 14,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Container(
                                width: 34,
                                height: 34,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.background.withOpacity(0.6),
                                  border: Border.all(color: AppColors.border),
                                ),
                                child: const Icon(Icons.close_rounded, size: 17, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(project.name, style: AppTextStyles.heading(size: 26)),
                            const SizedBox(height: 6),
                            Text(
                              project.category,
                              style: AppTextStyles.body(size: 14, weight: FontWeight.w600, color: AppColors.accentBright),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(child: _MiniStat(label: 'ROLE', value: project.role)),
                                Expanded(child: _MiniStat(label: 'IMPACT', value: project.impact)),
                              ],
                            ),
                            const SizedBox(height: 22),
                            Text(project.description, style: AppTextStyles.body(size: 15, height: 1.7)),
                            const SizedBox(height: 22),
                            Text('Highlights', style: AppTextStyles.heading(size: 15, weight: FontWeight.w700)),
                            const SizedBox(height: 12),
                            for (final h in project.highlights)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Icon(Icons.arrow_right_rounded, size: 18, color: AppColors.accent),
                                    ),
                                    const SizedBox(width: 4),
                                    Expanded(child: Text(h, style: AppTextStyles.body(size: 14, height: 1.6))),
                                  ],
                                ),
                              ),
                            const SizedBox(height: 18),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                for (final tech in project.techs)
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: AppColors.surfaceElevated,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: AppColors.borderSubtle),
                                    ),
                                    child: Text(tech, style: AppTextStyles.mono(size: 11, color: AppColors.textSecondary)),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 26),
                            Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              children: [
                                if (project.androidLink != null)
                                  OutlineButton(label: 'Play Store', icon: Icons.android_rounded, onPressed: () => LaunchUtils.openUrl(project.androidLink!)),
                                if (project.iosLink != null)
                                  OutlineButton(label: 'App Store', icon: Icons.apple_rounded, onPressed: () => LaunchUtils.openUrl(project.iosLink!)),
                                if (project.githubLink != null)
                                  OutlineButton(label: 'GitHub', icon: Icons.code_rounded, onPressed: () => LaunchUtils.openUrl(project.githubLink!)),
                                if (project.liveLink != null)
                                  OutlineButton(label: 'Live Demo', icon: Icons.open_in_new_rounded, onPressed: () => LaunchUtils.openUrl(project.liveLink!)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
      return FadeTransition(
        opacity: curved,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.96, end: 1.0).animate(curved),
          child: child,
        ),
      );
    },
  );
}

class _MiniStat extends StatelessWidget {
  final String label;
  final String value;
  const _MiniStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.mono(size: 10, color: AppColors.textMuted)),
        const SizedBox(height: 4),
        Text(value, style: AppTextStyles.body(size: 14, weight: FontWeight.w600, color: AppColors.textPrimary)),
      ],
    );
  }
}
