import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperflutterapi/data/data.dart';
import 'package:wallpaperflutterapi/model/categories_model.dart';
import 'package:wallpaperflutterapi/data/tools.dart';
import 'package:wallpaperflutterapi/model/wallpaper_model.dart';
import 'package:wallpaperflutterapi/views/categories.dart';
import 'package:wallpaperflutterapi/views/search.dart';
import 'package:wallpaperflutterapi/widgets/list_tile.dart';
import 'package:wallpaperflutterapi/widgets/brand_new.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperflutterapi/widgets/wall_tile.dart';
import 'package:wallpaperflutterapi/widgets/wall_tile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoriesModel> catList = new List();
  List<WallpaperModel> wallList = new List();
  TextEditingController textController = new TextEditingController();

  Future getTrendWallpaper() async {
    var response =
        await http.get(curatedUrl, headers: {'Authorization': apiKey});
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData['photos'].forEach((element) {
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallList.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    getTrendWallpaper();
    catList = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.grey[200],
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                          hintText: "search wallpapers",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => Search(textController.text),
                            ));
                      },
                      icon: Icon(Icons.search),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 50,
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: catList.length,
                    itemBuilder: (context, index) {
                      return ListTileCat(
                        title: catList[index].categoriesName,
                        imgUrl: catList[index].imgURL,
                      );
                    }),
              ),
              SizedBox(
                height: 16,
              ),
              wallTile(context: context, wallList: wallList),
            ],
          ),
        ),
      ),
    );
  }
}
