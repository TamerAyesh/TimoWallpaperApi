import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperflutterapi/model/wallpaper_model.dart';
import 'package:wallpaperflutterapi/views/image_view.dart';

Widget wallTile({List<WallpaperModel> wallList, context}) {

  bool isFinished = false;

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      shrinkWrap: true,
      children: wallList.map((e) {
        return GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) =>
                          ImageView(imgUrl: e.srcModel.portrait)));
            },
            child: Hero(
              tag: e.srcModel.portrait,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    e.srcModel.portrait,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
