import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/app_data.dart';
import '../core/app_text_styles.dart';
import '../core/breakpoints.dart';
import 'common/app_buttons.dart';

class NavBar extends StatelessWidget {
  final List<String> sectionLabels;
  final void Function(int index) onNavTap;
  final VoidCallback onResumeTap;
  final VoidCallback? onMenuTap;
  final bool scrolled;
  final int activeIndex;

  const NavBar({
    super.key,
    required this.sectionLabels,
    required this.onNavTap,
    required this.onResumeTap,
    this.onMenuTap,
    this.scrolled = false,
    this.activeIndex = -1,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = Breakpoints.isDesktop(context);
    final hPad = Breakpoints.horizontalPadding(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 260),
      height: 76,
      padding: EdgeInsets.symmetric(horizontal: hPad),
      decoration: BoxDecoration(
        color: scrolled ? AppColors.background.withOpacity(0.88) : AppColors.background.withOpacity(0.4),
        border: Border(
          bottom: BorderSide(color: scrolled ? AppColors.border : Colors.transparent),
        ),
        boxShadow: scrolled
            ? [BoxShadow(color: Colors.black.withOpacity(0.24), blurRadius: 20, offset: const Offset(0, 8))]
            : [],
      ),
      child: Row(
        children: [
          // Logo
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: AppData.initials,
                  style: AppTextStyles.heading(
                    size: 22,
                    weight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ),
                TextSpan(
                  text: '.',
                  style: AppTextStyles.heading(
                    size: 22,
                    weight: FontWeight.w800,
                    color: AppColors.accent,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          if (isDesktop) ...[
            for (int i = 0; i < sectionLabels.length; i++)
              _NavLink(
                label: sectionLabels[i],
                active: i == activeIndex,
                onTap: () => onNavTap(i),
              ),
            const SizedBox(width: 16),
            PrimaryButton(label: 'Resume', onPressed: onResumeTap),
          ] else
            IconButton(
              onPressed: onMenuTap,
              icon: const Icon(Icons.menu_rounded, color: AppColors.textPrimary),
            ),
        ],
      ),
    );
  }
}

class _NavBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  _NavBarDelegate({required this.child});

  @override
  double get minExtent => 76;
  @override
  double get maxExtent => 76;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(covariant _NavBarDelegate oldDelegate) {
    return true; // Simple for now to ensure reactive updates
  }
}

class SliverNavBar extends StatelessWidget {
  final List<String> sectionLabels;
  final void Function(int index) onNavTap;
  final VoidCallback onResumeTap;
  final VoidCallback? onMenuTap;
  final bool scrolled;
  final int activeIndex;

  const SliverNavBar({
    super.key,
    required this.sectionLabels,
    required this.onNavTap,
    required this.onResumeTap,
    this.onMenuTap,
    this.scrolled = false,
    this.activeIndex = -1,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _NavBarDelegate(
        child: NavBar(
          sectionLabels: sectionLabels,
          onNavTap: onNavTap,
          onResumeTap: onResumeTap,
          onMenuTap: onMenuTap,
          scrolled: scrolled,
          activeIndex: activeIndex,
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _NavLink({required this.label, required this.active, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final highlighted = _hovering || widget.active;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: AppTextStyles.body(
              size: 14,
              weight: FontWeight.w600,
              color: highlighted ? AppColors.accentBright : AppColors.textSecondary,
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}

/// Mobile navigation drawer.
class MobileNavDrawer extends StatelessWidget {
  final List<String> sectionLabels;
  final void Function(int index) onNavTap;
  final VoidCallback onResumeTap;

  const MobileNavDrawer({
    super.key,
    required this.sectionLabels,
    required this.onNavTap,
    required this.onResumeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${AppData.initials}.', style: AppTextStyles.heading(size: 28)),
              const SizedBox(height: 40),
              for (int i = 0; i < sectionLabels.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      onNavTap(i);
                    },
                    child: Row(
                      children: [
                        Text(
                          '0${i + 1}',
                          style: AppTextStyles.mono(size: 12, color: AppColors.accent),
                        ),
                        const SizedBox(width: 14),
                        Text(
                          sectionLabels[i],
                          style: AppTextStyles.body(size: 19, color: AppColors.textPrimary),
                        ),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 28),
              PrimaryButton(
                label: 'Resume',
                onPressed: () {
                  Navigator.of(context).pop();
                  onResumeTap();
                },
              ),
              const Spacer(),
              Container(height: 1, color: AppColors.borderSubtle),
              const SizedBox(height: 18),
              Text(
                '${AppData.name} · ${AppData.location}',
                style: AppTextStyles.mono(size: 10, color: AppColors.textMuted),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
