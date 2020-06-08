import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperflutterapi/data/tools.dart';
import 'package:wallpaperflutterapi/model/wallpaper_model.dart';
import 'package:wallpaperflutterapi/widgets/brand_new.dart';
import 'package:wallpaperflutterapi/widgets/wall_tile.dart';


class Categories extends StatefulWidget {

  final String categoryName;
  Categories({this.categoryName});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  List<WallpaperModel> catWallList = new List();

  Future getCatWallpaper(String query) async {
    var response = await http.get(
        'https://api.pexels.com/v1/search?query=$query&per_page=25&page=1',
        headers: {'Authorization': apiKey});
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData['photos'].forEach((element) {
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      catWallList.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    getCatWallpaper(widget.categoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: brandNameNew(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            children: <Widget>[
              wallTile(wallList: catWallList, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
