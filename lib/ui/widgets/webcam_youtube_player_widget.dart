import 'package:flutter/material.dart';
import 'package:whatsupworld/model/webcam.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WebcamYoutubePlayer extends StatefulWidget {
  final Webcam webcam;

  WebcamYoutubePlayer(this.webcam);

  @override
  _WebcamYoutubePlayerState createState() => _WebcamYoutubePlayerState(this.webcam);
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
    return Container(child: YoutubePlayer(
      controller: _youtubeController,
      liveUIColor: Colors.amber,
    ));

  }

  

  @override
  Widget build(BuildContext context) {    
    return _buildYoutubePlayer(context);
  }
}
