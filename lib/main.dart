import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/character_provider.dart';
import 'ui/navigation.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CharacterProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Navigation(),
      ),
    ),
  );
}
