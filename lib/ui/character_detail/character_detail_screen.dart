import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatelessWidget {
  final dynamic character;
  final Function onBack;

  const CharacterDetailScreen({
    super.key,
    required this.character,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(icon: Icon(Icons.arrow_back), onPressed: () => onBack()),
        Image.network(character['image'], height: 200),
        Text(
          character['name'],
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text('Status: ${character['status']}'),
        Text('Species: ${character['species']}'),
        Text('Gender: ${character['gender']}'),
        Text('Origin: ${character['origin']['name']}'),
        Text('Location: ${character['location']['name']}'),
      ],
    );
  }
}
