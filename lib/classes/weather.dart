import 'package:flutter/foundation.dart';

import 'weatherpic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class WeatherForecast with _$WeatherForecast {
  const factory WeatherForecast({
    String? datetime,
    int? datetimeEpoch,
    double? tempmax,
    double? tempmin,
    double? temp,
    double? feelslikemax,
    double? windspeed,
    double? winddir,
    WeatherPic? icon,
    String? sunrise,
    String? sunset,
    double? moonphase,
    String? conditions,
    String? description,
    double? humidity,
    double? pressure,
    double? precip,
    double? precipprob,
    List<String>? preciptype,
    double? windgust,
    List<WeatherForecast>? hours,
  }) = _Weather;

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastFromJson(json);

  const WeatherForecast._();
}

@freezed
class Alert with _$Alert {
  const factory Alert({
    String? event,
    String? headline,
    String? description,
    String? ends,
    String? onset,
  }) = _Alert;

  factory Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);

  const Alert._();
}
