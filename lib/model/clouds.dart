/* "clouds": {
        "all": 0
    },*/
class Clouds{
  int all;
  Clouds({required this.all});
  factory Clouds.fromJson(Map<String,dynamic>json){
    return Clouds(all: json['all'] as int?? 0);
  }
  Map<String,dynamic>toJson()=>{
    'all':all
  };
}