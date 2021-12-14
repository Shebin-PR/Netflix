import 'package:flutter/material.dart';
import 'package:netflix/Movies/nowplaying.dart';
import 'package:netflix/Movies/toprated.dart';
import 'package:netflix/Movies/popular.dart';
import 'package:netflix/Movies/upcoming.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle AppBarTextDecor() =>
      TextStyle(color: Colors.white, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
/////////////////////////////////--app bar--/////////////////////////////////-->
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            leading: Image.asset(
              "assets/images/netflix.png",
              scale: 6.0,
            ),
            expandedHeight: 130,
            pinned: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
                iconSize: 30,
              ),
              Image.asset(
                "assets/images/avatar.png",
                scale: 11,
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                ],
              ),
              background: Container(
                color: Colors.transparent,
              ),
            ),
          ),

/////////////////////////// -- movies -- ////////////////////////////////////-->
          // HomeBanner(),
          PopularMovies(),
          UpcomingMovies(),
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
    );
  }
}
