import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/character_controller.dart';
import '../models/character.dart';

final characterProvider = FutureProvider<List<Character>>((ref) async {
  final controller = CharacterController();
  return await controller.fetchCharacters();
});