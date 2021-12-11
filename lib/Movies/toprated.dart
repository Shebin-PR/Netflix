import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TopRatedMovies extends StatefulWidget {
  const TopRatedMovies({Key? key}) : super(key: key);

  @override
  _TopRatedMoviesState createState() => _TopRatedMoviesState();
}

class _TopRatedMoviesState extends State<TopRatedMovies> {
  @override
  initState() {
    super.initState();
    topratedmovies();
  }

  topratedmovies() async {
    var response;
    response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/top_rated?api_key=129e280f3159c3b249cddb0b346d74c4"));
    var a = json.decode(response.body);
    print(a);
    print(response);
    print("hh");
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
