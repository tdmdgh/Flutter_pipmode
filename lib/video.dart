import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  VideoPlayerController _controller;
  String _url;
  @override
  void initState() {
    _url =
        "https://5b44cf20b0388.streamlock.net:8443/live/ngrp:live_all/playlist.m3u8";

    _controller = VideoPlayerController.network(_url)
      ..initialize().then((_) => _controller.play());
    super.initState();
  }

  void dispose() {
    super.dispose();
    _controller.pause();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(_controller);
  }
}