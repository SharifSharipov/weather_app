/* "coord": {
        "lon": 69.2163,
        "lat": 41.2646
    },*/
import 'package:flutter/animation.dart';

class Coord{
  double lon;
  double lat;
  Coord({required this.lon,required this.lat});

  factory Coord.fromJson(Map<String,dynamic>json){
    print('ok-2');
    return Coord(lon: json['lon']as double ??0, lat: json['lat']as double ??0);
  }
  Map<String,dynamic>toJson()=>{
    'lon':lon,
    'lat':lat
  };
}