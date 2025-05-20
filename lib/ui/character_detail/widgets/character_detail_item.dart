import 'package:flutter/material.dart';

class CharacterDetailItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const CharacterDetailItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}
