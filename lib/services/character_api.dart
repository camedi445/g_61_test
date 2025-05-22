import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class CharacterApi {
  static const _baseUrl = 'https://rickandmortyapi.com/api';

  static Future<List<Character>> fetchAll() async {
    final resp = await http.get(Uri.parse('$_baseUrl/character'));
    if (resp.statusCode != 200) {
      throw Exception('Error ${resp.statusCode}');
    }
    final data = jsonDecode(resp.body)['results'] as List<dynamic>;
    return data.map((j) => Character.fromJson(j)).toList();
  }
}