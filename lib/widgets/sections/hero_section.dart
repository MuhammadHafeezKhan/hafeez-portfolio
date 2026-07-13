import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_data.dart';
import '../../core/app_text_styles.dart';
import '../../core/breakpoints.dart';
import '../common/app_buttons.dart';
import '../common/floating_orb.dart';
import '../common/social_icon_button.dart';

class HeroSection extends StatefulWidget {
  final Key sectionKey;
  final VoidCallback onViewWork;
  final VoidCallback onContact;
  final VoidCallback onGithub;
  final VoidCallback onLinkedin;
  final VoidCallback onScrollDown;

  const HeroSection({
    super.key,
    required this.sectionKey,
    required this.onViewWork,
    required this.onContact,
    required this.onGithub,
    required this.onLinkedin,
    required this.onScrollDown,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> with SingleTickerProviderStateMixin {
  late final AnimationController _entrance;

  @override
  void initState() {
    super.initState();
    _entrance = AnimationController(vsync: this, duration: const Duration(milliseconds: 900))..forward();
  }

  @override
  void dispose() {
    _entrance.dispose();
    super.dispose();
  }

  Widget _fadeUp(Widget child, {double delay = 0}) {
    final start = delay.clamp(0.0, 0.9);
    final anim = CurvedAnimation(
      parent: _entrance,
      curve: Interval(start, (start + 0.5).clamp(0.0, 1.0), curve: Curves.easeOutCubic),
    );
    return FadeTransition(
      opacity: anim,
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, 0.12), end: Offset.zero).animate(anim),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Breakpoints.isMobile(context);
    final isDesktop = Breakpoints.isDesktop(context);
    final hPad = Breakpoints.horizontalPadding(context);

    final textColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _fadeUp(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.surface.withOpacity(0.6),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _PulsingDot(),
                const SizedBox(width: 9),
                Text(
                  'Available for select opportunities',
                  style: AppTextStyles.mono(size: 11, color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 26),
        _fadeUp(
          Text(
            'Hi, I\'m ${AppData.name}',
            style: AppTextStyles.heading(
              size: isMobile ? (MediaQuery.of(context).size.width < 360 ? 30 : 36) : (isDesktop ? 60 : 48),
              height: 1.03,
            ),
          ),
          delay: 0.08,
        ),
        const SizedBox(height: 12),
        _fadeUp(
          SizedBox(
            height: isMobile ? 34 : 46,
            child: Row(
              children: [
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) => AppColors.accentGradient.createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  ),
                  child: DefaultTextStyle(
                    style: AppTextStyles.heading(
                      size: isMobile ? 22 : 30,
                      weight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      pause: const Duration(milliseconds: 1400),
                      animatedTexts: [
                        TyperAnimatedText('Senior Flutter Developer', speed: const Duration(milliseconds: 60)),
                        TyperAnimatedText('Mobile App Architect', speed: const Duration(milliseconds: 60)),
                        TyperAnimatedText('Team Lead', speed: const Duration(milliseconds: 60)),
                        TyperAnimatedText('Web3 & Real-time Systems', speed: const Duration(milliseconds: 60)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          delay: 0.14,
        ),
        const SizedBox(height: 20),
        _fadeUp(
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Text(AppData.tagline, style: AppTextStyles.body(size: 17, height: 1.7)),
          ),
          delay: 0.2,
        ),
        const SizedBox(height: 32),
        _fadeUp(
          Wrap(
            spacing: 14,
            runSpacing: 14,
            children: [
              PrimaryButton(
                label: 'View my work',
                icon: Icons.arrow_forward_rounded,
                onPressed: widget.onViewWork,
              ),
              OutlineButton(label: 'Get in touch', onPressed: widget.onContact),
            ],
          ),
          delay: 0.26,
        ),
        const SizedBox(height: 36),
        _fadeUp(
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SocialIconButton(
                assetPath: 'assets/icons/github.svg',
                tooltip: 'GitHub',
                onTap: widget.onGithub,
              ),
              const SizedBox(width: 12),
              SocialIconButton(
                assetPath: 'assets/icons/linkedIn.svg',
                tooltip: 'LinkedIn',
                onTap: widget.onLinkedin,
              ),
            ],
          ),
          delay: 0.32,
        ),
      ],
    );

    final photo = _fadeUp(
      _HeroPhoto(size: isMobile ? 220 : (isDesktop ? 350 : 280)),
      delay: 0.16,
    );

    return Container(
      key: widget.sectionKey,
      width: double.infinity,
      color: AppColors.background,
      child: Stack(
        children: [
          const Positioned.fill(
            child: DecoratedBox(decoration: BoxDecoration(gradient: AppColors.heroGlowPrimary)),
          ),
          const Positioned.fill(
            child: DecoratedBox(decoration: BoxDecoration(gradient: AppColors.heroGlowSecondary)),
          ),
          Positioned(
            top: -140,
            right: isMobile ? -160 : -60,
            child: FloatingOrb(size: 440, color: AppColors.accent.withOpacity(0.12)),
          ),
          Positioned(
            bottom: -120,
            left: -140,
            child: FloatingOrb(
              size: 400,
              color: AppColors.secondary.withOpacity(0.12),
              duration: const Duration(seconds: 15),
              driftPx: 40,
            ),
          ),
          Positioned.fill(child: CustomPaint(painter: _GridPainter())),
          Padding(
            padding: EdgeInsets.fromLTRB(hPad, isMobile ? 100 : 168, hPad, isMobile ? 60 : 90),
            child: isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(flex: 6, child: textColumn),
                      const SizedBox(width: 48),
                      Expanded(flex: 4, child: Center(child: photo)),
                    ],
                  )
                : Column(
                    children: [
                      Center(child: photo),
                      const SizedBox(height: 32),
                      textColumn,
                    ],
                  ),
          ),
          if (isDesktop)
            Positioned(
              left: 0,
              right: 0,
              bottom: 28,
              child: Center(child: _ScrollCue(onTap: widget.onScrollDown)),
            ),
        ],
      ),
    );
  }
}

class _PulsingDot extends StatefulWidget {
  @override
  State<_PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<_PulsingDot> with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 1400))..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final v = _controller.value;
        return Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: AppColors.accent,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: AppColors.accent.withOpacity(0.5 * v + 0.1), blurRadius: 6 + 6 * v, spreadRadius: 1),
            ],
          ),
        );
      },
    );
  }
}

