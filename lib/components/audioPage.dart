import 'package:flutter/material.dart';
import 'package:music_app2/services/track.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPage extends StatefulWidget {
  final Track track;
  final AudioPlayer audioPlayer;
  final Function play;
  final Function pause;

  AudioPage({this.track, this.play, this.pause, this.audioPlayer});

  @override
  _AudioPageState createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {

  bool isPlaying = true;

  @override
  void initState() {
    super.initState();
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
          Image.network(widget.track.imageUrl),
            ElevatedButton(
            onPressed: () {
              if (isPlaying) {
                widget.pause();
                isPlaying = false;
              }
              else {
                widget.play();
                isPlaying = true;
              }
            },
            child: Icon(
              isPlaying? Icons.pause : Icons.play_arrow,
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


}


