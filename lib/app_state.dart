import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'options.dart';

class AppState extends ChangeNotifier {
  bool isFullscreen = false;
  int? playlistIndex;
  int videoIndex = 0;
  YoutubePlayerController? controller;
  int currentPosition = 0;
  bool isPlaying = false;

  void setFullscreen(bool fullscreen) {
    isFullscreen = fullscreen;
    currentPosition = max(controller!.value.position.inSeconds - 1, 0);
    isPlaying = controller == null ? false : controller!.value.isPlaying;
    controller = initController();
    notifyListeners();
  }

  void setVideoIndex(int index) {
    if (videoIndex != index) {
      currentPosition = 0;
      videoIndex = index;
      isPlaying = controller == null ? false : controller!.value.isPlaying;
      controller = initController();
      notifyListeners();
    }
  }

  void setPlaylist(int index) {
    playlistIndex = index;
    videoIndex = 0;
    currentPosition = 0;
    controller = initController();
    isPlaying = false;
    notifyListeners();
  }

  void menu() {
    playlistIndex = null;
    videoIndex = 0;
    currentPosition = 0;
    controller = null;
    isPlaying = false;
    notifyListeners();
  }

  YoutubePlayerController initController() {
    if (controller != null) {
      // controller!.dispose();
    }
    return YoutubePlayerController(
      initialVideoId: Options.videoId(playlistIndex!, videoIndex),
      flags: const YoutubePlayerFlags(autoPlay: false),
    );
  }
}
