import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/app_colors.dart';

class SocialIconButton extends StatefulWidget {
  final String assetPath;
  final VoidCallback onTap;
  final String tooltip;
  final double size;

  const SocialIconButton({
    super.key,
    required this.assetPath,
    required this.onTap,
    required this.tooltip,
    this.size = 40,
  });

  @override
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovering = true),
        onExit: (_) => setState(() => _hovering = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _hovering ? AppColors.surfaceElevated : AppColors.surface,
              border: Border.all(
                color: _hovering ? AppColors.accent : AppColors.border,
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              widget.assetPath,
              color: _hovering ? AppColors.accentBright : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
