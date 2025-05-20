import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/profile_controller.dart';

final profileProvider = StateNotifierProvider<ProfileController, ProfileState>(
  (ref) => ProfileController(ref),
);
