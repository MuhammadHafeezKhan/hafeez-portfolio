import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// Wraps [child] and fades + slides it into view the first time it
/// becomes visible while scrolling. Only animates once per widget.
class RevealOnScroll extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final double offsetY;

  const RevealOnScroll({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 700),
    this.offsetY = 28,
  });

  @override
  State<RevealOnScroll> createState() => _RevealOnScrollState();
}

class _RevealOnScrollState extends State<RevealOnScroll>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;
  late final Animation<double> _scale;
  bool _hasAnimated = false;
  final Key _visibilityKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _fade = CurvedAnimation(parent: _controller, curve: const Interval(0, 0.85, curve: Curves.easeOut));
    _slide = Tween<Offset>(
      begin: Offset(0, widget.offsetY / 100),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _scale = Tween<double>(begin: 0.98, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
  }

  void _play() {
    if (_hasAnimated) return;
    _hasAnimated = true;
    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: _visibilityKey,
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1) {
          _play();
        }
      },
      child: FadeTransition(
        opacity: _fade,
        child: SlideTransition(
          position: _slide,
          child: ScaleTransition(scale: _scale, child: widget.child),
        ),
      ),
    );
  }
}

/// Applies a staggered [RevealOnScroll] delay to each child based on its
/// index — use for grids/lists where items should cascade in rather than
/// all fade in at once.
class StaggeredReveal extends StatelessWidget {
  final List<Widget> children;
  final Duration stagger;
  final Axis direction;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const StaggeredReveal({
    super.key,
    required this.children,
    this.stagger = const Duration(milliseconds: 90),
    this.direction = Axis.vertical,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    final wrapped = [
      for (int i = 0; i < children.length; i++)
        RevealOnScroll(delay: stagger * i, child: children[i]),
    ];
    return direction == Axis.vertical
        ? Column(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            children: wrapped,
          )
        : Row(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            children: wrapped,
          );
  }
}
