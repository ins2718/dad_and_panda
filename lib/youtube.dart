import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'app_state.dart';
import 'options.dart';

class Youtube extends StatelessWidget {
  const Youtube({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppState state = Provider.of<AppState>(context);
    return YoutubePlayer(
        controller: state.controller!,
        showVideoProgressIndicator: true,
        onReady: () {
          if (state.currentPosition > 0) {
            state.controller!.seekTo(Duration(seconds: state.currentPosition));
          } else if (state.isPlaying) {
            state.controller!.play();
          }
        },
        onEnded: (YoutubeMetaData _) {
          if (state.videoIndex + 1 <
              Options.playlistSize(state.playlistIndex!)) {
            state.setVideoIndex(state.videoIndex + 1);
          } else {
            state.controller!.reset();
            state.setVideoIndex(0);
          }
        },
        bottomActions: [
          CurrentPosition(),
          ProgressBar(
            isExpanded: true,
          ),
          RemainingDuration(),
          const PlaybackSpeedButton(),
          IconButton(
              icon: Icon(
                state.isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
                color: Colors.white,
              ),
              onPressed: () => state.setFullscreen(!state.isFullscreen))
        ]);
  }
}
