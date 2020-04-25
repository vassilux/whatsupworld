


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather/weather.dart';
import 'package:whatsupworld/repository/weather_provider.dart';

void main() async {
  //
   WidgetsFlutterBinding.ensureInitialized();

  WeatherProvider _weatherProvider;

  setUp(() {   
    _weatherProvider = WeatherProvider();
    print("setUp");
  });

  
  test('[currentWeather] Get current weather', () async {

      expect(_weatherProvider, isNotNull);

       Weather currentWeather = await _weatherProvider.queryWeather();

       expect(currentWeather.country, isNotNull);
  });

  

// BEGIN TESTS....
 /*     expect(_locationModel.city, 'London');
expect(_locationModel.countryName.runtimeType, equals(String));
expect(_locationModel.country, isNotNull);
expect(_locationModel.ip, isEmpty);
expect(_locationModel.inEu, isTrue);
expect(_locationModel.languages, contains('EN'));
expect(_locationModel.currency, startsWith('G'));
expect(_locationModel.country, matches('England'));*/
  
}