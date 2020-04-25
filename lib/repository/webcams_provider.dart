


import 'package:whatsupworld/model/webcam.dart';
import 'package:whatsupworld/repository/api_webcams.dart';

class WebCamsProvider {

  final ApiWebcams apiWebcams; 

  WebCamsProvider(this.apiWebcams);

  Future<List<Webcam>> getWebCamst() async {

    List<Webcam> webcamsList = await apiWebcams.get();
    return webcamsList;    
  }


}