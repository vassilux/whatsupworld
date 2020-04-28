import 'package:flutter/material.dart';
import 'package:responsive_screen/responsive_screen.dart';
import 'package:whatsupworld/model/webcam.dart';
import 'package:whatsupworld/utils/translations.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:zoom_widget/zoom_widget.dart';

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
        hideThumbnail: false,
        hideControls: true,
        captionLanguage: allTranslations.currentLanguage,
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
    final Function wp = Screen(context).wp;
    final Function hp = Screen(context).hp;

    return Zoom(
        width: wp(100),
        height: hp(80),
        canvasColor: Colors.grey,
        backgroundColor: Colors.blueAccent,
        colorScrollBars: Colors.purple,
        opacityScrollBars: 0.9,
        scrollWeight: 10.0,
        centerOnScale: true,
        enableScroll: true,
        doubleTapZoom: true,
        zoomSensibility: 2.3,
        initZoom: 2.0,
        child: YoutubePlayer(
          controller: _youtubeController,
          liveUIColor: Colors.blueAccent,
          showVideoProgressIndicator: true,
          width: wp(95),
           
           onReady: () {
             print("youtube player ready");
           },        
        ));
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
