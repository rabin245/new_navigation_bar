import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages = [
    Center(
      child: Container(
        color: Colors.red,
        child: const Text('home'),
        padding: const EdgeInsets.all(80),
      ),
    ),
    Center(
      child: Container(
        color: Colors.teal,
        child: const Text('mail'),
        padding: const EdgeInsets.all(80),
      ),
    ),
    Center(
      child: Container(
        color: Colors.yellow,
        child: const Text('settings'),
        padding: const EdgeInsets.all(80),
      ),
    ),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Bar'),
      ),
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        animationDuration: const Duration(milliseconds: 1300),
        onDestinationSelected: (i) => setState(() {
          index = i;
        }),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        height: 60,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'home',
            tooltip: 'Show the home page',
          ),
          NavigationDestination(
            icon: Icon(Icons.mail_outline),
            selectedIcon: Icon(Icons.mail),
            label: 'mail',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
      ),
    );
  }
}
