import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Downloads extends StatefulWidget {
  const Downloads({Key? key}) : super(key: key);

  @override
  _DownloadsState createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  @override
  void initState() {
    // ignore: todo
    super.initState;
    downloads();
  }

  List downloadresult = [];

  downloads() async {
    var response;
    response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/upcoming?api_key=129e280f3159c3b249cddb0b346d74c4"));
    Map convert = json.decode(response.body);

    downloadresult = convert["results"];

    return downloadresult;
  }

  String img = "https://image.tmdb.org/t/p/w500/";

  final angle1 = -18 * pi / 360;
  final angle2 = 18 * pi / 360;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: NestedScrollView(
        headerSliverBuilder: (context, inheritedNotifier) => [
          //////////////// - -  app bar - -////////////////////////////////////////
          SliverAppBar(
            floating: false,
            pinned: false,
            snap: false,
            backgroundColor: Colors.black,
            expandedHeight: 130,
            title: Text(
              "Downloads",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
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
              background: Container(),
              title: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.settings_outlined,
                          size: 15,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Smart Downloads",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    Icon(
                      Icons.edit_outlined,
                      size: 15,
                    )
                  ],
                ),
              ),
            ),
          ),

///////////////////// -- body --///////////////////////////////////////
        ],
        body: FutureBuilder(
          future: downloads(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List dload = snapshot.data as List;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView(
                    children: [
                      /// -- avatar -- ////
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/avatar.png",
                            scale: 11,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Shebin",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),

                      ////////// - - movies - - ////
                      movieslist(dload, 1),
                      movieslist(dload, 2),
                      movieslist(dload, 3),
                      movieslist(dload, 4),
                      movieslist(dload, 5),
                      movieslist(dload, 6),
                      movieslist(dload, 7),
                      movieslist(dload, 8),

                      Divider(
                        color: Colors.grey,
                      ),

                      Text(
                        "Introducing Downloads for you",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "We'll download a personalised selection of movies and shows for you, so there's always something to watch on your phone.",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      ),

                      /// -- stack -- ///////////
                      FutureBuilder(
                        future: downloads(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            List dload = snapshot.data as List;
                            return Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 350,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[900],
                                      shape: BoxShape.circle),
                                ),
                                Positioned(
                                    top: 75,
                                    left: 20,
                                    child: Transform.rotate(
                                      angle: angle1,
                                      child: Image.network(
                                        img + dload[3]["poster_path"],
                                        scale: 3,
                                      ),
                                    )),
                                Positioned(
                                    top: 80,
                                    left: 210,
                                    child: Transform.rotate(
                                      angle: angle2,
                                      child: Image.network(
                                        img + dload[4]["poster_path"],
                                        scale: 3,
                                      ),
                                    )),
                                Positioned(
                                    top: 40,
                                    left: 105,
                                    child: Image.network(
                                      img + dload[1]["poster_path"],
                                      scale: 2.7,
                                    )),
                              ],
                            );
                          }
                          return SizedBox();
                        },
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "SET UP",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Find more to download",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black,
                          )),
                    ],
                  ),
                ),
              );
            }
            return Center(
                child: Text("LOADING . . . !",
                    style: TextStyle(
                      color: Colors.grey,
                    )));
          },
        ),
      ),
    );
  }

//////////// list movie //////////////////////////////////////////
  movieslist(List<dynamic> dload, int index) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100,
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(img + dload[index]["backdrop_path"],
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                  width: 170,
                  child: Text(
                    dload[index]["title"],
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
