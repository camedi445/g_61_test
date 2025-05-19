import 'package:flutter/material.dart';

class CharacterList extends StatelessWidget {
  final List characters;
  final bool isLoading;
  final Function onCharacterTap;

  const CharacterList({super.key, 
    required this.characters,
    required this.isLoading,
    required this.onCharacterTap,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index) {
        var character = characters[index];
        return ListTile(
          leading: Image.network(character['image']),
          title: Text(character['name']),
          subtitle: Text('Status: ${character['status']}'),
          onTap: () => onCharacterTap(character),
        );
      },
    );
  }
}
