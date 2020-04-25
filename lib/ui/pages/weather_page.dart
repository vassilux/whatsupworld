import 'dart:async';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather.dart';
import 'package:whatsupworld/config/palette.dart';
import 'package:whatsupworld/logic/bloc/weather/weather_bloc.dart';
import 'package:whatsupworld/repository/weather_provider.dart';
import 'package:whatsupworld/ui/widgets/common_scaffold.dart';
import 'package:whatsupworld/ui/widgets/loading_widget.dart';
import 'package:whatsupworld/ui/widgets/weather_current_widget.dart';
import 'package:whatsupworld/ui/widgets/weather_forecast_widget.dart';
import 'package:whatsupworld/ui/widgets/weather_swipe_widget.dart';
import 'package:whatsupworld/ui/widgets/x_margin_widget.dart';
import 'package:whatsupworld/ui/widgets/y_margin_widget.dart';
import 'package:whatsupworld/utils/translations.dart';
import 'package:whatsupworld/utils/uidata.dart';
import 'package:whatsupworld/utils/weather_helper.dart';

class WeatherPage extends StatefulWidget {
  static const String routeName = '/weather';

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage>
    with AutomaticKeepAliveClientMixin {
  final WeatherProvider weatherProvider = new WeatherProvider();

  WeatherBloc _weatherBloc;
  Completer<void> _refreshCompleter;
  String _cityName;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
    _weatherBloc = WeatherBloc(weatherProvider: weatherProvider);

    SchedulerBinding.instance.addPostFrameCallback((timestamp) async {
      await Future.delayed(Duration(milliseconds: 200));
      _weatherBloc.add(FetchWeather(city: "Nice"));
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void didChangeDependencies() {
    //

    super.didChangeDependencies();
  }

  Widget _scaffold() {    
    return CommonScaffold(
        appTitle: allTranslations.text("weather"),
        bodyData: bodyData(),
        showFAB: true,
        showDrawer: false,
        floatingIcon: Icons.refresh,
        floatingCallback: () {
          _weatherBloc.add(FetchWeather(city: "Nice"));
        },
        actionFirstIconCallback: () {
          _showCityChangeDialog(context);
        },
        actionFirstIcon: null,
      );
  }

  Widget bodyData() {    
    
    return SingleChildScrollView(
        child: BlocBuilder(
            bloc: _weatherBloc,
            builder: (_, WeatherState state) {
              if (state is WeatherEmpty) {
                return Center(child: Text('Please Select a Location'));
              }

              if (state is WeatherLoading) {
                return LoadingWidget();
              }

              if (state is WeatherLoaded) {
                return Center(
                    child: Column(children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      YMarginWidget(50),
                      Text(
                        '${state.weather.areaName}',
                        style: Theme.of(context).textTheme.caption.apply(
                            fontSizeFactor: 1.5,
                            fontFamily: UIData.ralewayFont,
                            color: Palette.appColorRed),
                      ),
                      XMarginWidget(20),
                      Text(
                        formatDate(
                            DateTime.now(), [dd, '/', mm, '/', yyyy, ' ']),
                             style: Theme.of(context).textTheme.caption.apply(
                            fontSizeFactor: 1.5,
                            fontFamily: UIData.ralewayFont,
                            color: Palette.appColorRed),
                      ),
                    ],
                  ),
                  WeatherSwipePager(
                      weather: state.weather, forecast: state.forecast),
                  YMarginWidget(30),
                  WeatherForecastWidget(
                    forecast: state.forecast,
                  )
                ]));
              }

              if (state is WeatherError) {
                return Text(
                  allTranslations.text("error_to_load"),
                  style: TextStyle(color: Colors.red),
                );
              }

              return Text(
                allTranslations.text("empty_result_reload"),
                style: TextStyle(color: Colors.red),
              );
            }));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _scaffold();
  }

  void _showCityChangeDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text('Change city', style: TextStyle(color: Colors.black)),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'ok',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                onPressed: () {
                  //_fetchWeatherWithCity();
                  Navigator.of(context).pop();
                },
              ),
            ],
            content: TextField(
              autofocus: true,
              onChanged: (text) {
                _cityName = text;
              },
              decoration: InputDecoration(
                  hintText: 'Name of your city',
                  hintStyle: TextStyle(color: Colors.black),
                  suffixIcon: GestureDetector(
                    onTap: () {
                     /* _fetchWeatherWithLocation().catchError((error) {
                        _fetchWeatherWithCity();
                      });*/
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.my_location,
                      color: Colors.black,
                      size: 16,
                    ),
                  )),
              style: TextStyle(color: Colors.black),
              cursorColor: Colors.black,
            ),
          );
        });
  }


}
