import 'dart:convert';

class ProjectImage {
  final int project;
  final String url;

  const ProjectImage({this.project, this.url});

  Map<String, dynamic> toMap() {
    return {
      'project': project,
      'url': url,
    };
  }

  factory ProjectImage.fromMap(Map<String, dynamic> map) {
    return ProjectImage(
      project: map['project'],
      url: map['path'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectImage.fromJson(String source) =>
      ProjectImage.fromMap(json.decode(source));

  @override
  String toString() => 'ProjectImage(project: $project, url: $url)';
}
