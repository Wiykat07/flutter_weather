// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Weather _$$_WeatherFromJson(Map<String, dynamic> json) => _$_Weather(
      datetime: json['datetime'] as String?,
      datetimeEpoch: json['datetimeEpoch'] as int?,
      tempmax: (json['tempmax'] as num?)?.toDouble(),
      tempmin: (json['tempmin'] as num?)?.toDouble(),
      temp: (json['temp'] as num?)?.toDouble(),
      feelslikemax: (json['feelslikemax'] as num?)?.toDouble(),
      windspeed: (json['windspeed'] as num?)?.toDouble(),
      winddir: (json['winddir'] as num?)?.toDouble(),
      icon: $enumDecodeNullable(_$WeatherPicEnumMap, json['icon']),
      sunrise: json['sunrise'] as String?,
      sunset: json['sunset'] as String?,
      moonphase: (json['moonphase'] as num?)?.toDouble(),
      conditions: json['conditions'] as String?,
      description: json['description'] as String?,
      humidity: (json['humidity'] as num?)?.toDouble(),
      pressure: (json['pressure'] as num?)?.toDouble(),
      precip: (json['precip'] as num?)?.toDouble(),
      precipprob: (json['precipprob'] as num?)?.toDouble(),
      preciptype: (json['preciptype'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      windgust: (json['windgust'] as num?)?.toDouble(),
      hours: (json['hours'] as List<dynamic>?)
          ?.map((e) => WeatherForecast.fromJson(e as Map<String, dynamic>))
          .toList(),
      alerts: (json['alerts'] as List<dynamic>?)
          ?.map((e) => Alert.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_WeatherToJson(_$_Weather instance) =>
    <String, dynamic>{
      'datetime': instance.datetime,
      'datetimeEpoch': instance.datetimeEpoch,
      'tempmax': instance.tempmax,
      'tempmin': instance.tempmin,
      'temp': instance.temp,
      'feelslikemax': instance.feelslikemax,
      'windspeed': instance.windspeed,
      'winddir': instance.winddir,
      'icon': _$WeatherPicEnumMap[instance.icon],
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'moonphase': instance.moonphase,
      'conditions': instance.conditions,
      'description': instance.description,
      'humidity': instance.humidity,
      'pressure': instance.pressure,
      'precip': instance.precip,
      'precipprob': instance.precipprob,
      'preciptype': instance.preciptype,
      'windgust': instance.windgust,
      'hours': instance.hours,
      'alerts': instance.alerts,
    };

const _$WeatherPicEnumMap = {
  WeatherPic.clearDay: 'clear-day',
  WeatherPic.clearNight: 'clear-night',
  WeatherPic.cloudy: 'cloudy',
  WeatherPic.fog: 'fog',
  WeatherPic.partlyCloudyDay: 'partly-cloudy-day',
  WeatherPic.partlyCloudyNight: 'partly-cloudy-night',
  WeatherPic.rain: 'rain',
  WeatherPic.showersDay: 'showers-day',
  WeatherPic.showersNight: 'showers-night',
  WeatherPic.snow: 'snow',
  WeatherPic.snowShowersDay: 'snow-showers-day',
  WeatherPic.snowShowersNight: 'snow-showers-night',
  WeatherPic.thunderRain: 'thunder-rain',
  WeatherPic.thunderShowersDay: 'thunder-showers-day',
  WeatherPic.thunderShowersNight: 'thunder-showers-night',
  WeatherPic.wind: 'wind',
};

_$_Alert _$$_AlertFromJson(Map<String, dynamic> json) => _$_Alert(
      event: json['event'] as String?,
      headline: json['headline'] as String?,
      description: json['description'] as String?,
      ends: json['ends'] as String?,
      onset: json['onset'] as String?,
    );

Map<String, dynamic> _$$_AlertToJson(_$_Alert instance) => <String, dynamic>{
      'event': instance.event,
      'headline': instance.headline,
      'description': instance.description,
      'ends': instance.ends,
      'onset': instance.onset,
    };
