import 'package:flutter/material.dart';

/// A soft, slowly-drifting blurred gradient blob used behind sections to
/// add ambient depth without being distracting. Purely decorative —
/// wrap it in an [IgnorePointer]-safe [Positioned] in a [Stack].
class FloatingOrb extends StatefulWidget {
  final double size;
  final Color color;
  final Duration duration;
  final double driftPx;

  const FloatingOrb({
    super.key,
    this.size = 500,
    required this.color,
    this.duration = const Duration(seconds: 12),
    this.driftPx = 30,
  });

  @override
  State<FloatingOrb> createState() => _FloatingOrbState();
}

class _FloatingOrbState extends State<FloatingOrb> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final t = Curves.easeInOut.transform(_controller.value);
          final dx = (t - 0.5) * widget.driftPx;
          final dy = (t - 0.5) * widget.driftPx * 0.6;
          return Transform.translate(
            offset: Offset(dx, dy),
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [widget.color, widget.color.withOpacity(0)],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
