
import 'package:g_61_test/models/character.dart';

class CharactersState {
  final bool isLoading;
  final List<Character> characters;
  final String? errorMessage;

  CharactersState({
    this.isLoading = false,
    this.characters = const [],
    this.errorMessage,
  });

  CharactersState copyWith({
    bool? isLoading,
    List<Character>? characters,
    String? errorMessage,
  }) {
    return CharactersState(
      isLoading: isLoading ?? this.isLoading,
      characters: characters ?? this.characters,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}