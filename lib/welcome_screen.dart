import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'main_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _controller = VideoPlayerController.asset('assets/zastavka.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.addListener(() {
          if (_controller.value.position == _controller.value.duration) {
            _animationController.forward();
            Navigator.of(context).push(_createRoute());
          }
        });
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xfffbfde7),
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container());
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const MainScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
            opacity:
                Tween<double>(begin: 1, end: 0).animate(_animationController),
            child: child);
      },
    );
  }
}
