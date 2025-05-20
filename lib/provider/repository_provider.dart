import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_61_test/data/datasource/character_api_datasource.dart';
import 'package:g_61_test/data/repository/character_repository.dart';

final characterApiRepositoryProvider = Provider<CharacterRepository>((ref) {
  final characterApiDatasource = CharacterApiDatasource();
  final characterApiRepository = CharacterRepository(characterApiDatasource);
  return characterApiRepository;
});
