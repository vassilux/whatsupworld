
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:responsive_screen/responsive_screen.dart';
import 'package:whatsupworld/model/webcam.dart';
import 'package:zoom_widget/zoom_widget.dart';

class WebcamVlcPlayer extends StatefulWidget {
  final Webcam webcam;

  WebcamVlcPlayer(this.webcam);

  @override
  _WebcamVlcPlayerState createState() => _WebcamVlcPlayerState(this.webcam);
}

class _WebcamVlcPlayerState extends State<WebcamVlcPlayer> {
  
  VlcPlayerController _videoViewController;

  final Webcam webcam;

  final double playerWidth = 640.0;
  final double playerHeight = 360.0;

  _WebcamVlcPlayerState(this.webcam);

  @override
  void initState() {
    
    _videoViewController = new VlcPlayerController(onInit: () {
      _videoViewController.play();
    });

   /* _videoViewController.addListener(() {  
      
    });*/

    super.initState();
  }

  @override
  void dispose() {    
    _videoViewController.dispose();
    super.dispose();
  }

  Widget buildVlcPlayer(BuildContext context) {
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
        child: VlcPlayer(
        url: this.webcam.url,
        controller: _videoViewController,
        placeholder: Container(
          height: hp(90),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
        ),
        aspectRatio: 16 / 9,
      ),
    );
 
  }

  @override
  Widget build(BuildContext context) {
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
        child: VlcPlayer(
        url: this.webcam.url,
        controller: _videoViewController,
        placeholder: Container(
          height: hp(90),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
        ),
        aspectRatio: 16 / 9,
      ),
    );
  }
}
