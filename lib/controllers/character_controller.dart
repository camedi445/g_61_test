import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class CharacterController {
  Future<List<Character>> fetchCharacters() async {
    final response = await http.get(
      Uri.parse('https://rickandmortyapi.com/api/character'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List results = data['results'];
      return results.map((json) => Character.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar personajes');
    }
  }
}
