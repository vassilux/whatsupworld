import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:video_player/video_player.dart';
import 'package:whatsupworld/model/webcam.dart';
import 'package:whatsupworld/ui/widgets/common_scaffold.dart';
import 'package:whatsupworld/ui/widgets/webcam_youtube_player_widget.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WebcamVlcPlayer extends StatefulWidget {
  final Webcam webcam;

  WebcamVlcPlayer(this.webcam);

  @override
  _WebcamVlcPlayerState createState() => _WebcamVlcPlayerState(this.webcam);
}

class _WebcamVlcPlayerState extends State<WebcamVlcPlayer> {
  //VideoPlayerController _videoController;
  // ChewieController _chewieController;

  VlcPlayerController _videoViewController;

  final Webcam webcam;

  final double playerWidth = 640.0;
  final double playerHeight = 360.0;

  _WebcamVlcPlayerState(this.webcam);

  @override
  void initState() {
    /*_videoController = VideoPlayerController.network(webcam.url);

    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      aspectRatio: 19 / 9,
      autoPlay: true,
      looping: true,
    );*/

    _videoViewController = new VlcPlayerController(onInit: () {
      _videoViewController.play();
    });

    _videoViewController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {    
    // _chewieController.dispose();
    _videoViewController.dispose();
    super.dispose();
  }

  Widget buildVlcPlayer(BuildContext context) {
    return Column(children: <Widget>[
      new VlcPlayer(
        url: this.webcam.url,
        controller: _videoViewController,
        placeholder: Container(
          height: 250.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
        ),
        aspectRatio: 16 / 9,
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      new VlcPlayer(
        url: this.webcam.url,
        controller: _videoViewController,
        placeholder: Container(
          height: 250.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
        ),
        aspectRatio: 16 / 9,
      )
    ]);
  }
}
