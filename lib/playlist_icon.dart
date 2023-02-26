import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';
import 'options.dart';

class PlaylistIcon extends StatelessWidget {
  final int index;
  const PlaylistIcon({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    Function(int) onTap =
        Provider.of<AppState>(context, listen: false).setPlaylist;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GestureDetector(
          onTap: () => onTap(index),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage(Options.playlistIcon(index)))),
        ),
      ),
    );
  }
}
