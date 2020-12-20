import 'package:flutter/material.dart';
import 'package:foody/pages/starter_page.dart';
import 'package:foody/pages/HomePage.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StarterPage(),
    theme: ThemeData(fontFamily: 'Roboto'),
  )
);