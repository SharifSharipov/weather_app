
import 'package:weater_apk_2/model/clouds.dart';
import 'package:weater_apk_2/model/coord,.dart';
import 'package:weater_apk_2/model/main_model.dart';
import 'package:weater_apk_2/model/sys.dart';
import 'package:weater_apk_2/model/weather.dart';
import 'package:weater_apk_2/model/wind.dart';

class WaeterModel {
   Coord coord;
   List<Weather> weather; // Corrected typo in the variable name
   String base;
   Mainmodel main;
   int visibility;
   Wind wind;
   Clouds clouds;
   int dt;
   Sys sys;
   int timezone;
   int id;
   String name;
   int cod;

  WaeterModel({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WaeterModel.fromJson(Map<String, dynamic> json) {
    print(json);
    print('ok 1');
    return WaeterModel(
      coord: Coord.fromJson(json['coord']),
      weather: (json['weather'] as List)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      base: json['base'],
      main: Mainmodel.fromJson(json['main'] as Map<String, dynamic>),
      visibility: json['visibility'],
      wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
      clouds: Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
      dt: json['dt'],
      sys: Sys.fromJson(json['sys'] as Map<String, dynamic>),
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }
}
