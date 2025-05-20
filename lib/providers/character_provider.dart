import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/character_controller.dart';
import '../models/character.dart';


final characterControllerProvider =
    StateNotifierProvider<CharacterController, AsyncValue<List<Character>>>(
  (ref) => CharacterController(),
);
