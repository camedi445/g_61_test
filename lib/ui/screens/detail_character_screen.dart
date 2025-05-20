import 'package:flutter/material.dart';
import '../../models/character.dart';

class DetailCharacterScreen extends StatelessWidget {
  final Character character;

  const DetailCharacterScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                character.image,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Name: ${character.name}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Status: ${character.status}'),
            Text('Species: ${character.species}'),
            Text('Gender: ${character.gender}'),
            const SizedBox(height: 8),
            Text('Origin: ${character.origin}'),
            Text('Location: ${character.location}'),
          ],
        ),
      ),
    );
  }
}