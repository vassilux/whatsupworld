import 'package:flutter/widgets.dart';
import 'package:whatsupworld/utils/weather_icons.dart';

class WeatherHelper {


static IconData getIconData(String iconCode){    
    switch(iconCode){
      case '01d': return WeatherIcons.clear_day;
      case '01n': return WeatherIcons.clear_night;
      case '02d': return WeatherIcons.few_clouds_day;
      case '02n': return WeatherIcons.few_clouds_day;
      case '03d':
      case '04d':
        return WeatherIcons.clouds_day;
      case '03n':
      case '04n':
        return WeatherIcons.clear_night;
      case '09d': return WeatherIcons.shower_rain_day;
      case '09n': return WeatherIcons.shower_rain_night;
      case '10d': return WeatherIcons.rain_day;
      case '10n': return WeatherIcons.rain_night;
      case '11d': return WeatherIcons.thunder_storm_day;
      case '11n': return WeatherIcons.thunder_storm_night;
      case '13d': return WeatherIcons.snow_day;
      case '13n': return WeatherIcons.snow_night;
      case '50d': return WeatherIcons.mist_day;
      case '50n': return WeatherIcons.mist_night;
      default: return WeatherIcons.clear_day;
    }
  }

  static String formatTemperature(
      {double temperature,
      int positions = 0,
      round = true,
      metricUnits = true}) {
    var unit = "°C";

    if (!metricUnits) {
      unit = "°F";
    }

    if (round) {
      temperature = temperature.floor().toDouble();
    }

    return "${temperature.toStringAsFixed(positions)} $unit";
  }

}