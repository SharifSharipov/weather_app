/*{
        "temp": 299.12,
        "feels_like": 299.12,
        "temp_min": 299.12,
        "temp_max": 299.12,
        "pressure": 1010,
        "humidity": 47
    },*/
class Mainmodel {
  double temp;
  double feels_like;
  double temp_min;
  double temp_max;
  int pressure;
  int humidity;

  Mainmodel(
      {required this.temp,
      required this.feels_like,
      required this.temp_min,
      required this.temp_max,
      required this.pressure,
      required this.humidity});

  factory Mainmodel.fromJson(Map<String, dynamic> json) {
    print('ok-4');
    return Mainmodel(
        temp: json['temp'] as double ?? 0,
        feels_like: json['feels_like'] as double ?? 0,
        temp_min: json['temp_min'] as double ?? 0,
        temp_max: json['temp_max'] as double ?? 0,
        pressure: json['pressure'] as int ?? 0,
        humidity: json['humidity'] as int ?? 0);
  }
}
