import 'dart:convert';

import 'package:g_61_test/domain/datasource/character_datasource.dart';
import 'package:g_61_test/domain/model/character.dart';
import 'package:http/http.dart' as http;

class CharacterApiDatasource extends CharacterDatasource {
  @override
  Future<List<Character>> fetchCharacterList() async {
    final response = await http.get(
      Uri.parse('https://rickandmortyapi.com/api/character'),
    );

    try {
      if (response.statusCode == 200) {
        var jsonCharacters = jsonDecode(response.body)['results'];
        List<Character> characters = [];
        for (var character in jsonCharacters) {
          characters.add(Character.fromJson(character));
        }
        return characters;
      } else {
        throw Exception('Failed to load characters');
      }
    } catch (e) {
      return [];
    }
  }
}
