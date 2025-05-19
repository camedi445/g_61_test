import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/character.dart';
import '../controllers/character_controller.dart';

final characterControllerProvider = Provider((ref) => CharacterController());

final charactersProvider = FutureProvider<List<Character>>((ref) async {
  final controller = ref.read(characterControllerProvider);
  return controller.fetchCharacters();
});

final selectedCharacterProvider = StateProvider<Character?>((ref) => null);
