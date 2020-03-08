import 'package:dio/dio.dart';

import '../config.dart';
import 'AppInterceptors.dart';

Dio createDio() {
  return Dio(BaseOptions(
      connectTimeout: 10000, receiveTimeout: 10000, baseUrl: Config.BASE_URL));
}

Dio addInterceptors(Dio dio) {
  dio.interceptors.add(AppInterceptors());
  return dio;
}
