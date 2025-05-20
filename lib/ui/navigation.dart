import 'package:flutter/material.dart';
import 'package:g_61_test/ui/detail_screen/detail_screen.dart';
import 'package:g_61_test/ui/list_screen.dart';
import 'package:g_61_test/ui/profile_screen.dart';
import 'package:g_61_test/ui/search_screen.dart';
import 'package:provider/provider.dart';
import '../../provider/character_provider.dart';


class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
      Provider.of<CharacterProvider>(context, listen: false).loadCharacters(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CharacterProvider>(context);

    Widget content;
    switch (_selectedIndex) {
      case 0:
        content = provider.selectedCharacter != null
            ? DetailScreen()
            : ListScreen();
        break;
      case 1:
        content = const SearchScreen();
        break;
      case 2:
        content = const ProfileScreen();
        break;
      default:
        content =  ListScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty App'),
        backgroundColor: const Color.fromARGB(255, 173, 183, 235),
        elevation: 0,
      ),
      body: content,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
