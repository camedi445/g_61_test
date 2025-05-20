import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_61_test/providers/character_provider.dart';
import 'package:g_61_test/ui/widgets/character_item.dart';

class HomeScreen extends ConsumerWidget{
  final Function onCharacterTap;

  const HomeScreen({super.key, required this.onCharacterTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final charactersAsync = ref.watch(CharacterProvider);
    return  charactersAsync.when(data: (characters){
      return ListView.builder(itemCount: characters.length,
      itemBuilder: (context, index){
        final character = characters[index];
        return CharacterItem(
          character: character,
          onTap: () => onCharacterTap(character),
        );
      },);
    },
    loading: () => const Center(child: CircularProgressIndicator()),
    error: (e, _) => Center(child: Text('Error $e'),));
    
  }
  

}