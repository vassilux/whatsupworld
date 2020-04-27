import 'package:flutter/material.dart';
import 'package:whatsupworld/model/webcam.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WebcamYoutubePlayer extends StatefulWidget {
  final Webcam webcam;

  WebcamYoutubePlayer(this.webcam);

  @override
  _WebcamYoutubePlayerState createState() =>
      _WebcamYoutubePlayerState(this.webcam);
}

class _WebcamYoutubePlayerState extends State<WebcamYoutubePlayer> {
  final Webcam webcam;

  _WebcamYoutubePlayerState(this.webcam);

  YoutubePlayerController _youtubeController;

  @override
  void initState() {
    var videoId = YoutubePlayer.convertUrlToId(webcam.url);

    _youtubeController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        isLive: true,
        hideThumbnail: true,
        hideControls: true,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  Widget _buildYoutubePlayer(BuildContext context) {
    return Container(
        child: YoutubePlayer(
          
      controller: _youtubeController,
      liveUIColor: Colors.blueAccent,
     
    )
    
    );
  }

  /*
YoutubePlayer(
    context: context,
    videoId: "iLnmTe5Q2Qw",
    flags: YoutubePlayerFlags(
      autoPlay: true,
      showVideoProgressIndicator: true,
    ),
    videoProgressIndicatorColor: Colors.amber,
    progressColors: ProgressColors(
      playedColor: Colors.amber,
      handleColor: Colors.amberAccent,
    ),
    onPlayerInitialized: (controller) {
      _controller = controller;
      _controller.addListener(listener);
    },
),
  */

  @override
  Widget build(BuildContext context) {
    return _buildYoutubePlayer(context);
  }
}
