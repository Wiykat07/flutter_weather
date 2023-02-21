import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_weather/api.dart';
import 'package:provider/provider.dart';
import 'package:flutter_weather/screens/alert.dart';
import 'package:flutter_weather/screens/detailed.dart';
import 'package:flutter_weather/screens/settings.dart';
import 'package:flutter_weather/screens/sevenday.dart';
import 'package:flutter_weather/theme.dart';
import 'package:flutter_weather/screens/home.dart';
import 'package:flutter_weather/bloc/weatherbloc.dart';

Future<void> main() async {
  await dotenv.load(fileName: "assets/.env");
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<PreferencesProvider>(
        create: (context) => PreferencesProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<WeatherBloc>(
            create: (context) => WeatherBloc(const Api()),
          ),
        ],
        child: Consumer<PreferencesProvider>(
          builder: (context, value, child) {
            return MaterialApp(
              initialRoute: '/',
              routes: {
                '/settings': (context) => const SettingsS(),
                '/sevenday': (context) => const SevenDay(),
                '/hourly': (context) => const HourlyWeather(),
                '/alert': (context) => const WeatherAlertPage(),
                '/detailed': (context) => const DetailedWeather(),
                '/alerts': (context) => const AlertPage(),
              },
              title: 'Flutter Weather',
              home: const MainScreen(),
              theme: value.lightDark ? theme : light,
            );
          },
        ));
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Weather: Main Screen',
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
      body: const FrontPage(),
    );
  }
}
