import 'package:flutter/material.dart';
import '../models/character.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;
  final VoidCallback onBack;

  const CharacterDetailScreen({required this.character, required this.onBack, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: onBack), title: Text(character.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(character.image, height: 200)),
            const SizedBox(height: 16),
            Text('Status: ${character.status}'),
            Text('Species: ${character.species}'),
            Text('Gender: ${character.gender}'),
            Text('Origin: ${character.origin}'),
            Text('Location: ${character.location}'),
          ],
        ),
      ),
    );
  }
}