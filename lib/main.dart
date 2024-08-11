import 'package:flutter/material.dart';
import 'package:lobhari/screens/blue.dart';
import 'package:lobhari/screens/green.dart';
import 'package:lobhari/screens/red.dart';
import 'package:lobhari/screens/yellow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _index = 0;

  final _pageController = PageController(initialPage: 0);

  void onPgCng(newIndex) {
    setState(() {
      _index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: onPgCng,
          scrollDirection: Axis.horizontal,
          children: const [Green(), Red(), Blue(), Amber()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (newIndex) {
            setState(() {
              _pageController.animateToPage(_index,
                  duration: const Duration(microseconds: 300),
                  curve: Curves.ease);
            });
          },
          currentIndex: _index,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.pink,
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          unselectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              label: "Chats",
              icon: Icon(Icons.message),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
    );
  }
}
