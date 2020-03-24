import 'package:dio/dio.dart';
import 'package:join/network/baseDio.dart';

class Address {
  Dio dio = createDio();

  Future<Map<String,String>> getAddress() async{
    try {
      final response = await addInterceptors(dio).get("/address");
      print(response);
    } catch (e) {
      print(e);
      return null;
    }
  }
}