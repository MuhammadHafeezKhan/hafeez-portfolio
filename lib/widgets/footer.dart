import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/app_data.dart';
import '../core/app_text_styles.dart';
import '../core/breakpoints.dart';
import '../core/launch_utils.dart';
import 'common/social_icon_button.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final hPad = Breakpoints.horizontalPadding(context);
    final isMobile = Breakpoints.isMobile(context);
    final year = DateTime.now().year;

    final brand = Text.rich(
      TextSpan(
        children: [
          TextSpan(text: AppData.initials, style: AppTextStyles.heading(size: 16, weight: FontWeight.w800)),
          TextSpan(text: '.', style: AppTextStyles.heading(size: 16, weight: FontWeight.w800, color: AppColors.accent)),
          TextSpan(
            text: '  \u00A9 $year ${AppData.name}',
            style: AppTextStyles.body(size: 13, color: AppColors.textMuted),
          ),
        ],
      ),
    );

    final builtWith = Text(
      'Built with Flutter',
      style: AppTextStyles.mono(size: 10.5, color: AppColors.textMuted),
    );

    final socials = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SocialIconButton(
          assetPath: 'assets/icons/github.svg',
          tooltip: 'GitHub',
          size: 34,
          onTap: () => LaunchUtils.openUrl(AppData.githubUrl),
        ),
        const SizedBox(width: 10),
        SocialIconButton(
          assetPath: 'assets/icons/linkedIn.svg',
          tooltip: 'LinkedIn',
          size: 34,
          onTap: () => LaunchUtils.openUrl(AppData.linkedinUrl),
        ),
      ],
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 30),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.borderSubtle)),
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                brand,
                const SizedBox(height: 14),
                socials,
                const SizedBox(height: 14),
                builtWith,
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                brand,
                socials,
                builtWith,
              ],
            ),
    );
  }
}
