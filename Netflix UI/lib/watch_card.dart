import 'package:flutter/material.dart';

class WatchCard extends StatelessWidget {
  final String text;
  final List<Widget> widgets;

  WatchCard(this.text, this.widgets);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              text,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3.7,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: widgets,
            ),
          )
        ],
      ),
    );
  }
}
