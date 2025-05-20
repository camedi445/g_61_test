import 'package:flutter/material.dart';
import '../../models/character.dart';

class CharacterTile extends StatelessWidget {
  final Character character;
  final void Function(Character) onTap;

  const CharacterTile({Key? key, required this.character, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(character.imageUrl),
      title: Text(character.name),
      subtitle: Text('Status: ${character.status}'),
      onTap: () => onTap(character),
    );
  }
}