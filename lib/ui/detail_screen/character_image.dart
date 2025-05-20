import 'package:flutter/material.dart';

class CharacterImage extends StatelessWidget {
  final String imageUrl;

  const CharacterImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        height: 250,
        width: 250,
        fit: BoxFit.cover,
      ),
    );
  }
}
