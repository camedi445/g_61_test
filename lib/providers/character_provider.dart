import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/character_controller.dart';
import '../services/api_service.dart';

final apiServiceProvider = Provider((_) => ApiService());

final characterControllerProvider = Provider((ref) {
  final service = ref.read(apiServiceProvider);
  return CharacterController(service);
});

final charactersProvider = FutureProvider.autoDispose((ref) async {
  final controller = ref.read(characterControllerProvider);
  return controller.loadCharacters();
});