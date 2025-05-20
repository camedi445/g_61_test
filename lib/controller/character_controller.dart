import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/character.dart';

class CharacterController {
  Future<List<Character>> fetchCharacters() async {
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['results'] as List)
          .map((character) => Character.fromJson(character))
          .toList();
    } else {
      throw Exception('Error al cargar personajes');
    }
  }
}
