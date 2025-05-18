import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                  : HomeScreen(
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

class HomeScreen extends StatelessWidget {
  final List characters;
  final bool isLoading;
  final Function onCharacterTap;

  const HomeScreen({
    required this.characters,
    required this.isLoading,
    required this.onCharacterTap,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index) {
        var character = characters[index];
        return ListTile(
          leading: Image.network(character['image']),
          title: Text(character['name']),
          subtitle: Text('Status: ${character['status']}'),
          onTap: () => onCharacterTap(character),
        );
      },
    );
  }
}

class CharacterDetailScreen extends StatelessWidget {
  final dynamic character;
  final Function onBack;

  const CharacterDetailScreen({required this.character, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(icon: Icon(Icons.arrow_back), onPressed: () => onBack()),
        Image.network(character['image'], height: 200),
        Text(
          character['name'],
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text('Status: ${character['status']}'),
        Text('Species: ${character['species']}'),
        Text('Gender: ${character['gender']}'),
        Text('Origin: ${character['origin']['name']}'),
        Text('Location: ${character['location']['name']}'),
      ],
    );
  }
}
