import 'package:flutter/material.dart';
import 'package:g_61_test/models/character_model.dart';

class CharacterItem extends StatelessWidget {
  final CharacterModel character;
  final VoidCallback onTap;

  const CharacterItem({super.key, required this.character, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(leading: CircleAvatar(backgroundImage: NetworkImage(character.image),),
    title: Text(character.name),
    subtitle: Text('Status: ${character.status}'),
    onTap: onTap,);
    
  }
  

}