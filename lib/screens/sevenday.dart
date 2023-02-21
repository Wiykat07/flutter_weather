import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/bloc/weatherbloc.dart';
import 'package:flutter_weather/classes/weatherpic.dart';
import 'package:flutter_weather/screens/settings.dart';
import 'package:intl/intl.dart';

import '../classes/weather.dart';

class SevenDay extends StatelessWidget {
  const SevenDay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Seven Day Forecast',
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
        List<WeatherForecast>? forecast = [];
        if (state is HasWeather) {
          forecast = state.weather.days;
          return ListView.builder(
              itemCount: 7,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final WeatherForecast day = forecast![index];
                final String icon = (day.icon?.filename ??
                    'images/red_exclamation_mark_3d.png');
                final String cond = day.description.toString();
                double? tempHigh = day.tempmax;
                double? tempLow = day.tempmin;
                final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
                    day.datetimeEpoch! * 1000);
                final String dayOfForecast = DateFormat('EEE').format(dateTime);
                String? high;
                String? low;
                String metric = '';

                if (context.read<PreferencesProvider>().metric) {
                  metric = 'C';
                  high = tempHigh.toString();
                  low = tempLow.toString();
                }
                if (!context.read<PreferencesProvider>().metric) {
                  metric = 'F';
                  tempHigh = tempHigh?.ceilToDouble();
                  tempLow = tempLow?.ceilToDouble();

                  high = tempHigh?.toStringAsFixed(0);
                  low = tempLow?.toStringAsFixed(0);
                }

                return ListTile(
                  leading:
                      Transform.rotate(angle: 75, child: Text(dayOfForecast)),
                  title: Image.asset(icon, height: 50, width: 50),
                  subtitle: Text(cond),
                  trailing: Text('$high $metric/$low $metric'),
                );
              });
        }

        if (forecast.isEmpty) {
          return const Text('Error: No Data was found.');
        }

        return const Center(
          child: Text('Waiting...'),
        );
      }),
    );
  }
}
