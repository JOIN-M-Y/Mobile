import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:join/blocs/base.dart';
import 'package:join/model/account_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc extends BaseBloc<AccountModel> {
  Observable<AccountModel> get userInfo => fetcher.stream;

  fetchUser(GoogleSignInAccount account) async {
    AccountModel model = await repository.fetchUser(account);
    fetcher.sink.add(model);
  }

  Future<AccountModel> isSignUpUser(GoogleSignInAccount account) {
    return repository.fetchUser(account);
  }

  signUphUser(
      String email,
      String fcmToken,
      String gender,
      String position,
      List<String> interestList,
      String provider,
      String socialId,
      BuildContext context) async {
    List<String> engToKor = List();

    // ignore: missing_return
    interestList.forEach((f) {
      switch (f) {
        case "BX디자인":
          engToKor.add("bx");
          break;
        case "UX/UI디자인":
          engToKor.add("ux/ui");
          break;
        case "영상 디자인":
          engToKor.add("video");
          break;
        case "3D 디자인":
          engToKor.add("3d");
          break;
        case "일러스트레이터":
          engToKor.add("illustration");
          break;
        case "GA 기획":
          engToKor.add("ga");
          break;
        case "UX 기획":
          engToKor.add("ux");
          break;
        case "역 기획":
          engToKor.add("reverse");
          break;
        case "마케팅 기획":
          engToKor.add("marcketing");
          break;
        case "웹 개발":
          engToKor.add("web");
          break;
        case "서버 개발":
          engToKor.add("server");
          break;
        case "모바일 개발":
          engToKor.add("mobile");
          break;
        case "데이터사이언스":
          engToKor.add("dataScience");
          break;
        case "게임 개발":
          engToKor.add("game");
          break;
        case "IoT개발":
          engToKor.add("iot");
          break;
      }
    });

    AccountModel model = await repository.signUpUser(email, fcmToken, gender,
        position, engToKor, provider, socialId, context);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("accessToken", model.accessToken);
    fetcher.sink.add(model);
  }
}

final userBloc = UserBloc();
