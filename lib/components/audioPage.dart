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

  bool playing = false;

  final AudioPlayer audioPlayer = AudioPlayer();

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
            Colors.blue,
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
          child: ElevatedButton(
            onPressed: () {
              if (playing) {
                pause();
                setState(() {
                  playing = false;
                });
              }
              else {
                play();
                audioPlayer.onPlayerCompletion.listen((event) {
//                  onComplete();
                });
                setState(() {
                  playing = true;
                });
              }
            },
            child: Icon(
              playing? Icons.headset_off : Icons.headset,
              color: Colors.white,
              size: 80.0,
            ),
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(), primary: Colors.grey[900]),
          )
      )

    );
//

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


