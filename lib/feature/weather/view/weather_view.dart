import '../model/weather_model.dart';
import '../viewmodel/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import '../../../product/constanst/project_radius.dart';
import '../../../product/constanst/string_constanst.dart';

final _weatherProvider = StateNotifierProvider<WeatherProvider, WeatherState>((ref) {
  return WeatherProvider();
});

class WeatherView extends ConsumerStatefulWidget {
  const WeatherView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WeatherState();
}

class _WeatherState extends ConsumerState<WeatherView> {
  @override
  void initState() {
    super.initState();
    ref.read(_weatherProvider.notifier).init();
    ref.read(_weatherProvider.notifier).fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    final weatherData = ref.watch(_weatherProvider).weather;

    if (weatherData == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          SizedBox(
            height: context.sized.height * 0.03,
          ),
          WeatherCityInfo(weatherData: weatherData),
          SizedBox(
            height: context.sized.height * 0.03,
          ),
          WeatherTempInfo(weatherData: weatherData),
          SizedBox(
            height: context.sized.height * 0.03,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WeatherSpeedInfo(weatherData: weatherData),
                  WeatherHumudityInfo(weatherData: weatherData),
                ],
              ),
              SizedBox(
                height: context.sized.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WeatherSunsireInfo(weatherData: weatherData),
                  WaetherSunsetInfo(weatherData: weatherData),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class WeatherCityInfo extends StatelessWidget {
  const WeatherCityInfo({
    super.key,
    required this.weatherData,
  });

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return CustomWeatherWidget(
      customWidth: 0.85,
      customHeight: 0.1,
      children: [
        CustomIcon(weatherData: weatherData),
        Padding(
          padding: EdgeInsets.only(left: context.padding.onlyLeftMedium.left * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomContainerTitle(
                title: weatherData?.weather?.first.description ?? 'Unknown',
              ),
              CustomContainerTitle(title: weatherData?.name ?? 'Unknown')
            ],
          ),
        ),
      ],
    );
  }
}

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.weatherData,
  });

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: context.sized.width * 0.18,
        height: context.sized.height * 0.18,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ClipOval(
          child: Image.network(
            "http://openweathermap.org/img/wn/${weatherData!.weather!.first.icon}@4x.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class WaetherSunsetInfo extends StatelessWidget {
  const WaetherSunsetInfo({
    super.key,
    this.weatherData,
  });

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    final sunset = DateTime.fromMillisecondsSinceEpoch(weatherData!.sys!.sunset! * 1000);
    final formattedSunset = DateFormat('h:mm').format(sunset);
    return CustomWeatherWidget(
      customWidth: 0.4,
      customHeight: 0.15,
      children: [
        Column(
          children: [
            Row(
              children: [Image.asset("assets/icons/day-and-night.png"), CustomContainerTitle(title: "Sunset Time:")],
            ),
            Padding(
              padding: EdgeInsets.only(left: context.padding.onlyLeftNormal.left),
              child: Text(
                '$formattedSunset ',
                style: TextStyle(fontSize: context.sized.height * 0.05),
              ),
            ),
            CustomContainerTitle(title: "PM")
          ],
        )
      ],
    );
  }
}

class WeatherSunsireInfo extends StatelessWidget {
  const WeatherSunsireInfo({
    super.key,
    this.weatherData,
  });

  final WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    final sunrise = DateTime.fromMillisecondsSinceEpoch(weatherData!.sys!.sunrise! * 1000);
    final formattedSunrise = DateFormat('h:mm').format(sunrise);
    return CustomWeatherWidget(
      customWidth: 0.4,
      customHeight: 0.15,
      children: [
        Column(
          children: [
            Row(
              children: [Image.asset("assets/icons/brightness.png"), CustomContainerTitle(title: "Sunsire Time:")],
            ),
            Padding(
              padding: EdgeInsets.only(left: context.padding.onlyLeftNormal.left),
              child: Text(
                ' $formattedSunrise',
                style: TextStyle(fontSize: context.sized.height * 0.05),
              ),
            ),
            CustomContainerTitle(title: "AM")
          ],
        )
      ],
    );
  }
}

class WeatherHumudityInfo extends StatelessWidget {
  const WeatherHumudityInfo({
    super.key,
    this.weatherData,
  });

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return CustomWeatherWidget(
      customWidth: 0.4,
      customHeight: 0.15,
      children: [
        Column(
          children: [
            Row(
              children: [Image.asset("assets/icons/humidity.png"), CustomContainerTitle(title: "Nem:")],
            ),
            Padding(
              padding: EdgeInsets.only(left: context.padding.onlyLeftMedium.left),
              child: Text(
                ' ${weatherData!.main?.humidity}% ',
                style: TextStyle(fontSize: context.sized.height * 0.05),
              ),
            ),
            CustomContainerTitle(title: "Percent")
          ],
        )
      ],
    );
  }
}

class WeatherSpeedInfo extends StatelessWidget {
  const WeatherSpeedInfo({
    super.key,
    this.weatherData,
  });
  final WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return CustomWeatherWidget(
      customWidth: 0.4,
      customHeight: 0.15,
      children: [
        Column(
          children: [
            Row(
              children: [Image.asset("assets/icons/storm.png"), CustomContainerTitle(title: "Rüzgar:")],
            ),
            Padding(
              padding: EdgeInsets.only(left: context.padding.onlyLeftMedium.left),
              child: Text(
                ' ${weatherData?.wind?.speed}',
                style: TextStyle(fontSize: context.sized.height * 0.05),
              ),
            ),
            CustomContainerTitle(title: "km/hr")
          ],
        )
      ],
    );
  }
}

class WeatherTempInfo extends StatelessWidget {
  const WeatherTempInfo({
    super.key,
    this.weatherData,
  });

  final WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    final double kelvinTemp = weatherData?.main?.temp ?? 0;
    final double celsiusTemp = kelvinTemp - 273.15;
    return CustomWeatherWidget(
      customWidth: 0.85,
      customHeight: 0.25,
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: context.padding.onlyRightMedium.right * 4),
              child: Row(
                children: [Image.asset("assets/icons/temperature.png"), CustomContainerTitle(title: "Sıcaklık:")],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: context.padding.onlyLeftMedium.left * 1.5),
              child: Text(
                ' ${celsiusTemp.toStringAsFixed(1)}°C',
                style: TextStyle(
                  fontSize: context.sized.height * 0.1, // buraya yeni tema oluşturualacak
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class CustomContainerTitle extends StatelessWidget {
  const CustomContainerTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.displaySmall,
    );
  }
}

class CustomWeatherWidget extends StatelessWidget {
  const CustomWeatherWidget({
    super.key,
    required this.customWidth,
    required this.customHeight,
    required this.children,
  });

  final double customWidth;
  final double customHeight;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.sized.width * customWidth,
      height: context.sized.height * customHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ProjectRadius.medium.value),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 5,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: children,
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.orange,
        width: double.maxFinite,
        height: context.sized.height * 0.035,
        child: Center(
          child: Text(
            StringConstants.weatherTitle,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ));
  }
}
