import 'package:flutter/material.dart';
import 'package:music_app2/components/audioPage.dart';
import 'package:music_app2/services/Track.dart';
import 'package:audioplayers/audioplayers.dart';

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


class ScrollUpWidget extends StatefulWidget {
  @override
  _ScrollUpWidgetState createState() => _ScrollUpWidgetState();
}

class _ScrollUpWidgetState extends State<ScrollUpWidget> {

  bool isLoading = true;
  final PageController controller = PageController(initialPage: 0);
  final AudioPlayer audioPlayer = AudioPlayer();
  List<Track> loadedTracks = [];
  Track trackInstance = Track();


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
    Expanded(child: PageView.builder(
      scrollDirection: Axis.vertical,
      controller: controller,
      itemCount: loadedTracks.length,
      itemBuilder: (context, index) {
        return AudioPage(track: loadedTracks[index],
                         audioPlayer: audioPlayer,
                         onComplete: () { if (index<loadedTracks.length)
                                          {scrollToPage(index+1); } else {
                                            loadData();
                                          }
                                        },

                        );
            }
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

    List<Track> newTracks = await trackInstance.getTrackItems(loadedTracks.length);
    setState (
        () {
          loadedTracks = loadedTracks + newTracks;
          isLoading = false;
        }

    );

  }
}

