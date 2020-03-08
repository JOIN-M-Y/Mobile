import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:join/model/account_model.dart';
import 'package:join/network/baseDio.dart';

class UserRepository {
  Dio dio = createDio();

  Future<AccountModel> getUserInfo(GoogleSignInAccount account) async {
    try {
      Map<String, dynamic> param = {
        "email": account.email,
        "provider": "gmail",
        "social_id": account.id
      };

      final response =
          await addInterceptors(dio).get("/accounts", queryParameters: param);
      return AccountModel.fromJson(Map<String, dynamic>.from(response.data));
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
