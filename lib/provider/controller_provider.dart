import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_61_test/controller/character_list_controller.dart';
import 'package:g_61_test/controller/character_list_state.dart';
import 'package:g_61_test/provider/repository_provider.dart';

final characterListControllerProvider =
    StateNotifierProvider<CharacterListController, CharacterListState>((ref) {
      final characterRepository = ref.watch(characterApiRepositoryProvider);
      final characterListController = CharacterListController(
        characterRepository,
      );
      characterListController.init();
      return characterListController;
    });
