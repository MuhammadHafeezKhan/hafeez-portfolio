import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_colors.dart';

/// A premium glassmorphism card: translucent layered surface, soft blur,
/// a hairline border that brightens into a subtle accent-tinted glow on
/// hover, and a gentle lift + shadow — the "Linear/Vercel card" feel.
class GlassCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final VoidCallback? onTap;
  final bool hoverLift;
  final bool glowOnHover;

  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
    this.borderRadius = const BorderRadius.all(Radius.circular(24)),
    this.onTap,
    this.hoverLift = true,
    this.glowOnHover = true,
  });

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final content = ClipRRect(
      borderRadius: widget.borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 260),
          curve: Curves.easeOut,
          padding: widget.padding,
          decoration: BoxDecoration(
            color: _hovering
                ? AppColors.surfaceElevated.withOpacity(0.9)
                : AppColors.surface.withOpacity(0.6),
            borderRadius: widget.borderRadius,
            border: Border.all(
              color: _hovering ? AppColors.accent.withOpacity(0.4) : AppColors.border,
              width: 1,
            ),
          ),
          child: widget.child,
        ),
      ),
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: widget.onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 260),
          curve: Curves.easeOut,
          transform: (_hovering && widget.hoverLift)
              ? (Matrix4.identity()..translate(0.0, -5.0))
              : Matrix4.identity(),
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius,
            boxShadow: _hovering
                ? [
                    if (widget.glowOnHover)
                      BoxShadow(
                        color: AppColors.accent.withOpacity(0.14),
                        blurRadius: 36,
                        spreadRadius: -6,
                        offset: const Offset(0, 18),
                      ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.32),
                      blurRadius: 28,
                      offset: const Offset(0, 14),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.18),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
          ),
          child: content,
        ),
      ),
    );
  }
}
