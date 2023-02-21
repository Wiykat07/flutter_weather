import 'package:dio/dio.dart';
import 'weather.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_weather.freezed.dart';
part 'current_weather.g.dart';

final Dio http = Dio();

@freezed
class CurrentWeather with _$CurrentWeather {
  const factory CurrentWeather({
    List<WeatherForecast>? days,
    WeatherForecast? current,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'resolvedAddress') String? location,
    List<Alert>? alerts,
  }) = _CurrentWeather;

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);
}
