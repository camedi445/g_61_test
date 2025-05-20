import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_61_test/providers/characters_api_provider.dart';
import 'package:g_61_test/ui/character_detail_screen.dart';

class CharactersList extends ConsumerWidget {
  const CharactersList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final charatersState = ref.watch(charactersApiProvider);

    ref.listen(charactersApiProvider, (previous, current) {
      if (current.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              current.errorMessage ?? '',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        );
      }
    });

    return charatersState.isLoading
        ? CircularProgressIndicator()
        : ListView.builder(
          itemCount: charatersState.characters.length,
          itemBuilder: (context, index) {
            var character = charatersState.characters[index];
            return ListTile(
              leading: Image.network(character.image),
              title: Text(character.name),
              subtitle: Text('Status: ${character.status}'),
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CharacterDetailScreen(character: character)),
                  ),
            );
          },
        );
  }
}
