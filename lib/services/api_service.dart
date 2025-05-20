import 'dart:convert';
import 'package:g_61_test/core/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class ApiService {
  static const _baseUrl = AppConstants.apiBaseUrl;
  Future<List<Character>> fetchCharacters() async {
    final response = await http.get(Uri.parse('$_baseUrl/character'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['results'] as List;
      return data.map((e) => Character.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }

  Future<Character> fetchCharacterById(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/character/\$id'));
    if (response.statusCode == 200) {
      return Character.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load character');
    }
  }

  Future<List<Character>> searchCharacters(String query) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/character/?name=$query'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['results'] as List;
      return data.map((e) => Character.fromJson(e)).toList();
    } else {
      throw Exception('Search failed');
    }
  }
}
