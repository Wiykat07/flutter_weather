part of 'weatherbloc.dart';

class HasLocation extends WeatherState {
  final LocationData location;

  HasLocation({required this.location});
}

class HasWeather extends WeatherState {
  final CurrentWeather weather;

  HasWeather({required this.weather});
}

class LocationError extends WeatherState {}

class LocationUpdating extends WeatherState {}

class UpdatingWeather extends WeatherState {}

class InitialWeather extends WeatherState {}

@immutable
abstract class WeatherState {}
