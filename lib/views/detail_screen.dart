import 'package:flutter/material.dart';
import '../models/character_model.dart';

class DetailScreen extends StatelessWidget {
  final Character character;

  const DetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(character.image),
              ),
            ),
            SizedBox(height: 20),
            Text(
              character.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Status: ${character.status}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Species: ${character.species}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Gender: ${character.gender}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Origin: ${character.origin}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Location: ${character.location}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
