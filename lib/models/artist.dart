// lib/models/artist.dart
class Artist {
  final String id;
  final String name;
  final String bio;

  Artist({
    required this.id,
    required this.name,
    required this.bio,
  });


  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      bio: json['bio'] ?? '',
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'bio': bio,
    };
  }
}
