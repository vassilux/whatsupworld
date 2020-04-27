import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsupworld/model/webcam.dart';


class WebCamsProvider {
  Firestore _firestoreDb = Firestore.instance;

  //final ApiWebcams apiWebcams;

  WebCamsProvider();

  Future<List<Webcam>> getAllWebCams() async {
   
    var documents  = 
         (await _firestoreDb.collection('webcams').orderBy("country").getDocuments()).documents;

    List<Webcam> webcamsList = documents.map((e) => Webcam.fromJson(e.data)).toList();
    return webcamsList;
  }
}
