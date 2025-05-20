import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/character_provider.dart';
import '../../core/widgets/loading_indicator.dart';
import '../../core/widgets/error_message.dart';
import '../../core/widgets/character_card.dart';
import '../detail/detail_page.dart';

class HomePage extends ConsumerWidget {
  static const routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(characterProvider);

    if (state.isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text('Characters')),
        body: const LoadingIndicator(),
      );
    }

    if (state.error != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Characters')),
        body: ErrorMessage(message: state.error!),
      );
    }

    final list = state.characters;
    if (list == null || list.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Characters')),
        body: const Center(child: Text('No characters available')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Characters')),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder:
            (ctx, i) => CharacterCard(
              character: list[i],
              onTap:
                  () => Navigator.pushNamed(
                    context,
                    DetailPage.routeName,
                    arguments: list[i],
                  ),
            ),
      ),
    );
  }
}
