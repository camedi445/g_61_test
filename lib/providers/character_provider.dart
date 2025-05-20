import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_service.dart';
import '../controllers/character_controller.dart';

final apiServiceProvider = Provider((ref) => ApiService());

final characterProvider =
    StateNotifierProvider<CharacterController, CharacterState>(
      (ref) => CharacterController(ref),
    );
