import 'package:flutter/material.dart';
import '../models/character_model.dart';

class CharacterDetailScreen extends StatelessWidget {
  final CharacterModel character;
  final VoidCallback onBack;

  const CharacterDetailScreen({
    super.key,
    required this.character,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: onBack,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(character.image, height: 200),
          ),
          const SizedBox(height: 20),
          Text(character.name, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text('Status: ${character.status}'),
          Text('Species: ${character.species}'),
          Text('Gender: ${character.gender}'),
          Text('Origin: ${character.origin}'),
          Text('Location: ${character.location}'),
        ],
      ),
    );
  }
}
