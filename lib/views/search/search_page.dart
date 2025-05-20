import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/search_provider.dart';
import '../../core/widgets/loading_indicator.dart';
import '../../core/widgets/error_message.dart';
import '../../core/widgets/character_card.dart';
import '../detail/detail_page.dart';

class SearchPage extends ConsumerWidget {
  static const routeName = '/search';
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  ref.read(searchProvider.notifier).search(value);
                }
              },
              decoration: const InputDecoration(
                hintText: 'Search characters',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          if (state.isLoading)
            const Expanded(child: LoadingIndicator())
          else if (state.error != null)
            Expanded(child: ErrorMessage(message: state.error!))
          else if (state.results != null && state.results!.isEmpty)
            const Expanded(child: Center(child: Text('No results found')))
          else if (state.results != null)
            Expanded(
              child: ListView.builder(
                itemCount: state.results!.length,
                itemBuilder: (ctx, i) {
                  final char = state.results![i];
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
            ),
        ],
      ),
    );
  }
}
