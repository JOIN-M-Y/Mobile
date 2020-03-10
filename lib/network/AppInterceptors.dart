import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:join/custom/join_dialog.dart';

class AppInterceptors extends Interceptor {

  @override
  Future onRequest(RequestOptions options) async {
    if (options.headers.containsKey("requiresToken")) {
      //remove the auxiliary header
      options.headers.remove("requiresToken");

//      SharedPreferences prefs = await SharedPreferences.getInstance();
//      var header = prefs.get("Header");
//
//      options.headers.addAll({"Header": "$header${DateTime.now()}"});
      print(
          "--> ${options.method != null
              ? options.method.toUpperCase()
              : 'METHOD'} ${"" + (options.baseUrl ?? "") +
              (options.path ?? "")}");
      print("Headers:");
      options.headers.forEach((k, v) => print('$k: $v'));
      if (options.queryParameters != null) {
        print("queryParameters:");
        options.queryParameters.forEach((k, v) => print('$k: $v'));
      }
      if (options.data != null) {
        print("Body: ${options.data}");
      }
      print(
          "--> END ${options.method != null
              ? options.method.toUpperCase()
              : 'METHOD'}");

      return options;
    }
  }

  @override
  Future onError(DioError dioError) async {
    if (dioError.message.contains("ERROR_001")) {
      // this will push a new route and remove all the routes that were present
//      navigatorKey.currentState.pushNamedAndRemoveUntil(
//          "/login", (Route<dynamic> route) => false);
//    }
      print(
          "<-- ${dioError.message} ${(dioError.response?.request != null
              ? (dioError.response.request.baseUrl +
              dioError.response.request.path)
              : 'URL')}");
      print(
          "${dioError.response != null
              ? dioError.response.data
              : 'Unknown Error'}");
      print("<-- End error");
      return dioError;
    }
    return dioError;
  }

  @override
  Future onResponse(Response response) async {
//    if (response.headers.value("verifyToken") != null) {
      //if the header is present, then compare it with the Shared Prefs key
//      SharedPreferences prefs = await SharedPreferences.getInstance();
//      var verifyToken = prefs.get("VerifyToken");
//
      // if the value is the same as the header, continue with the request
//      if (response.headers.value("verifyToken") == verifyToken) {
//        return response;
//      }
//      return DioError(
//          request: response.request, error: "User is no longer active");
//    }
    print(
        "<-- ${response.statusCode} ${(response.request != null ? (response
            .request.baseUrl + response.request.path) : 'URL')}");
    print("Headers:");
    response.headers?.forEach((k, v) => print('$k: $v'));
    print("Response: ${response.data}");
    print("<-- END HTTP");

  }
}
