import 'package:flutter/material.dart';
import 'package:music_app2/pages/home.dart';
import 'package:music_app2/pages/login.dart';

Future<void> main() async {
  runApp(MaterialApp(
      routes: {
        '/': (context) => Login(),
        '/home': (context) => Home(),
      }
  ));
}