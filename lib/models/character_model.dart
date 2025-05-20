class CharacterModel {
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final String origin;
  final String location;

  CharacterModel({required this.name, required this.status, required this.species, required this.gender, required this.origin, required this.location, required this.image});

  factory CharacterModel.fromJson(Map<String, dynamic> jsonMap){
    return CharacterModel(
      name: jsonMap['name'],
      status: jsonMap['status'],
      species: jsonMap['species'],
      gender: jsonMap['gender'],
      image: jsonMap['image'],
      origin: jsonMap['origin']['name'],
      location: jsonMap['location']['name']      
    );
  }
  
}