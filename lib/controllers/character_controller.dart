import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/character.dart';
import '../services/character_api.dart';

class CharacterController extends StateNotifier<AsyncValue<List<Character>>> {
  CharacterController() : super(const AsyncValue.loading()) {
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    try {
      final list = await CharacterApi.fetchAll();
      state = AsyncValue.data(list);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
