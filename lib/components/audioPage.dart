import 'package:flutter/material.dart';
import 'package:music_app2/services/Track.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPage extends StatefulWidget {
  final Track track;
  final Function onComplete;
  final AudioPlayer audioPlayer;

  AudioPage({this.track, this.onComplete, this.audioPlayer});

  @override
  _AudioPageState createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {

  bool playing = true;


  @override
  void initState() {
    super.initState();
    play();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.green,
            Colors.blueGrey,
            Colors.black,
          ],
          stops: [
            0.0,
            0.2,
            1.0
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text(widget.track.title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            SizedBox(height: 20),
            ElevatedButton(
            onPressed: () {
              if (playing) {
                pause();
              }
              else {
                play();
              }
            },
            child: Icon(
              playing? Icons.pause : Icons.play_arrow,
              color: Colors.white,
              size: 80.0,
            ),
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(), primary: Colors.grey[900]),
          )
        ]
      )
      )

    );
//

  }

  play() async {
    int result = await widget.audioPlayer.play(widget.track.previewUrl);
    widget.audioPlayer.onPlayerCompletion.listen((event) {
      widget.onComplete();
    });
    if (result == 1) {
      setState(() {
        playing = true;
      });
    } else {
      print("Error playing song");
    }
  }

  pause() async {
    int result = await widget.audioPlayer.pause();
    if (result == 1) {
      setState(() {
        playing = false;
      });
    } else {
      print("Error pausing song");
    }
  }

}


