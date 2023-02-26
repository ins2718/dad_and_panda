import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';
import 'main_list.dart';
import 'video_list.dart';
import 'youtube.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => AppState(),
        child: Consumer<AppState>(
            builder: (context, AppState state, child) => state.isFullscreen
                ? Youtube(key: Key(state.videoIndex.toString()))
                : (state.playlistIndex == null
                    ? const MainList()
                    : const VideoList())));
  }
}
