import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:whatsupworld/config/palette.dart';

class UIData {
  //routes
  static const String homeRoute = "/home";
  static const String dashboardRoute = "/Dashboard";
  static const String newsRoute = "/News";
  static const String weatherRoute = "/Weather";
  static const String settingsRoute = "/Settings";
  static const String currencyRoute = "/Currency";
  static const String webCamsRoute = "/Webcams";

  //strings
  static const String appName = "What's Up World";

  //fonts
  static const String quickFont = "Quicksand";
  static const String ralewayFont = "Raleway";
  static const String quickBoldFont = "Quicksand_Bold.otf";
  static const String quickNormalFont = "Quicksand_Book.otf";
  static const String quickLightFont = "Quicksand_Light.otf";

  //images
  static const String imageDir = "assets/images";
  static const String logoImage = "$imageDir/logo.png";
  //static const String pkImage = "$imageDir/pk.jpg";
  static const String dashboardImage = "$imageDir/dashboard.jpg";
  static const String weatherImage = "$imageDir/weather_cloudy.png";
  static const String loginImage = "$imageDir/login.jpg";
  static const String paymentImage = "$imageDir/payment.jpg";
  static const String settingsImage = "$imageDir/setting.jpeg";
  static const String shoppingImage = "$imageDir/shopping.jpeg";
  static const String timelineImage = "$imageDir/timeline.jpeg";
  static const String verifyImage = "$imageDir/verification.jpg";

  //gneric
  static const String error = "Error";
  static const String success = "Success";
  static const String ok = "OK";
  static const String forgot_password = "Forgot Password?";
  static const String something_went_wrong = "Something went wrong";
  static const String coming_soon = "Coming Soon";

  static const MaterialColor ui_kit_color = Colors.grey;

//colors
  static List<Color> kitGradients = [
    // new Color.fromRGBO(103, 218, 255, 1.0),
    // new Color.fromRGBO(3, 169, 244, 1.0),
    // new Color.fromRGBO(0, 122, 193, 1.0),
    Colors.blueGrey.shade800,
    Colors.black87,
  ];
  static List<Color> kitGradients2 = [
   // Colors.cyan.shade600,
    //Palette.appColorCyan,
     Palette.appColorBlue,
    Colors.white70,
    Palette.appColorRed,
    //Colors.blue.shade900,
   
  ];

  //randomcolor
  static final Random _random = new Random();

  /// Returns a random color.
  static Color next() {
    return new Color(0xFF000000 + _random.nextInt(0x00FFFFFF));
  }

  //// Text
  ///static TextStyle titleStyle = TextStyle(color: Palette.lightblack, fontSize: 16);

  static TextStyle subTitleStyle = TextStyle(color: Palette.subTitleTextColor, fontSize: 12);

  static TextStyle h1Style = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style =
      TextStyle(fontSize: 22);
  static TextStyle h3Style =
      TextStyle(fontSize: 20);
  static TextStyle h4Style =
      TextStyle(fontSize: 18);
  static TextStyle h5Style =
      TextStyle(fontSize: 16);
  static TextStyle h6Style =
      TextStyle(fontSize: 14, color: Palette.accentColor);
}
