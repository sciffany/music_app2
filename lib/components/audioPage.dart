import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app2/services/Track.dart';

class AudioPage extends StatefulWidget {
  final Track track;

  AudioPage({this.track});

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
          body: Center(
              child: ElevatedButton(
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
          )
      );

  }

  play() async {
    int result = await audioPlayer.play(widget.track.previewUrl);
    print(result);
    if (result == 1) {
      // success
    } else {
      print("Error playing song");
    }
  }

  pause() async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      // success
    } else {
      print("Error pausing song");
    }
  }
}


