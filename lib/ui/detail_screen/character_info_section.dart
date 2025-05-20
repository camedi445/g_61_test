import 'package:flutter/material.dart';
import '../../model/character.dart'; // Asegúrate de tener un modelo definido
import 'info_card.dart';

class CharacterInfoSection extends StatelessWidget {
  final Character character;

  const CharacterInfoSection({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          character.name,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        InfoCard(icon: Icons.psychology, title: 'Status', value: character.status),
        InfoCard(icon: Icons.category, title: 'Species', value: character.species),
        InfoCard(icon: Icons.person_pin, title: 'Gender', value: character.gender),
        InfoCard(icon: Icons.public, title: 'Origin', value: character.origin),
        InfoCard(icon: Icons.location_on, title: 'Location', value: character.location),
      ],
    );
  }
}
