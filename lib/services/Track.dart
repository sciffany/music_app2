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

  Future <List<Track>> getTrackItems() async{
    final String playListId = await getPlaylistId();
    final response = await dio.get("https://api.spotify.com/v1/playlists/$playListId/tracks",
      options: Options(
        headers: {
          "Authorization": "Bearer $bearerToken", // set content-length
        },
      )
    );
    print(response.data["items"][0]["track"]["preview_url"]);
    return [];
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