import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';
import 'options.dart';
import 'youtube.dart';

class VideoList extends StatelessWidget {
  const VideoList({super.key});

  @override
  Widget build(BuildContext context) {
    AppState state = Provider.of<AppState>(context);
    return Scaffold(
        body: Column(children: [
      Expanded(
          flex: 5,
          child: Container(
              color: Colors.red,
              child: Row(children: [
                Expanded(
                    child: Stack(children: [
                  Container(
                      alignment: Alignment.topLeft,
                      color: Colors.lightGreen,
                      child: TextButton(
                          onPressed: state.menu, child: const Text("back"))),
                  if (state.videoIndex > 0)
                    Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () =>
                                state.setVideoIndex(state.videoIndex - 1),
                            child: const Text("prev")))
                ])),
                Expanded(
                    flex: 2,
                    child: Container(
                        color: Colors.orange,
                        child: Youtube(key: Key(state.videoIndex.toString())))),
                Expanded(
                    child: Container(
                        color: Colors.lightGreen,
                        alignment: Alignment.centerLeft,
                        child: (state.videoIndex ==
                                Options.playlistSize(state.playlistIndex!) - 1)
                            ? null
                            : TextButton(
                                onPressed: () =>
                                    state.setVideoIndex(state.videoIndex + 1),
                                child: const Text("next"))))
              ]))),
      Expanded(
          flex: 2,
          child: Container(
              color: Colors.yellow,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(12),
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (_, index) => Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 5,
                            color: index == state.videoIndex
                                ? Colors.red
                                : Colors.transparent),
                      ),
                      child: GestureDetector(
                        onTap: () => state.setVideoIndex(index),
                        child: Image.network(Options.videoThumbnail(
                            state.playlistIndex!, index)),
                      )),
                  itemCount: Options.playlistSize(state.playlistIndex!))))
    ]));
  }
}
