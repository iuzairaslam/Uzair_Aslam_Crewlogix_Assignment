import 'dart:io';

import 'package:assignment/Common/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ChewieDemo extends StatefulWidget {
  ChewieDemo({Key? key, this.title, this.srcs}) : super(key: key);

  final String? title;
  List<String>? srcs;
  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<ChewieDemo> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.srcs!.first.split('/').toList().last,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,

      ),
    );
    print(widget.srcs);
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.secColor,
        title: Text(widget.title ?? "Movie Trailer"),
      ),
      body: YoutubePlayer(
        controller: _controller!,
        showVideoProgressIndicator: true,
        progressIndicatorColor: MyColors.priColor,
        progressColors: const ProgressBarColors(
          playedColor: MyColors.priColor,
          handleColor: MyColors.priColor,
        ),
        onReady: () {
          _controller!.addListener(() {});
        },

      ),
    );
  }
}
