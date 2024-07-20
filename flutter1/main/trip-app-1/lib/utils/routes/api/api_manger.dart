import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'api_exceptions.dart';
import 'error_model.dart';
const String jsonContentType = 'application/json';
String? token = "";

class ApiManager {
  Future _getToken() async {
    // token = await LocalStorageUtils.fetchToken();
    // ignore: avoid_print
    print(token);
  }

  var httpClient = http.Client();

  Future<dynamic> get(
    String? url, {
    String? contentType,
    bool isTokenMandatory = false,
  }) async {
    await _getToken();
    try {
      Map<String, String> headers = {
        'Content-Type': contentType ?? jsonContentType,
      };
      if (isTokenMandatory) {
        headers['Authorization'] = token ?? '';
      }
      log("Get url is ****************** $url");
      final response = await http.get(
        Uri.parse(url ?? ""),
        headers: headers,
      );
      var responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> post(
    String? url,
    var parameters, {
    String contentType = jsonContentType,
    bool isTokenMandatory = false,
    Map<String, String>? headersParams,
  }) async {
    try {
      Map<String, String> headers = {
        'Content-Type': contentType,
      };
      if (headersParams != null) {
        headers.addAll(headersParams);
      }
      if (isTokenMandatory) {
        headers['Authorization'] = token ?? '';
      }
      final response = await http.post(
        Uri.parse(url ?? ""),
        headers: headers,
        body: jsonEncode(parameters),
      );

      log('Response request -> ${response.request?.url}');
      log('Response body -> ${response.body}');
      var responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> put(
    String? url,
    var parameters, {
    String contentType = jsonContentType,
    bool isTokenMandatory = false,
  }) async {
    await _getToken();
    try {
      Map<String, String> headers = {
        'Content-Type': contentType,
      };

      if (isTokenMandatory) {
        headers['Authorization'] = token ?? '';
      }
      final response = await http.put(
        Uri.parse(url ?? ""),
        headers: headers,
        body: jsonEncode(parameters),
      );
      log('Response body of Put ${response.request!.url} -> ${response.body}');
      var responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  // This method is used for call API for the `DELETE` method, need to pass API Url endpoint
  Future<dynamic> delete(
    String? url, {
    String contentType = jsonContentType,
    bool isTokenMandatory = true,
  }) async {
    try {
      // Declare the header for the request, if user not logged in then pass empty array as header or else pass the authentication token stored on login time
      Map<String, String> headers = {
        'Content-Type': contentType,
      };

      final response = await http.delete(
        Uri.parse(url ?? ""),
        headers: headers,
      );

      // Get.printInfo(info: 'Response body of Delete ${response.request!.url} ***********>> ${response.body}');
      log('Response body of Delete ${response.request!.url} ***********>> ${response.body}');

      /// Handle response and errors
      // Map<dynamic, dynamic> responseJson = _returnResponse(response);
      var responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        log("Response Json ${response.statusCode} -> ${responseJson.toString()}");

        if (responseJson['uploadUrl'] != '') {
          return responseJson;
        }
        if (responseJson['status'] != "Success") {
          throw BadRequestException(
            'Err:${response.statusCode} ${responseJson['message']}',
            responseJson,
          );
        }
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body);
        log("Response Json ${response.statusCode} -> ${responseJson.toString()}");

        if (responseJson['status'] == false) {
          throw BadRequestException(
            'Err:${response.statusCode} ${responseJson['message']}',
            responseJson,
          );
        }
        return responseJson;
      case 400:
        ErrorModel errorModel = ErrorModel.fromJson(json.decode(response.body));
        log("ErrorModel ${response.statusCode} -> ${errorModel.message}");
        throw BadRequestException(
          'Err:${response.statusCode} ${errorModel.message}',
          errorModel.toJson(),
        );
      case 401:
        ErrorModel errorModel = ErrorModel.fromJson(json.decode(response.body));
        log("ErrorModel ${response.statusCode} -> ${errorModel.message}");

        throw UnauthorisedException(
          'Err:${response.statusCode} ${errorModel.message}',
          errorModel.toJson(),
        );

      case 403:
      case 404:
        ErrorModel errorModel = ErrorModel.fromJson(json.decode(response.body));
        log("ErrorModel ${response.statusCode} -> ${errorModel.message}");
 

        throw UnauthorisedException(
          'Err:${response.statusCode} ${errorModel.message}',
          errorModel.toJson(),
        );
      case 500:
        ErrorModel errorModel = ErrorModel.fromJson(json.decode(response.body));
        log("ErrorModel ${response.statusCode} -> ${errorModel.message}");
        var decodedJson = json.decode(response.body);
        String error = decodedJson["message"];
        throw FetchDataException(
          'Err:${response.statusCode} $error',
          errorModel.toJson(),
        );
      default:
        ErrorModel errorModel = ErrorModel.fromJson(json.decode(response.body));
        log("ErrorModel ${response.statusCode} -> ${errorModel.message}");
        throw FetchDataException(
          'Err:${response.statusCode} ${errorModel.message}',
          errorModel.toJson(),
        );
    }
  }
}