class _ScrollCue extends StatelessWidget {
  final VoidCallback onTap;
  const _ScrollCue({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Column(
          children: [
            Text('SCROLL', style: AppTextStyles.mono(size: 10, color: AppColors.textMuted)),
            const SizedBox(height: 10),
            _BounceArrow(),
          ],
        ),
      ),
    );
  }
}

class _BounceArrow extends StatefulWidget {
  @override
  State<_BounceArrow> createState() => _BounceArrowState();
}

class _BounceArrowState extends State<_BounceArrow> with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 1500))..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Transform.translate(
          offset: Offset(0, Curves.easeInOut.transform(_controller.value) * 6),
          child: const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.textMuted, size: 22),
        );
      },
    );
  }
}

class _HeroPhoto extends StatefulWidget {
  final double size;
  const _HeroPhoto({required this.size});

  @override
  State<_HeroPhoto> createState() => _HeroPhotoState();
}

class _HeroPhotoState extends State<_HeroPhoto> with SingleTickerProviderStateMixin {
  late final AnimationController _rotation =
      AnimationController(vsync: this, duration: const Duration(seconds: 20))..repeat();

  @override
  void dispose() {
    _rotation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size + 40,
      height: widget.size + 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _rotation,
            builder: (context, _) => Transform.rotate(
              angle: _rotation.value * 6.28318,
              child: Container(
                width: widget.size + 30,
                height: widget.size + 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: SweepGradient(
                    colors: [
                      AppColors.accent.withOpacity(0.0),
                      AppColors.accent,
                      AppColors.secondary,
                      AppColors.accent.withOpacity(0.0),
                    ],
                    stops: const [0.0, 0.4, 0.6, 1.0],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: widget.size + 16,
            height: widget.size + 16,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.background),
          ),
          Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: AppColors.accent.withOpacity(0.25), blurRadius: 80, spreadRadius: 4),
              ],
            ),
            padding: const EdgeInsets.all(4),
            child: ClipOval(
              child: Image.asset('assets/profile.png', fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}

/// A faint dot-grid painted behind the hero for subtle texture — the kind
/// of detail that separates a "template" feel from an intentional one.
class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.025)
      ..strokeWidth = 1;
    const gap = 42.0;
    for (double x = 0; x < size.width; x += gap) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += gap) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
