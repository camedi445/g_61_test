import 'package:flutter/material.dart';
import 'package:g_61_test/domain/model/character.dart';
import 'package:g_61_test/ui/character_detail/widgets/character_detail_item.dart';
import 'package:g_61_test/ui/character_detail/widgets/character_header.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Character Detail')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          CharacterHeader(imageUrl: character.image, name: character.name),
          const SizedBox(height: 24),
          CharacterDetailItem(
            icon: Icons.health_and_safety,
            label: 'Status',
            value: character.status,
          ),
          CharacterDetailItem(
            icon: Icons.bubble_chart,
            label: 'Species',
            value: character.species,
          ),
          CharacterDetailItem(
            icon: Icons.wc,
            label: 'Gender',
            value: character.gender,
          ),
          CharacterDetailItem(
            icon: Icons.public,
            label: 'Origin',
            value: character.origin,
          ),
          CharacterDetailItem(
            icon: Icons.location_on,
            label: 'Location',
            value: character.location,
          ),
        ],
      ),
    );
  }
}
