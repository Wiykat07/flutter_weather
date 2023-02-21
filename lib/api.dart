import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:location/location.dart';
import 'package:flutter_weather/classes/current_weather.dart';

const String baseURL =
    'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services';

final Dio http = Dio();

class Api {
  const Api();

  Future<CurrentWeather?> getWeather(
    LocationData location, {
    bool? fC,
  }) async {
    final String? apiKey = dotenv.env['API_KEY'];
    final double? lat = location.latitude;
    final double? long = location.longitude;
    final String unit = (fC ?? false) ? 'metric' : 'us';

    CurrentWeather? weather;

    final Response response = await http.get(
        '$baseURL/timeline/$lat,$long?unitGroup=$unit&include=hours,alerts%2Ccurrent&key=$apiKey&contentType=json');

    if (response.statusCode == 200 && response.data != null) {
      weather = CurrentWeather.fromJson(response.data);
    }
    return weather;
  }
}
