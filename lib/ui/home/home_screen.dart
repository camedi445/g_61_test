// home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_61_test/provider/controller_provider.dart';
import 'package:g_61_test/ui/character_detail/character_detail_screen.dart';
import 'package:g_61_test/ui/home/widgets/character_list.dart';
import 'package:g_61_test/domain/model/character.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;
  Character? selectedCharacter;
  bool showCharacterDetail = false;

  @override
  Widget build(BuildContext context) {
    final characterListState = ref.watch(characterListControllerProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Rick and Morty App')),
      body:
          _selectedIndex == 0
              ? CharacterList(
                characters: characterListState.listOfCharacter,
                isLoading: characterListState.isLoading,
                onCharacterTap: (character) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              CharacterDetailScreen(character: character),
                    ),
                  );
                },
              )
              : _selectedIndex == 1
              ? Center(child: Text('Search Screen'))
              : Center(child: Text('Profile Screen')),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
