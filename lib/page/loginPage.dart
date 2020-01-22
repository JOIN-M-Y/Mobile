import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:join/const/strings.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(28, 27, 38, 2),
        body: Padding(
          padding: const EdgeInsets.only(left: 28, right: 28),
          child: SafeArea(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              toolbar(),
              description(),
              inputEmailForm(),
              inputPasswordForm(),
              loginButton(),
              googleLoginButton(),
              idPwFindORSignIn(context)
            ],
          )),
        ));
  }
}

Widget idPwFindORSignIn(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("아이디, 비밀번호 찾기 |", style: TextStyle(
            fontSize: 12, color: Color.fromRGBO(177, 177, 177, 1))),
        GestureDetector(
            onTap: () => Navigator.pushNamed(context, Routes.SIGN_UP),
            child: Text("계정이 없으신가요?", style: TextStyle(
                fontSize: 12, color: Color.fromRGBO(177, 177, 177, 1)),
            ))
      ]
    )
  );
}

Widget googleLoginButton() {
  return Container(
    margin: EdgeInsets.only(top: 112),
    child: FlatButton(
      onPressed: () {

      },
      color: Color.fromRGBO(66, 134, 245, 1),
      padding: EdgeInsets.only(top: 19, bottom: 16),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: Color.fromRGBO(66, 134, 245, 1))
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(right: 4),
              child: Image.asset("images/ic_google.png")),
          Text("구글 계정으로 시작하기", style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400))
        ],
      ),
    ),
  );
}

Widget loginButton() {
  return Container(
    alignment: Alignment.centerRight,
    margin: EdgeInsets.only(top: 36),
    child: IconButton(
      padding: EdgeInsets.all(0),
      iconSize: 52,
      onPressed: () {},
      icon: Image.asset("images/btn_login_disabled.png"),
    ),
  );
}

Widget inputPasswordForm() {
  return Container(
    margin: EdgeInsets.only(top: 25),
    child: TextFormField(
      decoration: InputDecoration(
          hintText: "비밀번호 입력",
          hintStyle:
              TextStyle(color: Color.fromRGBO(165, 165, 165, 1), fontSize: 15),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(91, 91, 91, 1)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          )),
      style: TextStyle(color: Colors.white, fontSize: 15),
      keyboardType: TextInputType.emailAddress,
      maxLines: 1,
      cursorColor: Colors.white,
    ),
  );
}

Widget inputEmailForm() {
  return Container(
    margin: EdgeInsets.only(top: 68),
    child: TextFormField(
      decoration: InputDecoration(
          hintText: "이메일 입력",
          hintStyle:
              TextStyle(color: Color.fromRGBO(165, 165, 165, 1), fontSize: 15),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(91, 91, 91, 1)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          )),
      style: TextStyle(color: Colors.white, fontSize: 15),
      keyboardType: TextInputType.emailAddress,
      maxLines: 1,
      cursorColor: Colors.white,
    ),
  );
}

Widget description() {
  return Container(
    margin: EdgeInsets.only(top: 56),
    child: Text(
      "로그인후 원하시는 \n스터디를 개설해보세요.",
      style: TextStyle(
          fontWeight: FontWeight.w400, color: Colors.white, fontSize: 24),
    ),
  );
}

Widget toolbar() {
  return Row(
    children: <Widget>[
      IconButton(
        icon: Image.asset("images/arrow_left.png"),
        onPressed: () {},
      ),
      Text(
        "로그인",
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
      )
    ],
  );
}
