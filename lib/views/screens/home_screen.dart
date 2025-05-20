import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/character.dart';
import '../../providers/character_provider.dart';
import '../../views/widgets/character_title.dart';
import 'character_detail_screen.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final charactersAsync = ref.watch(characterControllerProvider);
    return charactersAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e,_) => Center(child: Text('Error: $e')),
      data: (list) => ListView.builder(
        itemCount: list.length,
        itemBuilder: (_, i) {
          final c = list[i];
          return CharacterTile(
            character: c,
            onTap: (_) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CharacterDetailScreen(character: c),
              ),
            ),
          );
        },
      ),
    );
  }
}