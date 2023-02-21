// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_weather/api.dart';
import 'package:flutter_weather/classes/current_weather.dart';
import 'package:location/location.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final Api api;

  WeatherBloc(this.api) : super(InitialWeather()) {
    on<GetWeather>((event, emit) async {
      log('getting weather');
      emit(LocationUpdating());

      Location location = Location();

      bool _serviceEnabled;
      PermissionStatus _permissionGranted;
      LocationData _locationData;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      _locationData = await location.getLocation();
      log('got location $_locationData');
      if (_locationData.latitude == null) {
        emit(LocationError());
      }
      if (_locationData.latitude != null) {
        emit(HasLocation(location: _locationData));
        final CurrentWeather? weather =
            await api.getWeather(_locationData, fC: event.fC);
        if (weather != null) {
          emit(HasWeather(weather: weather));
        }

        if (weather == null) {
          emit(LocationError());
        }
      }
    });
  }
}

class GetWeather extends WeatherEvent {
  final bool? fC;

  GetWeather({this.fC});
}

@immutable
abstract class WeatherEvent {}
