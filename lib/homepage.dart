import 'package:flutter/material.dart';
import 'package:netflix/Movies/toprated.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Container(
          child: Column(
            children: [
              Text(
                "Hello world",
                style: TextStyle(color: Colors.white),
              ),
              TopRatedMovies(),
            ],
          ),
        ),

/////////////////////////Bottom Navigation///////////////////////////////////-->

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
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
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey[600],
          selectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(
            color: Colors.white,
          ),
          onTap: BottomNavBar,
        ),
      ),
    );
  }

  int _selectedIndex = 0;
  void BottomNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
