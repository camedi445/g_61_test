import 'package:flutter/material.dart';

class CharacterHeader extends StatelessWidget {
  final String imageUrl;
  final String name;

  const CharacterHeader({
    super.key,
    required this.imageUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          imageUrl,
          width: double.infinity,
          height: 220,
          fit: BoxFit.cover,
        ),
        Container(
          height: 220,
          color: Colors.black26,
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.all(16),
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}