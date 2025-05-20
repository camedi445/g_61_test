import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character_model.dart';

class CharacterService {
  Future<List<Character>> fetchCharacters() async {
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List;
      return results.map((json) => Character.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching characters');
    }
  }
}
