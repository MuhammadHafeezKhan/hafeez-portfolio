class ExperienceItem {
  final String role;
  final String company;
  final String period;
  final String summary;
  final List<String> highlights;
  final bool isCurrent;

  const ExperienceItem({
    required this.role,
    required this.company,
    required this.period,
    required this.summary,
    required this.highlights,
    this.isCurrent = false,
  });
}
