import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'package:weater_apk_2/model/model.dart';
import 'package:weater_apk_2/network/unversal_data.dart';
import '../model/detail/daily_model.dart';
import '../model/detail/hourly_model.dart';
import '../ui/utils/constanta.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
class ApiProvider {
  static Future<UniversalData> getWeatherOneCallData({
    required double lat,
    required double long,
  }) async {
    Uri uri = Uri.https(
      baseUrlWithoutHttp,
      "/data/2.5/onecall",
      {
        "appid": apiKeyForMain,
        "lat": lat.toString(),
        "lon": long.toString(),
        "exclude": "minutely,current",
        "units": "metric",
      },
    );

    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == HttpStatus.ok) {
        return UniversalData(
            data: WaeterModel.fromJson(jsonDecode(response.body)));
      }
      return handleHttpErrors(response);
    } on SocketException {
      return UniversalData(error: "Internet Error!");
    } on FormatException {
      return UniversalData(error: "Format Error!");
    } catch (err) {
      debugPrint("ERROR:$err. ERROR TYPE: ${err.runtimeType}");
      return UniversalData(error: err.toString());
    }
  }
  static Future<WaeterModel> fetchData() async {
    Response response = await http.get(
        Uri.parse(
            "https://api.openweathermap.org/data/2.5/weather?appid=e660789eb0a263082922d687a4041c1d&q=bukhara"));
    if (response.statusCode ==HttpStatus.ok) {
      print(response);
      return WaeterModel.fromJson(jsonDecode(response.body));
    } else {
      throw ();
    }
  }
  Future<WeatherbyDays> fetchWeatherDataDaily() async {
    final url = Uri.https(baseUrl, path, {
      "appid": "139d82d53b7f20c0a44c1bc27377f9ff",
      "exclude": "minutely,current,hourly",
      "units": "metric",
    });
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return WeatherbyDaysFromJson(response.body);
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }

  final String baseUrl =
      'api.openweathermap.org';
  final String path = '/data/2.5/onecall';

  Future<WeatherbyHourModel> fetchWeatherDataByHour({
    required double lat,
    required double long,
  }) async {
    final url = Uri.https(baseUrl, path, {
      "appid": "649ff9f2558d2c45135158b30bc262d8",
      "lat": '41.65',
      "lon": '65.848',
      "exclude": "minutely,current,daily",
      "units": "metric",
    });

    final response = await http.get(url);
    print(response.statusCode);

    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      if (decodedJson != null) {
        return WeatherbyHourModel.fromJson(decodedJson);
      } else {
        throw Exception('Failed to decode JSON');
      }
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }
  static Future<UniversalData> getMainWeatherDataByLatLong({
    required double lat,
    required double long,
  }) async {
    Uri uri = Uri.https(
      baseUrlWithoutHttp,
      "/data/2.5/weather",
      {
        "appid": apiKeyForMain,
        "lat": lat.toString(),
        "lon": long.toString(),
      },
    );

    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == HttpStatus.ok) {
        return UniversalData(
            data: WaeterModel.fromJson(jsonDecode(response.body)));
      }
      return handleHttpErrors(response);
    } on SocketException {
      return UniversalData(error: "Internet Error!");
    } on FormatException {
      return UniversalData(error: "Format Error!");
    } catch (err) {
      return UniversalData(error: err.toString());
    }
  }

  static Future<UniversalData> getMainWeatherDataByQuery(
      {required String query}) async {
    //Uri uri = Uri.parse("$baseUrl/data/2.5/weather?q=$query&appid=$apiKeyForMain");

    Uri uri = Uri.https(
      baseUrlWithoutHttp,
      "/data/2.5/weather",
      {
        "appid": apiKeyForMain,
        "q": query,
      },
    );

    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == HttpStatus.ok) {
        {
          return UniversalData(
            data: WaeterModel.fromJson(jsonDecode(response.body)),
            statusCode: response.statusCode,
          );
        }
      }
      return handleHttpErrors(response);
    } on SocketException {
      return UniversalData(error: "Internet Error!");
    } on FormatException {
      return UniversalData(error: "Format Error!");
    }
    // on TypeError{
    //   return UniversalData(error: "TYPE ERROR");
    // }
    catch (err) {
      return UniversalData(error: err.toString());
    }
  }
}

/*class ApiProvayder {
  static Future<WaeterModel> fetchData() async {
    Response response = await http.get(
        Uri.parse(
            "https://api.openweathermap.org/data/2.5/weather?appid=e660789eb0a263082922d687a4041c1d&q=Tashkent"));
    if (response.statusCode == 200) {
      print(response);
      return WaeterModel.fromJson(jsonDecode(response.body));
    } else {
      throw ();
    }
  }
   static Future<UniversalData>getMainLatLong({required double lat,required lon} )async{
      /* Uri uri=Uri.parse('$baseUrl/data/2.5/weather?lat=$lat,lon=$lon&appid=$apiKeyForMain');*/
     Uri uri=Uri.https(baseUrlWithoutHttp,"/data/2.5/weather",{
       "lat":lat.toString(),
       "lon":lon.toString(),
       "appid":apiKeyForMain
     });
       try{
          http.Response response=await http.get(uri);
          if(response.statusCode==200){
            return UniversalData(data: WaeterModel.fromJson(jsonDecode(response.body),));
          }
          return UniversalData(error: "Error");
       }
       catch(error){
         return UniversalData(error: error.toString());
       }
   }
  static Future<UniversalData>getMainquery({required String query} )async{
    Uri uri=Uri.https(baseUrlWithoutHttp,"/data/2.5/weather",{
      "q":query,
      "appid":apiKeyForMain
    });
    try{
      http.Response response=await http.get(uri);
      if(response.statusCode==200){
        return UniversalData(data: WaeterModel.fromJson(jsonDecode(response.body)));
      }
      return UniversalData(error: "Error");
    }
    catch(error){
      return UniversalData(error: error.toString());
    }

  }
    ///* case HttpStatus.ok:
//       {
//         return UniversalData(
//           error: jsonEncode(WaeterModel.fromJson(jsonDecode(response.body))),
//           statusCode: response.statusCode,
//         );
//       }*///
}


class UniversalData {
  UniversalData({
    this.error = "",
    this.data,
    this.statusCode = 0,
  });

  dynamic data;
  String error;
  int statusCode;
}*/
