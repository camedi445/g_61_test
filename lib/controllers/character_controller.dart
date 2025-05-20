import '../models/character.dart';
import '../services/api_service.dart';

class CharacterController {
  final ApiService _service;
  CharacterController(this._service);

  Future<List<Character>> loadCharacters() {
    return _service.fetchCharacters();
  }
}