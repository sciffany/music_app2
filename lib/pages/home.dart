import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold (
          appBar: AppBar(
              title: Text("Nooble3")
          ),
          body: Column(
              children: <Widget>[
                ElevatedButton(
                  child: Text("Play"),
                  onPressed: () {
                    play();
                  },
                )
              ]
          ),
        )
    );
  }

  play() async {
    int result = await audioPlayer.play("https://p.scdn.co/mp3-preview/76e7caf9659c0ab69a1e57a7f3d17af814680f13?cid=774b29d4f13844c495f206cafdad9c86");
    if (result == 1) {
      // success
    }
  }
}

