class Project {
  final String id;
  final String title;
  final String description;
  final String status;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
    };
  }
}
