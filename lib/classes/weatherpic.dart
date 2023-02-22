import 'package:freezed_annotation/freezed_annotation.dart';

enum WeatherPic {
  @JsonValue('clear-day')
  clearDay,
  @JsonValue('clear-night')
  clearNight,
  cloudy,
  fog,
  @JsonValue('partly-cloudy-day')
  partlyCloudyDay,
  @JsonValue('partly-cloudy-night')
  partlyCloudyNight,
  rain,
  @JsonValue('showers-day')
  showersDay,
  @JsonValue('showers-night')
  showersNight,
  snow,
  @JsonValue('snow-showers-day')
  snowShowersDay,
  @JsonValue('snow-showers-night')
  snowShowersNight,
  @JsonValue('thunder-rain')
  thunderRain,
  @JsonValue('thunder-showers-day')
  thunderShowersDay,
  @JsonValue('thunder-showers-night')
  thunderShowersNight,
  wind
}

extension Images on WeatherPic {
  static final Map<WeatherPic, String> _images = {
    WeatherPic.clearDay: 'images/sun_3d.png',
    WeatherPic.clearNight: 'images/full_moon_3d.png',
    WeatherPic.cloudy: 'images/cloud_3d.png',
    WeatherPic.fog: 'images/fog_3d.png',
    WeatherPic.partlyCloudyDay: 'images/sun_behind_small_cloud_3d.png',
    WeatherPic.partlyCloudyNight: 'images/sun_behind_small_cloud_3d.png',
    WeatherPic.rain: 'images/cloud_with_rain_3d.png',
    WeatherPic.showersDay: 'images/sun_behind_rain-cloud_3d.png',
    WeatherPic.showersNight: 'images/sun_behind_rain-cloud_3d.png',
    WeatherPic.snow: 'images/snowflake_3d.png',
    WeatherPic.snowShowersDay: 'images/cloud_with_snow_3d.png',
    WeatherPic.snowShowersNight: 'images/cloud_with_snow_3d.png',
    WeatherPic.thunderRain: 'images/cloud_with_lightning_and_rain_3d.png',
    WeatherPic.thunderShowersDay: 'images/cloud_with_lightning_3d.png',
    WeatherPic.thunderShowersNight: 'images/cloud_with_lightning_3d.png',
    WeatherPic.wind: 'images/leaf_fluttering_in_wind_3d.png',
  };

  String get filename => _images[this]!;
}

class MoonPhase {
  double? phase = 0.0;
  MoonPhase(this.phase);

  String get moonphase {
    if (phase! >= .94 || phase! <= .06) {
      return 'images/new_moon_3d.png';
    }
    if (phase! >= .07 && phase! <= .20) {
      return 'images/waxing_crescent_moon_3d.png';
    }
    if (phase! >= .21 && phase! <= .33) {
      return 'images/first_quarter_moon_3d.png';
    }
    if (phase! >= .34 && phase! <= .45) {
      return 'images/waxing_gibbous_moon_3d.png';
    }
    if (phase! >= .46 && phase! <= .54) {
      return 'images/full_moon_3d.png';
    }
    if (phase! >= .55 && phase! <= .67) {
      return 'images/waning_gibbous_moon_3d.png';
    }
    if (phase! >= .68 && phase! <= .79) {
      return 'images/last_quarter_moon_3d.png';
    }
    if (phase! >= .8 && phase! <= .93) {
      return 'images/waning_crescent_moon_3d.png';
    }

    return 'images/red_exclamation_mark_3d.png';
  }

  String get phasename {
    if (phase! >= .94 || phase! <= .06) {
      return 'New Moon';
    }
    if (phase! >= .07 && phase! <= .20) {
      return 'Waxing Crescent';
    }
    if (phase! >= .21 && phase! <= .33) {
      return 'First Quarter';
    }
    if (phase! >= .34 && phase! <= .45) {
      return 'Waxing Gibbous';
    }
    if (phase! >= .46 && phase! <= .54) {
      return 'Full Moon';
    }
    if (phase! >= .55 && phase! <= .67) {
      return 'Waning Gibbous';
    }
    if (phase! >= .68 && phase! <= .79) {
      return 'Last Quarter';
    }
    if (phase! >= .8 && phase! <= .93) {
      return 'Waning Crescent';
    }

    return 'No moon?!';
  }
}

class WindDir {
  double? direction = 0.0;

  WindDir(this.direction);

  String get dir {
    if (direction! >= 336 || direction! <= 25.9) {
      return 'images/up_arrow_3d.png';
    }
    if (direction! >= 26 && direction! <= 65.9) {
      return 'images/up-right_arrow_3d.png';
    }
    if (direction! >= 66 && direction! <= 115.9) {
      return 'images/right_arrow_3d.png';
    }
    if (direction! >= 116 && direction! <= 155.9) {
      return 'images/down-right_arrow_3d.png';
    }
    if (direction! >= 156 && direction! <= 205.9) {
      return 'images/down_arrow_3d.png';
    }
    if (direction! >= 206 && direction! <= 245.9) {
      return 'images/down-left_arrow_3d.png';
    }
    if (direction! >= 246 && direction! <= 295.9) {
      return 'images/left_arrow_3d.png';
    }
    if (direction! >= 296 && direction! <= 335.9) {
      return 'images/up-left_arrow_3d.png';
    }

    return 'images/red_exclamation_mark_3d.png';
  }
}
