import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/search_controller.dart';

final searchProvider = StateNotifierProvider<SearchController, SearchState>(
  (ref) => SearchController(ref),
);
