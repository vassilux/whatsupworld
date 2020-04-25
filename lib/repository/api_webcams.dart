import 'dart:convert';

import 'package:whatsupworld/model/webcam.dart';
import 'package:flutter/services.dart' show rootBundle;

class ApiWebcams {
  

  Future<List<Webcam>> get() async {
    try {

      String jsonContent =
        await rootBundle.loadString('assets/webcams.json');

      final parsed = json.decode(jsonContent).cast<Map<String, dynamic>>();

      return parsed.map<Webcam>((json) => new Webcam.fromJson(json)).toList();
    } on Error catch (e) {
      print("exception ${e.toString()}");
      throw e;
    }
  }
}
