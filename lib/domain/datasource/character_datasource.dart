import 'package:g_61_test/domain/model/character.dart';

abstract class CharacterDatasource {
  Future<List<Character>>  fetchCharacterList();
}
