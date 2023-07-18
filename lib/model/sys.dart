/*sys": {
        "type": 1,
        "id": 9016,
        "country": "UZ",
        "sunrise": 1689292898,
        "sunset": 1689346548
    },*/
class Sys {
  int type;
  int id;
  String country;
  int sunrise;
  int sunset;

  Sys(
      {required this.type,
      required this.id,
      required this.country,
      required this.sunrise,
      required this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
        type: json['type'] as int?? 0,
        id: json['id'] as int?? 0,
        country: json['country'] as String ??"",
        sunrise: json['sunrise'] as int?? 0,
        sunset: json['sunset'] as int?? 0);
  }
}
