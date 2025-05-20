import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_61_test/controllers/characters_controller.dart';
import 'package:g_61_test/controllers/characters_controller_state.dart';

final charactersApiProvider =
    StateNotifierProvider<CharactersController, CharactersState>((ref) {
      final charactersController = CharactersController();
      charactersController.getCharacters();
      return charactersController;
    });
