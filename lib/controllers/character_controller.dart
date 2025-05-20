import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/character_model.dart';
import '../services/character_service.dart';

final characterControllerProvider = StateNotifierProvider<CharacterController, AsyncValue<List<Character>>>(
  (ref) => CharacterController(CharacterService()),
);

class CharacterController extends StateNotifier<AsyncValue<List<Character>>> {
  final CharacterService _service;

  CharacterController(this._service) : super(const AsyncLoading()) {
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    try {
      final characters = await _service.fetchCharacters();
      state = AsyncData(characters);
    } catch (e) {
      state = AsyncError(e,StackTrace.current);
    }
  }
}
