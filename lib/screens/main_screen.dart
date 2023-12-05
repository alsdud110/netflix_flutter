import 'package:flutter/material.dart';
import 'package:netflix_flutter/constants.dart';
import 'package:netflix_flutter/models/nav_item.dart';
import 'package:netflix_flutter/screens/coming/coming_screen.dart';
import 'package:netflix_flutter/screens/contents_list/content_list_screen.dart';
import 'package:netflix_flutter/screens/home/home_screen.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "/main_screen";
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const IndexedStack(
        children: [
          HomeScreen(),
          ComingScreen(),
          ContentsListScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: kDarkColor,
        selectedFontSize: 12.0,
        onTap: (value) => setState(() {
          _selectedIndex = value;
        }),
        items: List.generate(
          navItems.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(navItems[index].icon),
            label: navItems[index].label,
          ),
        ),
      ),
    );
  }
}
