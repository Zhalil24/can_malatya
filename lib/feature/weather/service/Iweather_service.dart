import '../model/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

abstract class IWeatherService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldKey;

  IWeatherService(this.manager, this.scaffoldKey);
  Future<WeatherModel?> fetchWeatherList();
}
