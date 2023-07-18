/*"wind": {
        "speed": 4.12,
        "deg": 150
    },*/
class Wind {
  double speed;
  int deg;

  Wind({required this.speed, required this.deg});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(speed: json['speed'] as double ??0, deg: json['deg']as int ??0);
  }
  Map<String,dynamic>toJson()=>{
    'speed':speed,
    'deg':deg
  };
}
