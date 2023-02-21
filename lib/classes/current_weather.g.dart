// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CurrentWeather _$$_CurrentWeatherFromJson(Map<String, dynamic> json) =>
    _$_CurrentWeather(
      days: (json['days'] as List<dynamic>?)
          ?.map((e) => WeatherForecast.fromJson(e as Map<String, dynamic>))
          .toList(),
      current: json['current'] == null
          ? null
          : WeatherForecast.fromJson(json['current'] as Map<String, dynamic>),
      location: json['resolvedAddress'] as String?,
      alerts: (json['alerts'] as List<dynamic>?)
          ?.map((e) => Alert.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CurrentWeatherToJson(_$_CurrentWeather instance) =>
    <String, dynamic>{
      'days': instance.days,
      'current': instance.current,
      'resolvedAddress': instance.location,
      'alerts': instance.alerts,
    };
