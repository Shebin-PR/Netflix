import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:netflix/Movies/nowplaying.dart';
import 'package:netflix/Movies/toprated.dart';
import 'package:netflix/Movies/popular.dart';

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
        body: CustomScrollView(
///////////////////////////////////app bar///////////////////////////////////-->
          slivers: [
            SliverAppBar(
              floating: true,
              expandedHeight: 100,
              backgroundColor: Colors.blueGrey[900],
              leading: Image.asset(
                "assets/images/netflix.png",
                scale: 8.0,
              ),
              actions: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Tv Shows',
                      style: AppBarTextDecor(),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Movies',
                      style: AppBarTextDecor(),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Categories',
                      style: AppBarTextDecor(),
                    )),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_drop_down_sharp))
              ],
            ),
            PopularMovies(),
            TopRatedMovies(),
            NowPlayingMovies(),
            TopRatedMovies(),
          ],
        ),

/////////////////////////floating action button//////////////////////////////-->

        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white70,
          child: Icon(
            Icons.shuffle,
            color: Colors.teal,
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

  TextStyle AppBarTextDecor() => TextStyle(color: Colors.white, fontSize: 17);

  int _selectedIndex = 0;
  void BottomNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
