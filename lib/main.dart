import 'package:flutter/material.dart';
import 'package:wallpaperflutterapi/views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timo Wallpaper App',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}