import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models/character.dart';
import 'views/home/home_page.dart';
import 'views/detail/detail_page.dart';
import 'views/search/search_page.dart';
import 'views/profile/profile_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Rick and Morty MVC',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: HomePage.routeName,
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case HomePage.routeName:
              return MaterialPageRoute(
                builder: (_) => const HomePage(),
                settings: settings,
              );
            case DetailPage.routeName:
              if (settings.arguments is! Character) {
                return MaterialPageRoute(builder: (_) => const HomePage());
              }
              return MaterialPageRoute(
                builder: (_) => const DetailPage(),
                settings: settings,
              );
            case SearchPage.routeName:
              return MaterialPageRoute(
                builder: (_) => const SearchPage(),
                settings: settings,
              );
            case ProfilePage.routeName:
              return MaterialPageRoute(
                builder: (_) => const ProfilePage(),
                settings: settings,
              );
            default:
              return MaterialPageRoute(builder: (_) => const HomePage());
          }
        },
      ),
    );
  }
}
