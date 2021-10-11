import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Instagram",
          style: TextStyle(fontFamily: "Instagram", fontSize: 30),
        ),
        actions: [
          actionIcon(CupertinoIcons.plus_square),
          actionIcon(CupertinoIcons.heart),
          actionIcon(Icons.chat_bubble_outline),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  storyAvatar("assets/nph.jpg", "nph", true, context),
                  storyAvatar("assets/khaby00.jpg", "khaby00", true, context),
                  storyAvatar("assets/therock.jpg", "therock", true, context),
                  storyAvatar(
                      "assets/cristiano.jpg", "cristiano", false, context),
                  storyAvatar("assets/vancityreynolds.jpg", "vancityreynolds",
                      false, context),
                ],
              ),
            ),
            Divider(
              color: Colors.grey.shade500,
            ),
            postsStream("assets/khaby00.jpg", "khaby00",
                "assets/khaby00_post.jpg", "#learnfromkhaby", context),
            postsStream(
                "assets/nph.jpg",
                "nph",
                "assets/nph_post.jpg",
                "FREEDOM! It is nice to be out in the world again, to be one with nature!",
                context),
            postsStream(
                "assets/vancityreynolds.jpg",
                "vancityreynolds",
                "assets/vancityreynolds_post.jpg",
                "Well hello there...",
                context),
            postsStream(
                "assets/therock.jpg",
                "therock",
                "assets/therock_post.jpg",
                "Friday night training session.",
                context),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(width: 0.5, color: Colors.grey.shade800))),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          iconSize: MediaQuery.of(context).size.width / 12,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.movie_creation_outlined), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: ""),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_alt_circle), label: ""),
          ],
        ),
      ),
    );
  }
}

Widget actionIcon(IconData icon) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Icon(icon),
  );
}

Widget storyAvatar(
    String path, String name, bool newStory, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      children: [
        ClipOval(
          clipBehavior: Clip.antiAlias,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(5), //width of the border
              child: ClipOval(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  width: MediaQuery.of(context).size.width /
                      6, // this width forces the container to be a circle
                  height: MediaQuery.of(context).size.width /
                      6, // this height forces the container to be a circle
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(path),
                        )),
                  ),

                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: newStory
                      ? const [
                          Color(0xFAFF0167),
                          Color(0xFAFF0167),
                          Color(0xE3FF761B),
                          Color(0xFFFFF202)
                        ]
                      : const [Colors.grey, Colors.grey]),
              borderRadius: BorderRadius.circular(32),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(name),
        ),
      ],
    ),
  );
}

Widget postsStream(String avatarPath, String name, String postPath,
    String caption, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 20.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image(
                  image: AssetImage(avatarPath),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(name),
            ),
            const Spacer(),
            const Icon(CupertinoIcons.ellipsis),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Image(
          width: MediaQuery.of(context).size.width,
          image: AssetImage(postPath),
          fit: BoxFit.fitWidth,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(
                CupertinoIcons.heart,
                size: MediaQuery.of(context).size.width / 14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(CupertinoIcons.chat_bubble,
                  size: MediaQuery.of(context).size.width / 14),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(Icons.send_outlined,
                  size: MediaQuery.of(context).size.width / 14),
            ),
            const Spacer(),
            Icon(CupertinoIcons.bookmark,
                size: MediaQuery.of(context).size.width / 14)
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "${NumberFormat.decimalPattern().format(Random().nextInt(100000))} likes",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: RichText(
                text: TextSpan(
                    text: name + " ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: caption,
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "Vew all ${NumberFormat.decimalPattern().format(Random().nextInt(5000))} comments",
                style: const TextStyle(color: Colors.white54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: Text(
                "${NumberFormat.decimalPattern().format(Random().nextInt(11) + 1)} hours ago",
                style: const TextStyle(color: Colors.white60),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
