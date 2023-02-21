import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/bloc/weatherbloc.dart';
import 'package:flutter_weather/classes/weather.dart';
import 'package:flutter_weather/classes/weatherpic.dart';
import 'package:flutter_weather/screens/settings.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HourlyWeather extends StatelessWidget {
  const HourlyWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Hourly Forecast',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          actions: [
            SizedBox(
              width: 30,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/settings');
                },
                child: Image.asset('images/gear_3d.png'),
              ),
            )
          ],
        ),
        body: Consumer<PreferencesProvider>(builder: (context, prefs, child) {
          return BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
            if (state is HasWeather) {
              List<WeatherForecast>? forecast = [];
              forecast = state.weather.days?[0].hours;
              final int amount = DateTime.now().millisecondsSinceEpoch;
              List<WeatherForecast> hours = [];
              String time = DateFormat().format(DateTime.now());

              log(time);

              forecast?.forEach((element) {
                int time = element.datetimeEpoch! * 1000;
                if (time > amount) {
                  hours.add(element);
                }
              });

              return ListView.builder(
                  itemCount: hours.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final hour = hours[index];
                    final String icon = (hour.icon?.filename ??
                        'images/red_exclamation_mark_3d.png');
                    String time = hour.datetime.toString();
                    final String description = hour.conditions.toString();
                    double? tempHigh = hour.temp;
                    String metric = '';
                    String? high = '';
                    Clock houra = Clock(time);

                    houra.appendDate();

                    if (context.read<PreferencesProvider>().time) {
                      time = houra.convertTwelve();
                    }
                    if (!context.read<PreferencesProvider>().time) {
                      time = houra.convertTwentyFour();
                    }

                    if (context.read<PreferencesProvider>().metric) {
                      metric = 'C';
                      high = tempHigh?.toString();
                    }
                    if (!context.read<PreferencesProvider>().metric) {
                      metric = 'F';
                      tempHigh = tempHigh?.ceilToDouble();
                      high = tempHigh?.toStringAsFixed(0);
                    }

                    return ListTile(
                      leading: Text(time),
                      title: Text(description),
                      subtitle: Image.asset(icon, height: 50, width: 50),
                      trailing: Text('$high $metric'),
                    );
                  });
            }
            return const Center(child: Text('No weather?'));
          });
        }));
  }
}

class DetailedWeather extends StatelessWidget {
  const DetailedWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Detailed Forecast',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          actions: [
            SizedBox(
              width: 30,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/settings');
                },
                child: Image.asset('images/gear_3d.png'),
              ),
            )
          ],
        ),
        body: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
          if (state is HasWeather) {
            WeatherForecast? forecast;
            forecast = state.weather.days?[0];
            WindDir wind = WindDir(forecast?.winddir);
            String metric = '';
            String? high = '';
            String? low = '';
            String? windy = '';
            String miles = '';
            List<String?> preciptype = [];
            double pressure = forecast?.pressure! as double;
            pressure = pressure * .02953;
            pressure = pressure.roundToDouble();

            if (context.read<PreferencesProvider>().metric) {
              metric = 'C';
              high = forecast?.tempmax.toString();
              low = forecast?.tempmin.toString();
              windy = forecast?.feelslikemax.toString();
              miles = 'kph';
            }
            if (!context.read<PreferencesProvider>().metric) {
              metric = 'F';
              double? tempHigh = forecast?.tempmax?.ceilToDouble();
              double? tempLow = forecast?.tempmin?.ceilToDouble();
              double? windChill = forecast?.feelslikemax?.ceilToDouble();
              high = tempHigh?.toStringAsFixed(0);
              low = tempLow?.toStringAsFixed(0);
              windy = windChill?.toStringAsFixed(0);
              miles = 'mph';
            }

            if (forecast?.preciptype == null) {
              preciptype.add('None');
            }
            if (forecast?.preciptype != null) {
              int? x = forecast?.preciptype?.length;
              for (int i = 0; i < x!; i++) {
                preciptype.add(forecast?.preciptype![i]);
              }
            }
            String precipString = preciptype.join(",");
            return Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: Image.asset(
                              forecast?.icon?.filename ??
                                  'images/red_exclamation_mark_3d.png',
                              height: 100,
                              width: 100)),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text('High: $high $metric'),
                          Text('Low: $low $metric'),
                          Text('Wind Chill: $windy $metric'),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Wind Speed: ${forecast?.windspeed} $miles'),
                          Text('Wind Gusts: ${forecast?.windgust} $miles'),
                          Image.asset(wind.dir, height: 50, width: 50),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${forecast?.description}'),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text('Chance of Precip: ${forecast?.precipprob}% '),
                          Text('Precip amount: ${forecast?.precip} '),
                          Text('Type of Precip: $precipString '),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Humidity: ${forecast?.humidity}% '),
                      Text('Pressure: $pressure in'),
                    ],
                  ) //add a row with humidity and pressure
                ],
              ),
            );
          }

          return const Center(child: Text('No weather?'));
        }));
  }
}

class Clock {
  String nowYear = DateTime.now().year.toString();
  String nowDay = DateTime.now().day.toString();
  String nowMonth = DateTime.now().month.toString();
  String hour = '';
  String conversion = '';
  late DateTime time;

  Clock(this.hour);

  void appendDate() {
    if (DateTime.now().month < 10) {
      nowMonth = '0${DateTime.now().month}';
    }
    if (DateTime.now().day < 10) {
      nowDay = '0${DateTime.now().day}';
    }
    conversion = '$nowYear-$nowMonth-$nowDay $hour';
    time = DateTime.parse(conversion);
  }

  String convertTwelve() {
    conversion = DateFormat('hh:mma').format(time);
    return conversion;
  }

  String convertTwentyFour() {
    conversion = DateFormat('HH:mm').format(time);
    return conversion;
  }
}
