//main page when you open the flutter app
import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/bloc/weatherbloc.dart';
import 'package:flutter_weather/classes/current_weather.dart';
import 'package:flutter_weather/classes/weather.dart';
import 'package:flutter_weather/classes/weatherpic.dart';
import 'package:provider/provider.dart';
import 'package:flutter_weather/screens/detailed.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  CurrentWeather? weather;
  WeatherForecast? today;
  MoonPhase moon = MoonPhase(0.0);
  bool fc = false;
  String metric = '';
  double? tempHigh = 0.0;
  double? tempLow = 0.0;
  double? windChill = 0.0;
  String? high = '';
  String? low = '';
  String? windy = '';
  String? timeRise = '';
  String? timeSet = '';

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(minutes: 20), (() {
      context.read<WeatherBloc>().add(GetWeather(fC: fc));
    })); //set a timer to check the weather every 20 minutes.

    return Consumer<PreferencesProvider>(builder: (context, prefs, child) {
      log('Prefs is $prefs');
      if (fc != prefs.metric) {
        fc = prefs.metric;
        context.read<WeatherBloc>().add(GetWeather(fC: fc));
      }

      return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
        log('State is $state');
        if (state is UpdatingWeather || state is LocationUpdating) {
          return const Center(child: Text('Please wait...'));
        }
        if (state is LocationError) {
          return const Center(child: Text('Error finding location.'));
        }
        if (state is HasWeather) {
          weather = state.weather;
          today = weather?.days?[0];
          moon = MoonPhase(today?.moonphase);
          tempHigh = today?.tempmax;
          tempLow = today?.tempmin;
          windChill = today?.feelslikemax;
          timeRise = today?.sunrise.toString();
          timeSet = today?.sunset.toString();
          Clock hourRise = Clock(timeRise!);
          Clock hourSet = Clock(timeSet!);

          hourRise.appendDate();
          hourSet.appendDate();

          if (context.read<PreferencesProvider>().time) {
            timeRise = hourRise.convertTwelve();
            timeSet = hourSet.convertTwelve();
          }
          if (!context.read<PreferencesProvider>().time) {
            timeRise = hourRise.convertTwentyFour();
            timeSet = hourSet.convertTwentyFour();
          }

          if (fc) {
            metric = 'C';
            high = tempHigh?.toString();
            low = tempLow.toString();
            windy = windChill.toString();
          }
          if (!fc) {
            metric = 'F';
            tempHigh = tempHigh?.ceilToDouble();
            tempLow = tempLow?.ceilToDouble();
            windChill = windChill?.ceilToDouble();
            high = tempHigh?.toStringAsFixed(0);
            low = tempLow?.toStringAsFixed(0);
            windy = windChill?.toStringAsFixed(0);
          }
        }

        if (today == null) {
          return const Text('Not today, Satan');
        }
        return Center(
          child: Column(children: [
            Row(
              children: [
                Builder(builder: ((context) {
                  if (weather == null) {
                    return Container();
                  }
                  if (weather!.alerts == null) {
                    return Container();
                  }
                  if (weather!.alerts!.isEmpty) {
                    return Container();
                  }
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/alert',
                          arguments: weather?.alerts);
                    },
                    child: Image.asset('images/red_exclamation_mark_3d.png',
                        height: 50, width: 50),
                  );
                })),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Flexible(
                child: Column(children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/detailed');
                      },
                      child: Image.asset(
                          today!.icon?.filename ??
                              'images/red_exclamation_mark_3d.png',
                          height: 100,
                          width: 100)),
                  Text(
                    today!.description.toString(),
                    overflow: TextOverflow.visible,
                  ),
                ]),
              ), //weather icon and description
            ]),
            const SizedBox(
              height: 40,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(children: [
                const SizedBox(
                  height: 40,
                ),
                Text('High: $high $metric'),
                Text('Low: $low $metric'),
                Text('Wind Chill: $windy $metric'),
              ]),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Column(children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Image.asset(
                      moon.moonphase,
                      height: 50,
                      width: 50,
                    ), //moon image
                    Text(moon.phasename), //moon phase
                    Text('Sunrise: $timeRise'), //sunrise
                    Text('Sunset: $timeSet'), //sunset
                  ]), // a column of sunrise, sunset and moonphase
                ],
              ),
            ]),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/hourly');
                    },
                    child: const Text('Hourly Forecast')),
                //hourly option

                OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sevenday');
                    },
                    child: const Text('Seven Day Forecast')),
                //seven day option
              ],
            ),
            SizedBox(
                height: 170,
                width: 350,
                child: GestureDetector(
                  onTap: () {
                    context.read<WeatherBloc>().add(GetWeather(fC: fc));
                  },
                ))
          ]),
        );
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fc = context.read<PreferencesProvider>().metric;
    context.read<WeatherBloc>().add(GetWeather(fC: fc));
  }
}
