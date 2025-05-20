import 'package:flutter/material.dart';
import '../model/character.dart';
import '../controller/character_controller.dart';

class CharacterProvider with ChangeNotifier {
  final CharacterController _controller = CharacterController();

  List<Character> _characters = [];
  bool _isLoading = false;
  Character? _selectedCharacter;

  List<Character> get characters => _characters;
  bool get isLoading => _isLoading;
  Character? get selectedCharacter => _selectedCharacter;

  Future<void> loadCharacters() async {
    _isLoading = true;
    notifyListeners();

    _characters = await _controller.fetchCharacters();

    _isLoading = false;
    notifyListeners();
  }

  void selectCharacter(Character character) {
    _selectedCharacter = character;
    notifyListeners();
  }

  void clearSelectedCharacter() {
    _selectedCharacter = null;
    notifyListeners();
  }
}
