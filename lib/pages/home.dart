import 'package:flutter/material.dart';
import 'package:music_app2/components/audioPage.dart';
import 'package:music_app2/services/Track.dart';


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

  final PageController controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  List<Track> tracks = [
    Track(title: "You Need to Calm Down",
          previewUrl: "https://p.scdn.co/mp3-preview/1a27a21701dae7a7d76fa24d8016735b4ce6f8b1?cid=774b29d4f13844c495f206cafdad9c86",
          imageUrl: "https://p.scdn.co/mp3-preview/1a27a21701dae7a7d76fa24d8016735b4ce6f8b1?cid=774b29d4f13844c495f206cafdad9c86"
          ),
    Track(title: "Blank Space",
          previewUrl: "https://p.scdn.co/mp3-preview/54ad4d8bf804ad67418e5551c3d1da3b1b1ae0a1?cid=774b29d4f13844c495f206cafdad9c86",
          imageUrl: "https://p.scdn.co/mp3-preview/54ad4d8bf804ad67418e5551c3d1da3b1b1ae0a1?cid=774b29d4f13844c495f206cafdad9c86",
          ),
    Track(title: "ME!",
          previewUrl: "https://p.scdn.co/mp3-preview/fc529bd7c299b310b459e9e08afcf5fd6bb9a71f?cid=774b29d4f13844c495f206cafdad9c86",
          imageUrl: "https://p.scdn.co/mp3-preview/fc529bd7c299b310b459e9e08afcf5fd6bb9a71f?cid=774b29d4f13844c495f206cafdad9c86",
          ),

  ];

  @override
  Widget build(BuildContext context) {

    return PageView(
      scrollDirection: Axis.vertical,
      controller: controller,
      children: tracks.map((track) {return AudioPage(track: track);}).toList(),
    );
  }
}

