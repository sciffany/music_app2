import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


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
        home:Scaffold (
          appBar: AppBar(
              title: Text("Nooble")
          ),
          body: ScrollUpWidget()
        )
    );
  }
}


class ScrollUpWidget extends StatefulWidget {
  @override
  _ScrollUpWidgetState createState() => _ScrollUpWidgetState();
}

class _ScrollUpWidgetState extends State<ScrollUpWidget> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    return PageView(
      scrollDirection: Axis.vertical,
      controller: controller,
      children: <Widget>[
        Center(
          child: Text('First Page'),
        ),
        Center(
          child: Text('Second Page'),
        ),
        AudioPage()
      ],
    );
  }
}


class AudioPage extends StatefulWidget {
  @override
  _AudioPageState createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {

  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          body: Column(
            children: [ ElevatedButton(
              onPressed: () {
                play();
              },
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 60.0,
              ),
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(), primary: Colors.deepPurple),
            )
          ]
        )
      );

  }

  play() async {
    int result = await audioPlayer.play("https://p.scdn.co/mp3-preview/fc529bd7c299b310b459e9e08afcf5fd6bb9a71f?cid=774b29d4f13844c495f206cafdad9c86");
    print(result);
    if (result == 1) {
      // success
    }
  }

  pause() async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      // success
    }
  }
}


