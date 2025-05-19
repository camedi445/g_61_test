import 'package:flutter/material.dart';
import 'package:g_61_test/ui/character_detail/character_detail_screen.dart';
import 'package:g_61_test/ui/home/widgets/character_list.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  var characters = [];
  var isLoading = false;
  var selectedCharacter;
  var showCharacterDetail = false;

  @override
  void initState() {
    super.initState();
    fetchCharacters();
  }

  fetchCharacters() async {
    setState(() {
      isLoading = true;
    });

    var response = await http.get(
      Uri.parse('https://rickandmortyapi.com/api/character'),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        characters = data['results'];
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rick and Morty App')),
      body:
          _selectedIndex == 0
              ? showCharacterDetail
                  ? CharacterDetailScreen(
                    character: selectedCharacter,
                    onBack: () {
                      setState(() {
                        showCharacterDetail = false;
                      });
                    },
                  )
                  : CharacterList(
                    characters: characters,
                    isLoading: isLoading,
                    onCharacterTap: (character) {
                      setState(() {
                        selectedCharacter = character;
                        showCharacterDetail = true;
                      });
                    },
                  )
              : _selectedIndex == 1
              ? Center(child: Text('Search Screen'))
              : Center(child: Text('Profile Screen')),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
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
