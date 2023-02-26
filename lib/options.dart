import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video {
  final String url;
  const Video(this.url);
}

class Playlist {
  final List<Video> videos;
  final int index;
  late String icon;
  Playlist(this.videos, this.index) {
    icon = "assets/$index.jpg";
  }
}

class Options {
  static final List<Playlist> _playlists = [
    Playlist(const [
      Video("Wye7uRULkAA"),
      Video("4hWfamD0AdU"),
      Video("huiPghHpO9Q"),
      Video("A19V0ZmxbxA"),
      Video("Um7pbFwk85s"),
      Video("TGORQhCGKsY"),
      Video("6UXmXe9cZ_E"),
      Video("q4MYxIuTa-g"),
      Video("7H50jOspIPE"),
      Video("5kdYNzQ3rTY"),
      Video("o-sP1k68_AU")
    ], 0),
    Playlist(const [
      Video("Wye7uRULkAA"),
      Video("4hWfamD0AdU"),
      Video("huiPghHpO9Q")
    ], 1),
    Playlist(const [Video("Wye7uRULkAA"), Video("4hWfamD0AdU")], 2),
    Playlist(const [Video("Wye7uRULkAA")], 3),
    Playlist(const [Video("Wye7uRULkAA"), Video("4hWfamD0AdU")], 4),
    Playlist(const [
      Video("Wye7uRULkAA"),
      Video("4hWfamD0AdU"),
      Video("huiPghHpO9Q")
    ], 5)
  ];

  static String playlistIcon(int index) {
    return _playlists[index].icon;
  }

  static List<Video> playlist(int index) {
    return _playlists[index].videos;
  }

  static int playlistSize(int index) {
    return _playlists[index].videos.length;
  }

  static String videoThumbnail(int playlistIndex, int videoIndex) {
    return YoutubePlayer.getThumbnail(
        videoId: _playlists[playlistIndex].videos[videoIndex].url);
  }

  static String videoId(int playlistIndex, int videoIndex) {
    return _playlists[playlistIndex].videos[videoIndex].url;
  }
}
