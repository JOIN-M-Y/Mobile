import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:join/blocs/google_auth_bloc.dart';
import 'package:join/blocs/user_bloc.dart';
import 'package:join/const/strings.dart';
import 'package:join/network/baseDio.dart';
import 'package:join/page/signin/genderSelectPage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  void dispose() {
    userBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(28, 27, 38, 2),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  description(),
                  subDescription(),
                ],
              ),
            ),
            Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[aroundMainPage(), division()],
                )),
            Flexible(flex: 1, child: googleLoginButton())
          ],
        )));
  }

  Widget aroundMainPage() {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.MAIN);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("둘러보기",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 13,
                    color: Color.fromRGBO(216, 216, 216, 1))),
            Icon(Icons.arrow_right, color: Color.fromRGBO(216, 216, 216, 1))
          ],
        ),
      ),
    );
  }

  Future<Response> getUserInfo(GoogleSignInAccount account) async {
    try {
      Map<String, dynamic> param = {
        "email": account.email,
        "provider": "gmail",
        "social_id": account.id
      };
      addInterceptors(createDio()).get("accounts", queryParameters: param);
      return addInterceptors(createDio())
          .get("accounts", queryParameters: param);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Widget googleLoginButton() {
    return Container(
      alignment: Alignment.center,
      child: StreamBuilder(
        stream: googleAuthBloc.googleAccount,
        builder: (BuildContext context,
            AsyncSnapshot<GoogleSignInAccount> snapshot) {
          if (snapshot.hasData) {
            moveGenderPager(() {
              userBloc.isSignUpUser(snapshot.data).then((value) {
                if (value.accessToken.isNotEmpty) {
                  Navigator.pushReplacementNamed(context, Routes.MAIN);
                } else {
                  Navigator.pushNamed(context, Routes.GENDER,
                      arguments: GenderSelectArguments(snapshot.data));
                }
                googleAuthBloc.signOutGoogle();
              }).catchError((e) {
                googleAuthBloc.signOutGoogle();
              });
            });
          }
          return FlatButton(
            onPressed: () {
              googleAuthBloc.sigInGoogle();
            },
            child: Image(image: AssetImage("images/btn_login_google.png")),
          );
        },
      ),
    );
  }

  void moveGenderPager(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  Widget description() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "반갑습니다.",
        style: TextStyle(
            fontWeight: FontWeight.w400, color: Colors.white, fontSize: 24),
      ),
    );
  }

  Widget subDescription() {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Text(
        "회원 서비스 이용을 위해\n로그인 해주세요.",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Color.fromRGBO(203, 203, 203, 1),
            fontWeight: FontWeight.w400,
            fontSize: 17),
      ),
    );
  }

  Widget division() {
    return Container(
      alignment: Alignment.bottomCenter,
      width: double.infinity,
      height: 0.5,
      color: Colors.white,
    );
  }
}
