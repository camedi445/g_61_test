import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'views/home_screen.dart';
import 'views/character_detail_screen.dart';
import 'models/character.dart';
import 'providers/character_providers.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            elevation: 0,
            centerTitle: true,
            foregroundColor: Colors.white,
          ),
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});
  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final selectedCharacter = ref.watch(selectedCharacterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty App'),
        elevation: 2,
      ),
      body: _selectedIndex == 0
          ? (selectedCharacter != null
              ? CharacterDetailScreen(
                  character: selectedCharacter,
                  onBack: () => ref.read(selectedCharacterProvider.notifier).state = null,
                )
              : HomeScreen(
                  onCharacterTap: (character) => ref.read(selectedCharacterProvider.notifier).state = character,
                ))
          : _selectedIndex == 1
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search, size: 80, color: Colors.blue.withOpacity(0.5)),
                      const SizedBox(height: 16),
                      const Text(
                        'Búsqueda',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text('Funcionalidad en desarrollo'),
                    ],
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person, size: 80, color: Colors.blue.withOpacity(0.5)),
                      const SizedBox(height: 16),
                      const Text(
                        'Perfil',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text('...'),
                    ],
                  ),
                ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        elevation: 8,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            // limpiar estado
            if (index != 0) {
              ref.read(selectedCharacterProvider.notifier).state = null;
            }
          });
        },
      ),
    );
  }
}
