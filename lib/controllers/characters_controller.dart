import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_61_test/api/characters_api.dart';
import 'package:g_61_test/controllers/characters_controller_state.dart';

class CharactersController extends StateNotifier<CharactersState> {
  final _api = CharactersApi();
  CharactersController() : super(CharactersState());

  Future<void> getCharacters() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final characters =
          await _api.getCharacters();
      state = state.copyWith(
          isLoading: false, characters: characters, errorMessage: null);
    } catch (error) {
      state = state.copyWith(isLoading: false, errorMessage: error.toString());
    }
  }
}