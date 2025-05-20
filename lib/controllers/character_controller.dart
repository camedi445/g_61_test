import 'dart:convert';

import 'package:g_61_test/models/character_model.dart';
import 'package:http/http.dart' as http;


class CharacterController {
  Future<List<CharacterModel>> fetchCharacters() async{
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));
    try{
      if(response.statusCode == 200){
      final List<dynamic> listOfJson = jsonDecode(response.body)['results'] as List;
      final characterList = listOfJson.map((json) => CharacterModel.fromJson(json)).toList();
      return characterList;
    }else{
      throw Exception('Error al cargar los personajes');
    }
    }catch(error){
      throw Exception('Ocurrió un error');
    }
    

  }
}