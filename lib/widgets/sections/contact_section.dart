import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/app_colors.dart';
import '../../core/app_data.dart';
import '../../core/app_text_styles.dart';
import '../../core/breakpoints.dart';
import '../../core/launch_utils.dart';
import '../common/app_buttons.dart';
import '../common/floating_orb.dart';
import '../common/glass_card.dart';
import '../common/reveal_on_scroll.dart';
import '../common/section_shell.dart';
import '../common/social_icon_button.dart';

class ContactSection extends StatelessWidget {
  final Key sectionKey;
  const ContactSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final isMobile = Breakpoints.isMobile(context);

    return SectionShell(
      sectionKey: sectionKey,
      child: RevealOnScroll(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -80,
                  left: 40,
                  child: FloatingOrb(size: 260, color: AppColors.accent.withOpacity(0.14)),
                ),
                Positioned(
                  bottom: -80,
                  right: 20,
                  child: FloatingOrb(
                    size: 220,
                    color: AppColors.secondary.withOpacity(0.12),
                    duration: const Duration(seconds: 11),
                  ),
                ),
                GlassCard(
                  hoverLift: false,
                  glowOnHover: false,
                  padding: EdgeInsets.all(isMobile ? 30 : 52),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                        decoration: BoxDecoration(
                          color: AppColors.accentSoft,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text('LET\u2019S WORK TOGETHER', style: AppTextStyles.mono()),
                      ),
                      const SizedBox(height: 22),
                      Text(
                        'Have a product that needs to ship?',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.heading(size: isMobile ? 27 : 38),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        'I\u2019m open to conversations about senior Flutter roles, '
                        'production mobile apps, and team-lead opportunities.',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.body(size: 15.5, height: 1.7),
                      ),
                      const SizedBox(height: 34),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 14,
                        runSpacing: 14,
                        children: [
                          PrimaryButton(
                            label: 'Email me',
                            icon: Icons.arrow_outward_rounded,
                            onPressed: () => LaunchUtils.openEmail(
                              subject: 'Let\u2019s work together',
                            ),
                          ),
                          OutlineButton(
                            label: 'WhatsApp',
                            icon: Icons.chat_bubble_outline_rounded,
                            onPressed: LaunchUtils.openWhatsApp,
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Container(height: 1, color: AppColors.borderSubtle),
                      const SizedBox(height: 30),
                      Wrap(
                        alignment: WrapAlignment.center,
                        runSpacing: 16,
                        spacing: 32,
                        children: [
                          _CopyableDetail(icon: Icons.mail_outline_rounded, label: AppData.email),
                          _ContactDetail(icon: Icons.call_outlined, label: AppData.phone),
                          _ContactDetail(icon: Icons.location_on_outlined, label: AppData.location),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialIconButton(
                            assetPath: 'assets/icons/github.svg',
                            tooltip: 'GitHub',
                            onTap: () => LaunchUtils.openUrl(AppData.githubUrl),
                          ),
                          const SizedBox(width: 14),
                          SocialIconButton(
                            assetPath: 'assets/icons/linkedIn.svg',
                            tooltip: 'LinkedIn',
                            onTap: () => LaunchUtils.openUrl(AppData.linkedinUrl),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactDetail extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ContactDetail({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: AppColors.accentBright),
        const SizedBox(width: 8),
        Text(label, style: AppTextStyles.body(size: 13.5, color: AppColors.textSecondary)),
      ],
    );
  }
}

class _CopyableDetail extends StatefulWidget {
  final IconData icon;
  final String label;
  const _CopyableDetail({required this.icon, required this.label});

  @override
  State<_CopyableDetail> createState() => _CopyableDetailState();
}

class _CopyableDetailState extends State<_CopyableDetail> {
  bool _copied = false;

  Future<void> _copy() async {
    await Clipboard.setData(ClipboardData(text: widget.label));
    setState(() => _copied = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _copied = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: _copied ? 'Copied!' : 'Click to copy',
      child: GestureDetector(
        onTap: _copy,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(_copied ? Icons.check_circle_rounded : widget.icon, size: 16, color: AppColors.accentBright),
              const SizedBox(width: 8),
              Text(
                _copied ? 'Copied to clipboard' : widget.label,
                style: AppTextStyles.body(size: 13.5, color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
