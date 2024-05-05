import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel extends INetworkModel<WeatherModel> with EquatableMixin {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  WeatherModel({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  @override
  WeatherModel fromJson(Map<String, dynamic> json) => WeatherModel.fromJson(json);

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$WeatherModelToJson(this);

  @override
  List<Object?> get props => [coord, weather, base, main, visibility, wind, clouds, dt, sys, timezone, id, name, cod];

  WeatherModel copyWith({
    Coord? coord,
    List<Weather>? weather,
    String? base,
    Main? main,
    int? visibility,
    Wind? wind,
    Clouds? clouds,
    int? dt,
    Sys? sys,
    int? timezone,
    int? id,
    String? name,
    int? cod,
  }) {
    return WeatherModel(
      coord: coord ?? this.coord,
      weather: weather ?? this.weather,
      base: base ?? this.base,
      main: main ?? this.main,
      visibility: visibility ?? this.visibility,
      wind: wind ?? this.wind,
      clouds: clouds ?? this.clouds,
      dt: dt ?? this.dt,
      sys: sys ?? this.sys,
      timezone: timezone ?? this.timezone,
      id: id ?? this.id,
      name: name ?? this.name,
      cod: cod ?? this.cod,
    );
  }
}

@JsonSerializable()
class Coord extends INetworkModel<Coord> with EquatableMixin {
  double? lon;
  double? lat;

  Coord({
    this.lon,
    this.lat,
  });

  @override
  Coord fromJson(Map<String, dynamic> json) => Coord.fromJson(json);

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$CoordToJson(this);

  @override
  List<Object?> get props => [lon, lat];

  Coord copyWith({
    double? lon,
    double? lat,
  }) {
    return Coord(
      lon: lon ?? this.lon,
      lat: lat ?? this.lat,
    );
  }
}

@JsonSerializable()
class Weather extends INetworkModel<Weather> with EquatableMixin {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  @override
  Weather fromJson(Map<String, dynamic> json) => Weather.fromJson(json);

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$WeatherToJson(this);

  @override
  List<Object?> get props => [id, main, description, icon];

  Weather copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) {
    return Weather(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }
}

@JsonSerializable()
class Main extends INetworkModel<Main> with EquatableMixin {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  @override
  Main fromJson(Map<String, dynamic> json) => Main.fromJson(json);

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$MainToJson(this);

  @override
  List<Object?> get props => [temp, feelsLike, tempMin, tempMax, pressure, humidity, seaLevel, grndLevel];

  Main copyWith({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
    int? seaLevel,
    int? grndLevel,
  }) {
    return Main(
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      seaLevel: seaLevel ?? this.seaLevel,
      grndLevel: grndLevel ?? this.grndLevel,
    );
  }
}

@JsonSerializable()
class Wind extends INetworkModel<Wind> with EquatableMixin {
  double? speed;
  int? deg;
  double? gust;

  Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  @override
  Wind fromJson(Map<String, dynamic> json) => Wind.fromJson(json);

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$WindToJson(this);

  @override
  List<Object?> get props => [speed, deg, gust];

  Wind copyWith({
    double? speed,
    int? deg,
    double? gust,
  }) {
    return Wind(
      speed: speed ?? this.speed,
      deg: deg ?? this.deg,
      gust: gust ?? this.gust,
    );
  }
}

@JsonSerializable()
class Clouds extends INetworkModel<Clouds> with EquatableMixin {
  int? all;

  Clouds({
    this.all,
  });

  @override
  Clouds fromJson(Map<String, dynamic> json) => Clouds.fromJson(json);

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$CloudsToJson(this);

  @override
  List<Object?> get props => [all];

  Clouds copyWith({
    int? all,
  }) {
    return Clouds(
      all: all ?? this.all,
    );
  }
}

@JsonSerializable()
class Sys extends INetworkModel<Sys> with EquatableMixin {
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  Sys({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  @override
  Sys fromJson(Map<String, dynamic> json) => Sys.fromJson(json);

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$SysToJson(this);

  @override
  List<Object?> get props => [type, id, country, sunrise, sunset];

  Sys copyWith({
    int? type,
    int? id,
    String? country,
    int? sunrise,
    int? sunset,
  }) {
    return Sys(
      type: type ?? this.type,
      id: id ?? this.id,
      country: country ?? this.country,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
    );
  }
}
