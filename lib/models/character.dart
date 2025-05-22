class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String imageUrl;
  final String origin;
  final String location;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.imageUrl,
    required this.origin,
    required this.location,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      gender: json['gender'] as String,
      imageUrl: json['image'] as String,
      origin: (json['origin']?['name'] ?? '') as String,
      location: (json['location']?['name'] ?? '') as String,
    );
  }
}