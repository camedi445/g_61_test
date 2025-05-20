import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_61_test/controllers/character_controller.dart';
import 'package:g_61_test/widgets/character_card.dart';

import 'character_detail_screen.dart';

class CharacterListScreen extends StatelessWidget {
  const CharacterListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final charactersAsync = ref.watch(characterControllerProvider);

          if (charactersAsync.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (charactersAsync.hasError) {
            return Center(child: Text('Error: ${charactersAsync.error}'));
          }

          final characters = charactersAsync.value!;

          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              final character = characters[index];
              return CharacterCard(
                character: character,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              CharacterDetailScreen(character: character),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
