class Character {
  final String name;
  final String image;
  final String status;
  final String species;
  final String gender;
  final String origin;
  final String location;

  Character({
    required this.name,
    required this.image,
    required this.status,
    required this.species,
    required this.gender,
    required this.origin,
    required this.location,
  });

  Character copyWith({
    String? name,
    String? image,
    String? status,
    String? species,
    String? gender,
    String? origin,
    String? location,
  }) {
    return Character(
      name: name ?? this.name,
      image: image ?? this.image,
      status: status ?? this.status,
      species: species ?? this.species,
      gender: gender ?? this.gender,
      origin: origin ?? this.origin,
      location: location ?? this.location,
    );
  }

  factory Character.fromJson(Map<String, dynamic> jsonMap) {
    return Character(
      name: jsonMap['name'],
      image: jsonMap['image'],
      status: jsonMap['status'],
      species: jsonMap['species'],
      gender: jsonMap['gender'],
      origin: jsonMap['origin']['name'],
      location: jsonMap['location']['name'],
    );
  }
}
