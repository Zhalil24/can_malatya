import '../model/weather_model.dart';
import '../service/Iweather_service.dart';
import '../service/weather_service.dart';
import '../../../product/services/manager/product_service_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../product/services/manager/product_servive_path.dart';

class WeatherProvider extends StateNotifier<WeatherState> {
  WeatherProvider() : super(WeatherState());

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  late IWeatherService weatherService;

//  final WeatherFactory _wf = WeatherFactory("38023509ef45d71767057a94d2101bad", language: Language.TURKISH);

  void changeLoading() {
    Future.delayed(Duration.zero, () {
      state = state.copyWith(isLoading: !state.isLoading!);
    });
  }

  void init() {
    weatherService = WeatherService(ProductNetworkManager.base(ProductServicePath.weather), scaffoldKey);
  }

  Future<void> fetchWeather() async {
    changeLoading();
    final response = await weatherService.fetchWeatherList();
    state = state.copyWith(weather: response);
    // _wf.currentWeatherByCityName("Malatya").then((w) {
    //    state = state.copyWith(weather: w);
    //  });
    changeLoading();
  }
}

class WeatherState extends Equatable {
  final bool? isLoading;
  final WeatherModel? weather;

  const WeatherState({this.isLoading = false, this.weather});

  @override
  List<Object?> get props => [isLoading, weather];
  WeatherState copyWith({
    bool? isLoading,
    WeatherModel? weather,
  }) {
    return WeatherState(
      isLoading: isLoading ?? this.isLoading,
      weather: weather ?? this.weather,
    );
  }
}
