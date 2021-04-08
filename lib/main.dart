import 'package:flutter/material.dart';
import 'package:music_app2/pages/home.dart';

void main() {
  runApp(MaterialApp(
      routes: {
        '/': (context) => Home(),
      }
  ));
}