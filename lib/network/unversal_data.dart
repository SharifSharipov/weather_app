import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../model/model.dart';
import '../ui/utils/constanta.dart';
import 'package:http/http.dart' as http;
UniversalData handleHttpErrors(http.Response response) {
  switch (response.statusCode) {
    case HttpStatus.badRequest:
      {
        return UniversalData(
          error: "Bad request exception",
          statusCode: response.statusCode,
        );
      }
    case HttpStatus.unauthorized:
      {
        return UniversalData(
          error: jsonDecode(response.body)["message"],
          statusCode: response.statusCode,
        );
      }
    case HttpStatus.forbidden:
      {
        return UniversalData(
          error: jsonDecode(response.body)["message"],
          statusCode: response.statusCode,
        );
      }
    case HttpStatus.notFound:
      {
        return UniversalData(
          error: jsonDecode(response.body)["message"],
          statusCode: response.statusCode,
        );
      }
    case HttpStatus.internalServerError:
      {
        return UniversalData(
          error:
          "Error occurred while Communication with Server with StatusCode : ${response.statusCode}",
          statusCode: response.statusCode,
        );
      }
    case HttpStatus.notImplemented:
      {
        return UniversalData(
          error: "Server Error : ${response.statusCode}",
          statusCode: response.statusCode,
        );
      }
    default:
      return UniversalData(
        error: "Unknown Error occurred!",
        statusCode: response.statusCode,
      );
  }
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

}

/*UniversalData handleHttpErrors(http.Response response) {
  switch (response.statusCode) {
    case HttpStatus.badRequest:
      {
        return UniversalData(
          error:  "Bad request exception",
          statusCode: response.statusCode,
        );
      }
    case HttpStatus.unauthorized:
      {
        return UniversalData(
          error: jsonDecode(response.body)["message"],
          statusCode: response.statusCode,
        );
      }
    case HttpStatus.forbidden:
      {
        return UniversalData(
            error: jsonDecode(response.body)['message'],
            statusCode: response.statusCode);
      }
    case HttpStatus.notFound:
      {
        return UniversalData(
            error: jsonDecode(response.body)['message'],
            statusCode: response.statusCode);
      }
    case HttpStatus.internalServerError:
      {
        return UniversalData(
            error:
            "Error occurred while Communication with Server with StatusCode : ${response.statusCode}",
            statusCode: response.statusCode);
      }
    case HttpStatus.notImplemented:
      {
        return UniversalData(
            error: 'Server error: ${response.statusCode}',
            statusCode: response.statusCode);
      }
    default:
      {
        return UniversalData(
            error: '"Unknown Error occurred!"',
            statusCode: response.statusCode);
      }
  }
}*/

/**/
