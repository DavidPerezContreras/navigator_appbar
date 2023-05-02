import 'package:flutter/material.dart';

import 'favorites_page.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GlobalKey<NavigatorState> navigatorKey;

  @override
  void initState() {
    super.initState();
    navigatorKey = GlobalKey<NavigatorState>();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Navigator(
          key: navigatorKey,
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(
                    builder: (context) => HomePage());
              case '/favorites':
                return MaterialPageRoute(
                    builder: (context) =>
                        FavoritesPage());
              default:
                return MaterialPageRoute(
                    builder: (context) => Center(child: Text("Not found")));
            }
          },
        ),
        bottomNavigationBar: MyBottomNavigationBar(
          onNavigate: (routeName) {
            navigatorKey.currentState!.pushNamed(routeName);
          },
        ),
      ),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  final Function(String) onNavigate;

  MyBottomNavigationBar({required this.onNavigate});

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
      ],
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
        if (currentIndex == 0) {
          widget.onNavigate('/');
        } else if (currentIndex == 1) {
          setState(() {
            widget.onNavigate('/favorites');
          });
        }
      },
    );
  }
}
