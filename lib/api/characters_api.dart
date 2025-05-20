import 'dart:convert';
import 'package:g_61_test/models/character.dart';
import 'package:http/http.dart' as http;

class CharactersApi {

  Future<List<Character>> getCharacters() async {
    try {
      var response = await http.get(
        Uri.parse('https://rickandmortyapi.com/api/character'),
      );
  
      if (response.statusCode == 200) {
        final List<dynamic> json =
            jsonDecode(response.body)['results'] as List;

        final List<Character> characters =
            json.map((json) => Character.fromJson(json)).toList();
        return characters;
      } else {
        throw Exception('Ocorrio un error en la conexión con la API');
      }
    } catch (error) {
      throw Exception('Ocurrió un error procesando los datos del API');
    }
  }
}