

import 'package:weather/weather.dart';

class MyWeatherStation extends WeatherStation {

  MyWeatherStation(String apiKey) : super(apiKey);

  

}

class WeatherProvider {
  String key = 'aee39e21b0f5e2fbe041dae42f0cb1d6';
  MyWeatherStation _ws;


  //static final WeatherProvider _instance = WeatherProvider._internal();

  /*WeatherProvider._internal() {
    _ws = new WeatherStation(key);
  }*/

  WeatherProvider() {
    //_ws = new WeatherStation(key);return _instance;
    _ws = new MyWeatherStation(key);   
     
  }


  Future<List<Weather>> queryForecast() async {
    List<Weather> fiveDayForecast = await _ws.fiveDayForecast();
    return fiveDayForecast;    
  }

  Future<Weather> queryWeather() async {
    if(_ws == null){
      print("_ws is null");
    }
    Weather currentWeather = await _ws.currentWeather();
  return currentWeather;
    
  }

}