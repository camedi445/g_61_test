import 'package:flutter/material.dart';
import 'models/character.dart';
import 'views/home/home_page.dart';
import 'views/detail/detail_page.dart';
import 'views/search/search_page.dart';
import 'views/profile/profile_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty MVC',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: HomePage.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomePage.routeName:
            return MaterialPageRoute(builder: (_) => const HomePage());
          case DetailPage.routeName:
            final args = settings.arguments;
            if (args is Character) {
              return MaterialPageRoute(
                builder: (_) => DetailPage(character: args),
              );
            }
            return MaterialPageRoute(builder: (_) => const HomePage());
          case SearchPage.routeName:
            return MaterialPageRoute(builder: (_) => const SearchPage());
          case ProfilePage.routeName:
            return MaterialPageRoute(builder: (_) => const ProfilePage());
          default:
            return MaterialPageRoute(builder: (_) => const HomePage());
        }
      },
    );
  }
}
