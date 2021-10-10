import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            canvasColor: Colors.black,
            textTheme: ThemeData.dark().textTheme.apply(
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                )),
        title: 'Netflix UI Clone',
        home: Homepage());
  }
}
