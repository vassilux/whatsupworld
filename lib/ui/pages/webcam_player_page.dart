import 'package:flutter/material.dart';
import 'package:whatsupworld/model/webcam.dart';
import 'package:whatsupworld/ui/widgets/common_scaffold.dart';
import 'package:whatsupworld/ui/widgets/webcam_vlc_player_widget.dart';
import 'package:whatsupworld/ui/widgets/webcam_youtube_player_widget.dart';

class WebcamPlayerPage extends StatefulWidget {
  final Webcam webcam;

  WebcamPlayerPage(this.webcam);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState(this.webcam);
}

class _VideoPlayerScreenState extends State<WebcamPlayerPage> {  
  final Webcam webcam;

  _VideoPlayerScreenState(this.webcam);


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
   
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

    return WebcamVlcPlayer(webcam);
  }


  @override
  Widget build(BuildContext context) {
    return _scaffold(context);
  }
}
