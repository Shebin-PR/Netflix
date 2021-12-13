import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:netflix/Movies/nowplaying.dart';
import 'package:netflix/Movies/toprated.dart';
import 'package:netflix/Movies/popular.dart';
import 'package:netflix/screens/comingsoon.dart';
import 'package:netflix/screens/downloads.dart';
import 'package:netflix/screens/fastlaughs.dart';
import 'package:netflix/screens/games.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 

  TextStyle AppBarTextDecor() => TextStyle(color: Colors.white, fontSize: 17);

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
/////////////////////////////////--app bar--/////////////////////////////////-->
          slivers: [
            SliverAppBar(
              floating: true,
              expandedHeight: 100,
              backgroundColor: Colors.grey[900],
              leading: Image.asset(
                "assets/images/netflix.png",
                scale: 6.0,
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

/////////////////////////// -- movies -- ////////////////////////////////////-->
            PopularMovies(),
            TopRatedMovies(),
            NowPlayingMovies(),
            TopRatedMovies(),
          ],
        ),

///////////////////////--floating action button--////////////////////////////-->

        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white70,
          child: Icon(
            Icons.shuffle,
            color: Colors.red[900],
          ),
        ),

///////////////////////--Bottom Navigation--/////////////////////////////////-->

        
      ),
    );
  }
}
