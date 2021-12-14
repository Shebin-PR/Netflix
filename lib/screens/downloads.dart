import 'dart:convert';
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
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
                Expanded(
                  child: FutureBuilder(
                    future: downloads(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return ListView.builder(
                          itemCount: downloadresult.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 150,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: Image.network(
                                              img +
                                                  downloadresult[index]
                                                      ["poster_path"],
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                      Container(
                                          width: 170,
                                          child: Text(
                                            downloadresult[index]["title"],
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
                          });
                    },
                  ),
                ),
                Text("ddddddddddddddddddd"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
