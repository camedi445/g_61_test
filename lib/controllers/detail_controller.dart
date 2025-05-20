import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_61_test/providers/character_provider.dart';
import '../models/character.dart';
import '../services/api_service.dart';

class DetailState {
  final bool isLoading;
  final Character? character;
  final String? error;

  DetailState({this.isLoading = false, this.character, this.error});

  DetailState copyWith({bool? isLoading, Character? character, String? error}) {
    return DetailState(
      isLoading: isLoading ?? this.isLoading,
      character: character ?? this.character,
      error: error,
    );
  }
}

class DetailController extends StateNotifier<DetailState> {
  DetailController(this.ref) : super(DetailState());
  final Ref ref;

  Future<void> loadCharacter(int id) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final char = await ref.read(apiServiceProvider).fetchCharacterById(id);
      state = state.copyWith(isLoading: false, character: char);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
