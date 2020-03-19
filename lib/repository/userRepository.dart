import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:join/custom/join_dialog.dart';
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

  Future<AccountModel> signUpUser(
      String email,
      String fcmToken,
      String gender,
      String position,
      List<String> interestList,
      String provider,
      String socialId,
      BuildContext context) async {
    try {
      print(email);
      print(fcmToken);
      print(gender);
      print(position);
      print(interestList);
      print(provider);
      print(socialId);
      final response = await addInterceptors(dio).post("/accounts", data: {
        "email": email,
        "fcmToken": fcmToken,
        "gender": gender,
        "interestedField": position,
        "interestedFieldDetail": interestList,
        "provider": provider,
        "socialId": socialId,
      });
      return AccountModel.fromJson(Map<String, dynamic>.from(response.data));
    } catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return JoinDialog(title: "알림", content: "잘못된 요청입니다.");
          });
      return null;
    }
  }
}
