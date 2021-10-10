import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netflix_clone/watch_card.dart';

class Homepage extends StatelessWidget {
  static const id = "/homepage";

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.black));
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: double.maxFinite,
                height: 600.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/lucif.jpg'),
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black,
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Image(
                                  image: AssetImage("images/netflix_logo.png"),
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.cast),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.tag_faces),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text("TV Shows"),
                                const Text("Movies"),
                                Row(
                                  children: const [
                                    Text("Categories"),
                                    Icon(Icons.arrow_drop_down),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Crime",
                              style: TextStyle(fontSize: 20),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Icon(
                                Icons.circle,
                                size: 8,
                              ),
                            ),
                            Text("Fantasy", style: TextStyle(fontSize: 20)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Icon(
                                Icons.circle,
                                size: 8,
                              ),
                            ),
                            Text("Drama", style: TextStyle(fontSize: 20))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: const [
                                Icon(Icons.add),
                                Text("My List"),
                              ],
                            ),
                            MaterialButton(
                              onPressed: () {},
                              child: Row(children: const [
                                Icon(
                                  CupertinoIcons.play_fill,
                                  color: Colors.black,
                                ),
                                Text("Play",
                                    style: TextStyle(color: Colors.black))
                              ]),
                              color: Colors.white,
                            ),
                            Column(
                              children: const [
                                Icon(Icons.info_outline),
                                Text("Info"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )),
            WatchCard("Continue Watching for Dean", [
              card("images/peakyblinders.jpg", context),
              card("images/himym.jpg", context),
              card("images/codegeass.jpg", context),
            ]),
            WatchCard("Popular on Netflix", [
              card("images/friends.jpg", context),
              card("images/sherlock.jpg", context),
              card("images/deathnote.jpg", context),
              card("images/breakingbad.jpg", context),
            ]),
            WatchCard("Trending Now", [
              card("images/lucif.jpg", context),
              card("images/squidgame.jpg", context),
              card("images/rickandmorty.jpg", context),
            ]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showUnselectedLabels: true,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        unselectedLabelStyle: const TextStyle(overflow: TextOverflow.visible),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_collection_outlined),
              label: "Coming Soon"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.arrow_down_to_line),
              label: "Downloads"),
        ],
      ),
    );
  }
}

Widget card(String path, context) {
  return Container(
      padding: const EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        child: Image(image: AssetImage(path)),
      ));
}
