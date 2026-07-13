import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_text_styles.dart';
import '../../core/launch_utils.dart';
import '../../models/project.dart';
import '../common/glass_card.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  final VoidCallback onOpenDetails;

  const ProjectCard({
    super.key,
    required this.project,
    required this.onOpenDetails,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final project = widget.project;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GlassCard(
        padding: EdgeInsets.zero,
        onTap: widget.onOpenDetails,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(19)),
                  child: AspectRatio(
                    aspectRatio: 16 / 10,
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 320),
                      curve: Curves.easeOut,
                      scale: _hovering ? 1.06 : 1.0,
                      child: Image.asset(project.image, fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(19)),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.02),
                            Colors.black.withOpacity(0.55),
                          ],
                          stops: const [0.4, 1.0],
                        ),
                      ),
                    ),
                  ),
                ),
                if (project.isFeatured)
                  Positioned(
                    top: 14,
                    left: 14,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.background.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.tertiary.withOpacity(0.4)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star_rounded, size: 12, color: AppColors.tertiary),
                          const SizedBox(width: 4),
                          Text('FEATURED', style: AppTextStyles.mono(size: 9, color: AppColors.tertiary)),
                        ],
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 12,
                  left: 16,
                  right: 16,
                  child: Text(
                    project.category,
                    style: AppTextStyles.mono(size: 10.5, color: Colors.white.withOpacity(0.85), letterSpacing: 1.2),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          project.name,
                          style: AppTextStyles.heading(size: 19, weight: FontWeight.w700),
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 220),
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _hovering ? AppColors.accent : AppColors.surfaceElevated,
                          border: Border.all(color: _hovering ? AppColors.accent : AppColors.border),
                        ),
                        child: AnimatedRotation(
                          duration: const Duration(milliseconds: 220),
                          turns: _hovering ? 0.125 : 0,
                          child: Icon(
                            Icons.arrow_outward_rounded,
                            size: 15,
                            color: _hovering ? AppColors.background : AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    project.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.body(size: 13.5, height: 1.6),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final tech in project.techs.take(3))
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceElevated,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.borderSubtle),
                          ),
                          child: Text(
                            tech,
                            style: AppTextStyles.mono(size: 10.5, color: AppColors.textSecondary, letterSpacing: 0.4),
                          ),
                        ),
                      if (project.techs.length > 3)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '+${project.techs.length - 3}',
                            style: AppTextStyles.mono(size: 10.5, color: AppColors.textMuted),
                          ),
                        ),
                    ],
                  ),
                  if (project.androidLink != null || project.iosLink != null || project.githubLink != null || project.liveLink != null) ...[
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        _linkIcon(project.androidLink, Icons.android_rounded),
                        _linkIcon(project.iosLink, Icons.apple_rounded),
                        _linkIcon(project.githubLink, Icons.code_rounded),
                        _linkIcon(project.liveLink, Icons.open_in_new_rounded),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _linkIcon(String? url, IconData icon) {
    if (url == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: GestureDetector(
        onTap: () => LaunchUtils.openUrl(url),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Icon(icon, size: 18, color: AppColors.textMuted),
        ),
      ),
    );
  }
}
