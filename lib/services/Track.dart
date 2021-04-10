import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Track {
  String previewUrl;
  String imageUrl;
  String title;

  Track({this.title, this.previewUrl, this.imageUrl});
  final String bearerToken = env['BEARER_TOKEN'];
  final String userId = env['USER_ID'];
  Dio dio = Dio();

  Future <List<Track>> getTrackItems(offset) async {
    final String playListId = await getPlaylistId();
    final response = await dio.get("https://api.spotify.com/v1/playlists/$playListId/tracks?limit=2&offset=$offset&market=US",
      options: Options(
        headers: {
          "Authorization": "Bearer $bearerToken", // set content-length
        },
      )
    );
    List<dynamic> playlistItems = response.data["items"];
    try {
      List<Track> tracks = playlistItems.map((playlistItem) {
        Track track = Track(
            previewUrl: playlistItem["track"]["preview_url"],
            imageUrl: playlistItem["track"]["album"]["images"][0]["url"],
            title: playlistItem["track"]["name"]
        );
        return track;
      }).toList();
      return tracks;
    } catch (error) {
      throw ("Parse playlist items error");
    }
;
  }

  Future<String> getPlaylistId() async {
    final response = await dio.get("https://api.spotify.com/v1/users/$userId/playlists",
      options: Options(
        headers: {
          "Authorization": "Bearer $bearerToken", // set content-length
        },
      )
    );
    try {
      final String playlistId = response.data["items"][0]["id"];
      return playlistId;
    } catch (error) {
      throw("Unable to find playlist id");
    }

  }
}