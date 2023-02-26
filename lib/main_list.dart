import 'package:flutter/material.dart';

import 'playlist_icon.dart';

class MainList extends StatelessWidget {
  const MainList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfffbfde7),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: const [
                MainListRow(firstIndex: 0),
                MainListRow(firstIndex: 3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MainListRow extends StatelessWidget {
  final int firstIndex;
  const MainListRow({super.key, required this.firstIndex});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        PlaylistIcon(index: firstIndex),
        PlaylistIcon(index: firstIndex + 1),
        PlaylistIcon(index: firstIndex + 2)
      ]),
    );
  }
}
