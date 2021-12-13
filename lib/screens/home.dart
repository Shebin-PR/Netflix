import 'package:flutter/material.dart';
import 'package:netflix/homepage.dart';
import 'package:netflix/screens/comingsoon.dart';
import 'package:netflix/screens/downloads.dart';
import 'package:netflix/screens/fastlaughs.dart';
import 'package:netflix/screens/games.dart';
import 'package:netflix/widgets/homebanner.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _pages = [HomePage(), Games(), ComingSoon(), HomeBanner(), Downloads()];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey[600],
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(
          color: Colors.white,
        ),
        currentIndex: _selectedIndex,
        onTap: (newIndex) {
          setState(() {
            _selectedIndex = newIndex;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.games),
            label: "Games",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_carousel_rounded),
            label: "Coming Soon",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_emotions_outlined),
            label: "Fast Laughs",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_circle_down),
            label: "Downloads",
          ),
        ],
      ),
    );
  }
}
