import 'package:g_61_test/domain/model/character.dart';

class CharacterListState {
  final bool isLoading;
  final List<Character> listOfCharacter;
  final String? errorMessage;

  CharacterListState({
    this.isLoading = false,
    this.listOfCharacter = const [],
    this.errorMessage,
  });

  CharacterListState copyWith({
    bool? isLoading,
    List<Character>? listOfCharacter,
    String? errorMessage,
  }) {
    return CharacterListState(
      isLoading: isLoading ?? this.isLoading,
      listOfCharacter: listOfCharacter ?? this.listOfCharacter,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
