import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:join/model/account_model.dart';
import 'package:join/repository/userRepository.dart';

class Repository {
  final userRepository = UserRepository();

  Future<AccountModel> fetchUser(GoogleSignInAccount account) =>
      userRepository.getUserInfo(account);

  Future<AccountModel> signUpUser(
          String email,
          String fcmToken,
          String gender,
          String position,
          List<String> interestList,
          String provider,
          String socialId,
      BuildContext context) =>
      userRepository.signUpUser(
          email, fcmToken, gender, position, interestList, provider, socialId,context);
}
