import 'package:flutter/material.dart';
import 'package:music_app2/components/scrollUpWidget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold (
        body: ScrollUpWidget()
        )
      );
    }
  }


