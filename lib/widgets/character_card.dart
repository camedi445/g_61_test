import 'package:flutter/material.dart';
import '../models/character_model.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  final VoidCallback onTap;

  const CharacterCard({
    super.key,
    required this.character,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: Hero(
          tag: 'character-image-${character.id}',
          child: CircleAvatar(backgroundImage: NetworkImage(character.image)),
        ),
        title: Text(character.name),
        subtitle: Text('${character.status} - ${character.species}'),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
