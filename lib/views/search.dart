import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperflutterapi/data/tools.dart';
import 'package:wallpaperflutterapi/model/wallpaper_model.dart';
import 'package:wallpaperflutterapi/widgets/brand_new.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperflutterapi/widgets/wall_tile.dart';

class Search extends StatefulWidget {
  final String searchQuery;
  Search(this.searchQuery);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = new TextEditingController();
  List<WallpaperModel> searchWallList = new List();

  Future getSearchWallpaper(String query) async {
    var response = await http.get(
        'https://api.pexels.com/v1/search?query=$query&per_page=25&page=1',
        headers: {'Authorization': apiKey});
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData['photos'].forEach((element) {
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      searchWallList.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    getSearchWallpaper(widget.searchQuery);
    super.initState();
    searchController.text = widget.searchQuery;
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
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "search wallpapers",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        getSearchWallpaper(searchController.text);
                      },
                      icon: Icon(Icons.search),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              wallTile(context: context, wallList: searchWallList),
            ],
          ),
        ),
      ),
    );
  }
}
