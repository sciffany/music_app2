import 'package:flutter/material.dart';
import 'package:music_app2/components/audioPage.dart';
import 'package:music_app2/services/track.dart';
import 'package:audioplayers/audioplayers.dart';

class ScrollUpWidget extends StatefulWidget {

  final String username;
  final String bearerToken;

  ScrollUpWidget({this.username, this.bearerToken});

  @override
  _ScrollUpWidgetState createState() => _ScrollUpWidgetState();
}

class _ScrollUpWidgetState extends State<ScrollUpWidget> {

  bool isPlaylistComplete = false;
  bool isLoading = true;
  bool isFirstTimeLoading = true;

  final PageController controller = PageController(initialPage: 0);
  final AudioPlayer audioPlayer = AudioPlayer();
  List<Track> loadedTracks = [];
  Track trackInstance = Track();
  bool isPlaying = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  scrollToPage(index) {
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Column(children:[
      Expanded(child:
      NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (!isLoading && !isPlaylistComplete &&
                scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
              loadData();
            }
            return true;
          },

          child: PageView.builder(
              onPageChanged: (pageNumber) { play(pageNumber); },
              scrollDirection: Axis.vertical,
              controller: controller,
              itemCount: loadedTracks.length,
              itemBuilder: (context, index) {
                return AudioPage(track: loadedTracks[index],
                    audioPlayer: audioPlayer,
                    play: () {play (index); },
                    pause: pause
                );
              }
          )
      )
      ),
      Container(
        height: isLoading ? 50.0 : 0,
        color: Colors.transparent,
        child: Center(
          child: new CircularProgressIndicator(),
        ),
      ),
    ]
    );
  }

  loadData() async {
    setState(() {
      isLoading = true;
    });

    List<Track> newTracks = await trackInstance.getTrackItems(
                            widget.bearerToken, widget.username, loadedTracks.length);
    setState (
            () {
          loadedTracks = loadedTracks + newTracks;
          isLoading = false;
        }
    );

    if (newTracks.length == 0) {
      isPlaylistComplete = true;
    }

    if (isFirstTimeLoading) {
      play(0);
      isFirstTimeLoading = false;
    }

  }

  play(index) async {
    int result = await audioPlayer.play(loadedTracks[index].previewUrl);
    audioPlayer.onPlayerCompletion.listen((event) {
      if (index >= loadedTracks.length) {
        loadData();
      }
      scrollToPage(index+1);
    });
    if (result == 1) {
      setState(() {
        isPlaying = true;
      });
    } else {
      print("Error playing song");
    }
  }

  pause() async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      setState(() {
        isPlaying = false;
      });
    } else {
      print("Error pausing song");
    }
  }
}