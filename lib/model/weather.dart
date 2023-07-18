/*"weather": [
        {
            "id": 800,
            "main": "Clear",
            "description": "clear sky",
            "icon": "01d"
        }
    ],*/
class Weather {
  int id;
  String main;
  String desckription;
  String icon;

  Weather(
      {required this.id,
      required this.main,
      required this.desckription,
      required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    print(json);
    print('ok-3');
    return Weather(

        id: json['id'],
        main: json['main'],
        desckription: json['description'],
        icon: json['icon']);
  }

  Map<String, dynamic> toJson() => {
        'id': id as int ?? 0,
        'main': main ,//as String ?? "",
        'description': desckription ,//as String ?? "",
        'icon': icon ,//as String ?? "",
      };

}
