import 'package:dio/dio.dart';

import 'AppInterceptors.dart';

Dio createDio() {
  return Dio(BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 10000,
      baseUrl: "http://104.156.238.171:80/"));
}

Dio addInterceptors(Dio dio) {
  dio.interceptors.add(AppInterceptors());
  return dio;
}
