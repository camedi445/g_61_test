import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/character_provider.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CharacterProvider>(context);

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF101124), Color(0xFF1F203C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: provider.characters.length,
        itemBuilder: (context, index) {
          final character = provider.characters[index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(character.image, width: 50, height: 50, fit: BoxFit.cover),
              ),
              title: Text(
                character.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Status: ${character.status}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => provider.selectCharacter(character),
            ),
          );
        },
      ),
    );
  }
}
