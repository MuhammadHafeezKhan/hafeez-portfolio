import 'package:flutter/widgets.dart';

/// A rated skill shown as an animated progress bar.
class RatedSkill {
  final String name;
  final double value; // 0.0 - 1.0

  const RatedSkill({required this.name, required this.value});
}

/// A tool/technology chip. Provide either [image] (an asset path) or
/// [icon] (a Material icon) — [image] takes priority when both/either
/// is available. [category] groups related items in the Skills section.
class TechItem {
  final String name;
  final String category;
  final String? image;
  final IconData? icon;

  const TechItem({
    required this.name,
    this.category = 'Other',
    this.image,
    this.icon,
  });
}
