import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/character.dart';
import '../providers/character_provider.dart'; // aquí está apiServiceProvider

class SearchState {
  final bool isLoading;
  final List<Character>? results;
  final String? error;

  SearchState({this.isLoading = false, this.results, this.error});

  SearchState copyWith({
    bool? isLoading,
    List<Character>? results,
    String? error,
  }) {
    return SearchState(
      isLoading: isLoading ?? this.isLoading,
      results: results ?? this.results,
      error: error,
    );
  }
}

class SearchController extends StateNotifier<SearchState> {
  SearchController(this.ref) : super(SearchState());
  final Ref ref;

  Future<void> search(String query) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final list = await ref.read(apiServiceProvider).searchCharacters(query);
      state = state.copyWith(isLoading: false, results: list);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
