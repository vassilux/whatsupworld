import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:whatsupworld/ui/widgets/value_tile.dart';
import 'package:whatsupworld/utils/weather_helper.dart';

class WeatherForecastWidget extends StatelessWidget {
  final List<Weather> forecast;

  WeatherForecastWidget({
    Key key,
    this.forecast,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: this.forecast.length,
        separatorBuilder: (context, index) => Divider(
          height: 100,
          color: Colors.white,
        ),
        padding: EdgeInsets.only(left: 10, right: 10),
        itemBuilder: (context, index) {
          final item = this.forecast[index];
          
          return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),              
              child: Center(
                  child: ValueTile(formatDate(item.date, [dd, '/', mm, '/', yyyy, ' ', HH, ':', nn]),
                                    '${item.temperature.celsius.round()}°',  
                                    iconData: WeatherHelper.getIconData(item.weatherIcon)),                  
                 ));
        },
      ),
    );
  }
}
