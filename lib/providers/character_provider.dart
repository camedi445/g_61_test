import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_61_test/controllers/character_controller.dart';
import 'package:g_61_test/models/character_model.dart';

final CharacterProvider = FutureProvider<List<CharacterModel>>((ref) {
  final controller = CharacterController();
  return controller.fetchCharacters();
});