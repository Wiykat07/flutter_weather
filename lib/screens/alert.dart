import 'package:flutter/material.dart';
import 'package:flutter_weather/screens/settings.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../classes/weather.dart';

class WeatherAlertPage extends StatefulWidget {
  const WeatherAlertPage({
    Key? key,
  }) : super(key: key);

  @override
  State<WeatherAlertPage> createState() => _WeatherAlertState();
}

class _WeatherAlertState extends State<WeatherAlertPage> {
  @override
  Widget build(BuildContext context) {
    final alerts = ModalRoute.of(context)!.settings.arguments as List<Alert>;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          title: Text(
            'Special Alert',
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
        body:
            //takes in weather alert data and posts it
            ListView.builder(
          itemCount: alerts.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            String? event = alerts[index].event;

            return ListTile(
                title: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/alerts',
                    arguments: alerts[index]);
              },
              child: Text(event!),
            ));
          },
        ));
  }
}

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    final alert = ModalRoute.of(context)!.settings.arguments as Alert;
    String? ends = alert.ends;
    String? starts = alert.onset;
    DateTime time = DateTime.now();
    String descrip = '';

    if (context.read<PreferencesProvider>().time) {
      time = DateTime.parse(ends!);
      ends = DateFormat('hh:mma MM-dd-yyyy').format(time);
      time = DateTime.parse(starts!);
      starts = DateFormat('hh:mma MM-dd-yyyy').format(time);
    }
    if (!context.read<PreferencesProvider>().time) {
      time = DateTime.parse(ends!);
      ends = DateFormat('HH:mm MM-dd-yyyy').format(time);
      time = DateTime.parse(starts!);
      starts = DateFormat('HH:mm MM-dd-yyyy').format(time);
    }

    descrip = alert.description!.replaceAll("\n", ' ');
    descrip = descrip.replaceAll("*", "\n\n *");
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          title: Text(
            'Special Alert',
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
        body: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(alert.event!),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Flexible(child: Text(alert.headline!.replaceAll("\n", " ")))
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [Flexible(child: Text(descrip))],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Flexible(child: Text('starts at $starts and ends at $ends'))
              ],
            ),
          ],
        ));
  }
}
