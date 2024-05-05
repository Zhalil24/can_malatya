import '../model/weather_model.dart';
import 'Iweather_service.dart';
import '../../../product/services/manager/service_path.dart';
import 'package:vexana/vexana.dart';

class WeatherService extends IWeatherService {
  WeatherService(super.manager, super.scaffoldKey);

  @override
  Future<WeatherModel?> fetchWeatherList() async {
    final response = await manager.send<WeatherModel, WeatherModel>(
      ServicePath.weather.rawValue,
      parseModel: WeatherModel(),
      method: RequestType.GET,
    );
    print(response);
    return response.data;
  }

  // final String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid';
  // final String _apiKey = ''; // API anahtarınızı buraya ekleyin

  // Future<WeatherModel> fetchWeatherList() async {
  //   final Uri uri = Uri.parse('$_baseUrl=$_apiKey');

  //   try {
  //     final response = await http.get(uri);

  //     if (response.statusCode == 200) {
  //       final jsonData = json.decode(response.body);
  //       return WeatherModel.fromJson(jsonData);
  //     } else {
  //       throw Exception('Failed to fetch weather data');
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to connect to the server: $e');
  //   }
  // }
}
