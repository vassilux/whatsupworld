import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';
import 'package:whatsupworld/repository/weather_provider.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final WeatherProvider weatherProvider;

  WeatherBloc({@required this.weatherProvider})
      : assert(weatherProvider != null);


  
  @override
  WeatherState get initialState => WeatherEmpty();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if(event is FetchWeather){
      yield* _mapFetchWeatherToState(event);
    }
  }

  Stream<WeatherState> _mapFetchWeatherToState(FetchWeather event) async* {
    yield WeatherLoading();
    try {
      final weather = await weatherProvider.queryWeather();
      final forecast = await weatherProvider.queryForecast();
      
      yield WeatherLoaded(weather: weather, forecast : forecast);

    } catch (e) {    
      yield WeatherError(e.toString());
    }
  }

}
