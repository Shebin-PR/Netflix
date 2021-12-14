import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  @override
  initState() {
    super.initState();
    bannermovies();
  }

  List bannerresult = [];

  String img = "https://image.tmdb.org/t/p/w500/";

  bannermovies() async {
    var response;
    response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=129e280f3159c3b249cddb0b346d74c4"));

    Map convert = json.decode(response.body);

    bannerresult = convert["results"];

    return bannerresult;
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FutureBuilder(
        future: bannermovies(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Stack(
              children: [
                Container(
                  height: 450,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    img + bannerresult[6]["poster_path"],
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    bottom: 80,
                    left: 50,
                    child: Row(
                      children: [
                        Text(" Goofy "),
                        Icon(
                          Icons.circle,
                          size: 5,
                        ),
                        Text(" Inspiring "),
                        Icon(
                          Icons.circle,
                          size: 5,
                        ),
                        Text(" Fantasy "),
                        Icon(
                          Icons.circle,
                          size: 5,
                        ),
                        Text(" Action "),
                        Icon(
                          Icons.circle,
                          size: 5,
                        ),
                        Text(" Exciting "),
                      ],
                    )),
                Positioned(
                    bottom: 1,
                    left: 70,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.add,
                              size: 30,
                            ),
                            Text(
                              " My List",
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(
                                  Icons.play_arrow,
                                  color: Colors.black,
                                ),
                                Text(
                                  "Play",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            )),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.info_outline,
                              size: 30,
                            ),
                            Text(
                              " Info",
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
