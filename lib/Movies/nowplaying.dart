import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class NowPlayingMovies extends StatefulWidget {
  const NowPlayingMovies({Key? key}) : super(key: key);

  @override
  _NowPlayingMoviesState createState() => _NowPlayingMoviesState();
}

class _NowPlayingMoviesState extends State<NowPlayingMovies> {
  @override
  // ignore: must_call_super
  void initState() {
    // ignore: todo
    // TODO: implement initState
    nowplaying();
  }

  List nowplayingresult = [];
  String img = "https://image.tmdb.org/t/p/w500/";

  nowplaying() async {
    var response;

    response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/now_playing?api_key=129e280f3159c3b249cddb0b346d74c4"));

    Map convert = json.decode(response.body);

    nowplayingresult = convert["results"];

    print(nowplayingresult);

    return nowplayingresult;
  }

  @override
  Widget build(BuildContext context) {
        return SliverToBoxAdapter(
      child: Container(
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 6, top: 6, left: 6),
              child: Text(
                "Now Playing",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: nowplaying(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: nowplayingresult.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            width: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                img + nowplayingresult[index]["poster_path"],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
