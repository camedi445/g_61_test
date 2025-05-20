import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/character_controller.dart';
import '../views/detail_screen.dart';
import '../models/character_model.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterState = ref.watch(characterControllerProvider);

    return characterState.when(
      loading: () => Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Error: $err')),
      data: (characters) => ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          final character = characters[index];
          return ListTile(
            leading: Image.network(character.image),
            title: Text(character.name),
            subtitle: Text('Status: ${character.status}'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (_) => DetailScreen(character: character),
              ));
            },
          );
        },
      ),
    );
  }
}
