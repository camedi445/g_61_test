import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_61_test/controller/character_list_state.dart';
import 'package:g_61_test/data/repository/character_repository.dart';

class CharacterListController extends StateNotifier<CharacterListState> {
  final CharacterRepository characterRepository;
  CharacterListController(this.characterRepository)
    : super(CharacterListState());

  Future<void> init() async {
    await getCharacterList();
  }

  Future<void> getCharacterList() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final listOfCharacter = await characterRepository.getCharacterList();
      state = state.copyWith(
        isLoading: false,
        listOfCharacter: listOfCharacter,
        errorMessage: null,
      );
    } catch (error) {
      state = state.copyWith(isLoading: false, errorMessage: error.toString());
    }
  }
}
