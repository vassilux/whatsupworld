import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:whatsupworld/config/palette.dart';
import 'package:whatsupworld/ui/widgets/value_tile.dart';
import 'package:whatsupworld/ui/widgets/x_margin_widget.dart';
import 'package:whatsupworld/ui/widgets/y_margin_widget.dart';
import 'package:whatsupworld/utils/translations.dart';
import 'package:whatsupworld/utils/weather_helper.dart';

/// Renders Weather Icon, current, min and max temperatures
class WeatherCurrentWidget extends StatelessWidget {
  final Weather weather;
  const WeatherCurrentWidget({Key key, this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        YMarginWidget(10),
        Icon(
          WeatherHelper.getIconData(weather.weatherIcon),
          size: 70,
          color: Palette.appColorBlue,
        ),
        YMarginWidget(30),        
        Text(
            '${WeatherHelper.formatTemperature(temperature: this.weather.temperature.celsius)}',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w100,
              color: Theme.of(context).accentColor,
            )),
        _buildMinMaxTemeratureRow(context, weather),
        YMarginWidget(20),
        _buildSunWindSpeed(context, weather),
        YMarginWidget(20),
        _buildWindSpeedHumidity(context, weather),

      ],
    );
  }

  Widget _buildMinMaxTemeratureRow(BuildContext context, Weather weather) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ValueTile("Min",
            '${WeatherHelper.formatTemperature(temperature: weather.tempMin.celsius)}'),
        XMarginWidget(20),
        ValueTile("Max",
            '${WeatherHelper.formatTemperature(temperature: weather.tempMax.celsius)}'),
      ],
    );
  }

  Widget _buildSunWindSpeed(BuildContext context, Weather weather){
    
    return Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[           
            ValueTile(
                allTranslations.text("sunrise"),
                formatDate(this.weather.sunrise, [dd, '/', mm, '/', yyyy, ' ', HH, ':', nn])
                    ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Center(
                  child: Container(
                width: 1,
                height: 30,
                color: Theme.of(context)                    
                    .accentColor
                    .withAlpha(50),
              )),
            ),
            ValueTile(
                allTranslations.text("sunset"),
                formatDate(this.weather.sunset, [dd, '/', mm, '/', yyyy, ' ', HH, ':', nn])
                ),
            
           
          ]);
  }

  Widget _buildWindSpeedHumidity(BuildContext context, Weather weather){
     
    return Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            ValueTile(allTranslations.text("wind_speed"), '${this.weather.windSpeed} m/s'),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Center(
                  child: Container(
                width: 1,
                height: 30,
                color: Theme.of(context)                    
                    .accentColor
                    .withAlpha(50),
              )),
            ),           
            
            ValueTile(allTranslations.text("humidity"), '${this.weather.humidity}%'),
          ]);
  }

}
