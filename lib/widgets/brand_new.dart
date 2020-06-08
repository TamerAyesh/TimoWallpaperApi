import 'package:flutter/material.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        'Timo',
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
      Text(
        'Wallpaper',
        style: TextStyle(
          color: Colors.grey[800],
        ),
      ),
    ],
  );
}

Widget brandNameNew() {
  return Padding(
    padding: const EdgeInsets.only(left: 55.0),
    child: Row(
      children: <Widget>[
        Text(
          'Timo',
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        Text(
          'Wallpaper',
          style: TextStyle(
            color: Colors.grey[800],
          ),
        ),
      ],
    ),
  );
}
