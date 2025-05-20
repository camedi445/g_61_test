import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/detail_controller.dart';

final detailProvider = StateNotifierProvider<DetailController, DetailState>(
  (ref) => DetailController(ref),
);
