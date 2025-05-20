import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_61_test/providers/character_provider.dart';
import '../models/character.dart';
import '../services/api_service.dart';

class CharacterState {
  final bool isLoading;
  final List<Character>? characters;
  final String? error;

  CharacterState({this.isLoading = false, this.characters, this.error});

  CharacterState copyWith({
    bool? isLoading,
    List<Character>? characters,
    String? error,
  }) {
    return CharacterState(
      isLoading: isLoading ?? this.isLoading,
      characters: characters ?? this.characters,
      error: error,
    );
  }
}

class CharacterController extends StateNotifier<CharacterState> {
  CharacterController(this.ref) : super(CharacterState()) {
    loadCharacters();
  }
  final Ref ref;

  Future<void> loadCharacters() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final list = await ref.read(apiServiceProvider).fetchCharacters();
      state = state.copyWith(isLoading: false, characters: list);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
