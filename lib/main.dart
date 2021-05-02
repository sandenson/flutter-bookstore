import 'package:flutter/material.dart';
import 'package:flutter_bookstore/home/home.dart';
import 'package:flutter_bookstore/shared/widgets/map/map_widget.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Library',
      home: MapWidget(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
