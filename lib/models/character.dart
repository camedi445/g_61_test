class Character {
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final String origin;
  final String location;

  Character({
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    required this.origin,
    required this.location,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'] ?? 'Unknown',
      status: json['status'] ?? 'Unknown',
      species: json['species'] ?? 'Unknown',
      gender: json['gender'] ?? 'Unknown',
      image: json['image'] ?? '',
      origin: json['origin']?['name'] ?? 'Unknown', // Manejo de null
      location: json['location']?['name'] ?? 'Unknown', // Manejo de null
    );
  }
}