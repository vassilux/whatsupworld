import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:video_player/video_player.dart';
import 'package:whatsupworld/model/webcam.dart';
import 'package:whatsupworld/ui/widgets/common_scaffold.dart';
import 'package:whatsupworld/ui/widgets/webcam_youtube_player_widget.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WebcamPlayerPage extends StatefulWidget {
  final Webcam webcam;

  WebcamPlayerPage(this.webcam);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState(this.webcam);
}

class _VideoPlayerScreenState extends State<WebcamPlayerPage> {
  //VideoPlayerController _videoController;
  // ChewieController _chewieController;

  VlcPlayerController _videoViewController;

  final Webcam webcam;

  final double playerWidth = 640.0;
  final double playerHeight = 360.0;

  _VideoPlayerScreenState(this.webcam);

  YoutubePlayerController _youtubeController;

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
    // _videoController.dispose();
    // _chewieController.dispose();
    _videoViewController.dispose();
    super.dispose();
  }

  Widget _scaffold(BuildContext context) {
    return CommonScaffold(
      appTitle: webcam.city,
      bodyData: bodyData(context),
      showFAB: false,
      showDrawer: false,
      floatingIcon: Icons.refresh,
      floatingCallback: () {},
      actionFirstIconCallback: () {
        //_showCityChangeDialog(context);
      },
    );
  }

  Widget bodyData(BuildContext context) {
    if (webcam.url.contains("youtu")) {
      return WebcamYoutubePlayer(webcam);
    }

    return buildVlcPlayer(context);
  }

  Widget buildYoutubePlayer(BuildContext context) {
    var videoId = YoutubePlayer.convertUrlToId(webcam.url);

    _youtubeController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        isLive: true,
      ),
    );

    return YoutubePlayer(
      controller: _youtubeController,
      liveUIColor: Colors.amber,
    );

    /*return YoutubePlayer(
                context: context,
                source: "id",
                quality: YoutubeQuality.HD,
                isLive: true,
              );*/
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
    return _scaffold(context);
  }
}
