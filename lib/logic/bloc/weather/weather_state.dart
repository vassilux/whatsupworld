part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable {}


class WeatherEmpty extends WeatherState {
  @override
  List<Object> get props => [];  
}

class WeatherLoading extends WeatherState {
  @override
  List<Object> get props => [];  
}

class WeatherLoaded extends WeatherState {
  final Weather weather;
  final List<Weather> forecast;

  WeatherLoaded({@required this.weather, @required this.forecast})
      : assert(weather != null);

  @override
  List<Object> get props => [weather, forecast];
}

class WeatherError extends WeatherState {
  final String error;

  WeatherError(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];

}
