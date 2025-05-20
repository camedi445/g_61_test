import 'package:flutter/material.dart';
import 'package:g_61_test/domain/model/character.dart';

class CharacterList extends StatelessWidget {
  final List<Character> characters;
  final bool isLoading;
  final Function onCharacterTap;

  const CharacterList({
    super.key,
    required this.characters,
    required this.isLoading,
    required this.onCharacterTap,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: characters.length,
      itemBuilder: (context, index) {
        final character = characters[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  character.image,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                character.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text('Status: ${character.status}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => onCharacterTap(character),
            ),
          ),
        );
      },
    );
  }
}
