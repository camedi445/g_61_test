import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/character.dart';
import '../../providers/detail_provider.dart';
import '../../core/widgets/loading_indicator.dart';
import '../../core/widgets/error_message.dart';

class DetailPage extends ConsumerStatefulWidget {
  static const routeName = '/detail';
  const DetailPage({Key? key}) : super(key: key);

  @override
  ConsumerState<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  late final Character _initialChar;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      final args = ModalRoute.of(context)!.settings.arguments;
      if (args is Character) {
        _initialChar = args;
        ref.read(detailProvider.notifier).loadCharacter(_initialChar.id);
      }
      _initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(detailProvider);
    final char = state.character ?? _initialChar;

    if (state.isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text('Loading...')),
        body: const LoadingIndicator(),
      );
    }

    if (state.error != null) {
      return Scaffold(
        appBar: AppBar(title: Text(char.name)),
        body: ErrorMessage(message: state.error!),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(char.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(radius: 80, backgroundImage: NetworkImage(char.image)),
            const SizedBox(height: 16),
            Text(char.name, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text('Status: ${char.status}'),
            Text('Species: ${char.species}'),
          ],
        ),
      ),
    );
  }
}
