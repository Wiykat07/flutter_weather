import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider extends ChangeNotifier {
  bool _fc = false;
  bool _lightdark = false;
  bool _time = false;

  bool get metric {
    return _fc;
  }

  bool get lightDark {
    return _lightdark;
  }

  bool get time {
    return _time;
  }

  void updateP() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('fc', _fc);
    await prefs.setBool('lightdark', _lightdark);
    await prefs.setBool('time', _time);

    notifyListeners();
  }
}

class SettingsS extends StatefulWidget {
  const SettingsS({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsS> createState() => _ScreenState();
}

class _ScreenState extends State<SettingsS> {
  String displayValue(bool v) {
    if (v) {
      return 'Celsius';
    } else {
      return 'Fahrenheit';
    }
  }

  String displayLight(bool v) {
    if (v) {
      return 'Dark Mode';
    } else {
      return 'Light Mode';
    }
  }

  String displayTime(bool v) {
    if (v) {
      return "12 Hour Clock";
    } else {
      return "24 Hour Clock";
    }
  }

  late bool lightDark = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<PreferencesProvider>(builder:
        (BuildContext context, PreferencesProvider prefs, Widget? child) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Settings',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          body: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Temperature Unit:'),
                Switch(
                    value: Provider.of<PreferencesProvider>(context).metric,
                    onChanged: (fCbutton) {
                      prefs._fc = fCbutton;
                      Provider.of<PreferencesProvider>(context, listen: false)
                          .updateP();
                      fCbutton = prefs.metric;
                      log('FC is $fCbutton');
                    }),
                Text(displayValue(
                    Provider.of<PreferencesProvider>(context).metric)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Light Mode/Dark Mode:'),
                Switch(
                    value: Provider.of<PreferencesProvider>(context).lightDark,
                    onChanged: (lightDark) {
                      prefs._lightdark = lightDark;
                      Provider.of<PreferencesProvider>(context, listen: false)
                          .updateP();
                      lightDark = prefs.lightDark;
                      log('lightDark is $lightDark');
                    }),
                Text(displayLight(
                    Provider.of<PreferencesProvider>(context).lightDark)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('12 Hour Clock/24 Hour Clock:'),
                Switch(
                    value: Provider.of<PreferencesProvider>(context).time,
                    onChanged: (time) {
                      prefs._time = time;
                      Provider.of<PreferencesProvider>(context, listen: false)
                          .updateP();
                      time = prefs.time;
                    }),
                Text(displayTime(
                    Provider.of<PreferencesProvider>(context).time)),
              ],
            ),
          ]));
    });
  }
}
