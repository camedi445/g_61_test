import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/character_model.dart';
import 'package:http/http.dart' as http;

class CharacterController extends StateNotifier<AsyncValue<List<Character>>> {
  CharacterController() : super(const AsyncValue.loading()) {
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    state = const AsyncValue.loading();
    try {
      final response = await http.get(
        Uri.parse('https://rickandmortyapi.com/api/character'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final characters =
            (data['results'] as List)
                .map((character) => Character.fromJson(character))
                .toList();
        state = AsyncValue.data(characters);
      } else {
        state = AsyncValue.error(
          'Failed to load characters',
          StackTrace.current,
        );
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final characterControllerProvider =
    StateNotifierProvider<CharacterController, AsyncValue<List<Character>>>(
      (ref) => CharacterController(),
    );
