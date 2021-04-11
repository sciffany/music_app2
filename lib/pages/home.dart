import 'package:flutter/material.dart';
import 'package:music_app2/components/scrollUpWidget.dart';

class Home extends StatefulWidget {

  final String username;
  final String bearerToken;
  Home({Key key, @required this.username, this.bearerToken}) : super(key: key);

  @override
  _HomeState createState() => _HomeState(username, bearerToken);
}

class _HomeState extends State<Home> {

  String username;
  String bearerToken;

  _HomeState(inputUsername, inputBearerToken) {
    username = inputUsername;
    bearerToken = inputBearerToken;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold (
        body: ScrollUpWidget(username: this.username, bearerToken: this.bearerToken)
        )
      );
    }
  }


