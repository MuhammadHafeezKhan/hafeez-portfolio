/// A single portfolio project.
///
/// To add, edit, or remove a project, only [AppData.projects] in
/// `lib/core/app_data.dart` needs to change — nothing else in the
/// app references project content directly.
class Project {
  final String name;
  final String image;
  final String description;
  final String role;
  final String category;
  final String impact;
  final List<String> techs;
  final List<String> highlights;
  final bool isFeatured;
  final String? androidLink;
  final String? iosLink;
  final String? githubLink;
  final String? liveLink;

  const Project({
    required this.name,
    required this.image,
    required this.description,
    required this.role,
    required this.category,
    required this.impact,
    required this.techs,
    required this.highlights,
    this.isFeatured = false,
    this.androidLink,
    this.iosLink,
    this.githubLink,
    this.liveLink,
  });
}
