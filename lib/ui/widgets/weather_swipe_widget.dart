import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:weather/weather.dart';
import 'package:whatsupworld/ui/widgets/weather_current_widget.dart';
import 'package:whatsupworld/ui/widgets/weather_temperature_chart.dart';

class WeatherSwipePager extends StatelessWidget {

  const WeatherSwipePager({
    Key key,
    @required this.weather,
    @required this.forecast,
  }) : super(key: key);

  final List<Weather> forecast;
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Swiper(
        itemCount: 2,
        index: 0,
        itemBuilder: (context, index) {
          if (index == 0) {
            return WeatherCurrentWidget(
              weather: weather,
            );
          } else if (index == 1) {
            
            return WeatherTemperatureChart(
              forecast,
              animate: true,
            );
          }
          return Center(child: Text("Empty Widget"),);
        }));
  }
  
}