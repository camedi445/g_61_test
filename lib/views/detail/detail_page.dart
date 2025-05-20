import 'package:flutter/material.dart';
import '../../models/character.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail';
  final Character character;
  const DetailPage({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(character.image),
            ),
            const SizedBox(height: 16),
            Text(
              character.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text('Status: ${character.status}'),
            Text('Species: ${character.species}'),
          ],
        ),
      ),
    );
  }
}
