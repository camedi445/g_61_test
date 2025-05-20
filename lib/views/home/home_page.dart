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

    return Scaffold(
      appBar: AppBar(title: const Text('Characters')),
      body:
          state.isLoading
              ? const LoadingIndicator()
              : state.error != null
              ? ErrorMessage(message: state.error!)
              : state.characters == null || state.characters!.isEmpty
              ? const Center(child: Text('No characters available'))
              : ListView.builder(
                itemCount: state.characters!.length,
                itemBuilder: (ctx, i) {
                  final char = state.characters![i];
                  return CharacterCard(
                    character: char,
                    onTap:
                        () => Navigator.pushNamed(
                          context,
                          DetailPage.routeName,
                          arguments: char,
                        ),
                  );
                },
              ),
    );
  }
}
