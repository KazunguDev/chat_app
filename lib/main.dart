import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatefulWidget {
  ChatApp({super.key});

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  int currentPageIndex = 0;
  static const List<(Color?, Color? background, ShapeBorder?)> customizations =
      <(Color?, Color?, ShapeBorder?)>[
    (null, null, null), // The FAB uses its default for null parameters.
    (null, Colors.green, null),
    (Colors.white, Colors.green, null),
    (Colors.white, Colors.green, CircleBorder()),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatify',
      theme: ThemeData(primarySwatch: Colors.brown),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              index = (index + 1) % customizations.length;
            });
          },
          child: const Icon(Icons.navigation,),
        ),
        appBar: AppBar(
          title: const Text('Chatify'),
          centerTitle: true,
        ),
        drawer: Drawer(
          elevation: 5,
          backgroundColor: Colors.brown,
            child: ListView(
              padding: EdgeInsets.zero,
              children: const <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    shape: BoxShape.circle
                  ),
                  child: Text(
                    'Chatify',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.message),
                  title: Text('Messages'),
                ),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Profile'),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
              ],
            ),
        ),
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.brown,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.white,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.chat),
              icon: Icon(Icons.chat_outlined),
              label: 'Chats',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.favorite),
              icon: Icon(Icons.favorite_border),
              label: 'Favourites',
            ),
          ],
        ),
        body: <Widget>[
          Container(
            color: Colors.white54,
            alignment: Alignment.center,
            child: const Text('Home Screen'),
          ),
          Container(
            color: Colors.white54,
            alignment: Alignment.center,
            child: const Text('Chat Screen'),
          ),
          Container(
            color: Colors.white54,
            alignment: Alignment.center,
            child: const Text('favourites Screen'),
          ),
        ][currentPageIndex],
      ),
    );
  }
}
