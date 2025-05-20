import 'package:flutter/material.dart';
import '../../models/character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  final VoidCallback onTap;

  const CharacterCard({required this.character, required this.onTap, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(character.image),
      title: Text(character.name),
      subtitle: Text(character.species),
      onTap: onTap,
    );
  }
}
