import 'package:g_61_test/domain/datasource/character_datasource.dart';
import 'package:g_61_test/domain/model/character.dart';

class CharacterRepository {
  final CharacterDatasource _characterDatasource;

  CharacterRepository(this._characterDatasource);

  Future<List<Character>> getCharacterList() {
    return _characterDatasource.fetchCharacterList();
  }
}
