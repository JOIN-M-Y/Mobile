import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:join/const/strings.dart';

class SignUpEmailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpEmailPage();
}

class _SignUpEmailPage extends State<SignUpEmailPage> {
  int stepCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 27, 38, 2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 28, right: 28),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              topToolbar(context),
              textStep(),
              inputForm(),
              loginButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget topToolbar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: <Widget>[
          GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image(image: AssetImage('images/arrow_left.png'))),
          Text(
            Strings.SIGN_UP_TITLE,
            style: TextStyle(color: Colors.white, fontSize: 16),
          )
        ],
      ),
    );
  }

  Widget textStep() {
    return Container(
      margin: const EdgeInsets.only(top: 137),
      child: Text(
        "Setp $stepCount / 4",
        style: TextStyle(color: Color.fromRGBO(165, 165, 165, 1), fontSize: 14),
      ),
    );
  }

  Widget inputForm() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 19),
      child: Wrap(
        children: <Widget>[
          TextFormField(
            textAlign: TextAlign.center,
            maxLength: 20,
            decoration: InputDecoration(
                hintText: "이메일",
                hintStyle: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1), fontSize: 24),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                )),
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1), fontSize: 24),
            keyboardType: TextInputType.emailAddress,
            maxLines: 1,
            cursorColor: Color.fromRGBO(0, 122, 255, 1),
          )
        ],
      ),
    );
  }

  Widget loginButton() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 152),
      child: IconButton(
        padding: EdgeInsets.all(0),
        iconSize: 52,
        onPressed: () {
          stepCount++;
          setState((){});
        },
        icon: Image.asset("images/btn_login_disabled.png"),
      ),
    );
  }
}
