import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/character_provider.dart';
import '../models/character.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';
import 'search_screen.dart';
import 'profile_screen.dart';
import 'detail_screen.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (_selectedIndex == 0) {
      final charsAsync = ref.watch(charactersProvider);
      body = charsAsync.when(
        data: (list) => HomeScreen(
          characters: list,
          onCharacterTap: (Character c) => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CharacterDetailScreen(character: c, onBack: () => Navigator.pop(context)),
            ),
          ),
        ),
        loading: () => const LoadingWidget(),
        error: (e, _) => ErrorDisplayWidget(message: e.toString()),
      );
    } else if (_selectedIndex == 1) {
      body = const SearchScreen();
    } else {
      body = const ProfileScreen();
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Rick and Morty App')),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Character> characters;
  final void Function(Character) onCharacterTap;

  const HomeScreen({required this.characters, required this.onCharacterTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (_, i) {
        final c = characters[i];
        return ListTile(
          leading: Image.network(c.image),
          title: Text(c.name),
          subtitle: Text(c.status),
          onTap: () => onCharacterTap(c),
        );
      },
    );
  }
}