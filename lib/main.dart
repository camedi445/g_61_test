import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_61_test/ui/character_detail_screen.dart';
import 'package:g_61_test/ui/home_screen.dart';
import '../models/character_model.dart';

void main(){
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty MVC',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainScaffold(),
    );
  }
}

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;
  CharacterModel? selectedCharacter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rick and Morty App')),
      body: _selectedIndex == 0
          ? (selectedCharacter == null
              ? HomeScreen(onCharacterTap: (c) {
                  setState(() {
                    selectedCharacter = c;
                  });
                })
              : CharacterDetailScreen(
                  character: selectedCharacter!,
                  onBack: () {
                    setState(() {
                      selectedCharacter = null;
                    });
                  },
                ))
          : Center(child: Text(_selectedIndex == 1 ? 'Search Screen' : 'Profile Screen')),
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
