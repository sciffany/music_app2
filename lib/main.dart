import 'package:flutter/material.dart';
import 'package:music_app2/pages/home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

Future<void> main() async {
  await DotEnv.load(fileName: ".env");
  runApp(MaterialApp(
      routes: {
        '/': (context) => Home(),
      }
  ));
}