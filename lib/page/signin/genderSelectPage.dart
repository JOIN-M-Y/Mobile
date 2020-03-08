import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:join/common/ui.dart';
import 'package:join/const/strings.dart';

import 'jobPage.dart';

class GenderSelectPage extends StatefulWidget {
  final GenderSelectArguments arguments;

  GenderSelectPage(this.arguments);
  @override
  State<StatefulWidget> createState() => _GenderSelectPage();
}

class _GenderSelectPage extends State<GenderSelectPage> {
  bool value = false;
  int group = 1;

  @override
  Widget build(BuildContext context) {
    print(widget.arguments.googleSignInAccount.email);
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color.fromRGBO(28, 27, 38, 2),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(top: 6, left: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                topToolbar(context),
                Container(
                    margin: const EdgeInsets.only(top: 17),
                    child: topDescription(
                        "성별 선택", "추천스터디를 위하여 필요합니다.\n성별을 선택해주세요")),
                radioButton(1, "남자"),
                division(),
                radioButton(2, "여자"),
                division(),
                Container(
                  margin: const EdgeInsets.only(top: 32),
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    color: Colors.white,
                    iconSize: 52,
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.JOB,
                          arguments: JobPageArguments(
                              (group == 1) ? "male" : "femail",widget.arguments.googleSignInAccount));
                    },
                    icon: Image.asset("images/btn_login_disabled.png",
                        color: Colors.white),
                    enableFeedback: false,
                  ),
                )
              ],
            ),
          ))),
    );
  }

  Widget division() {
    return Container(
        width: double.infinity,
        height: 1,
        margin: const EdgeInsets.only(top: 9, right: 28),
        color: Color.fromRGBO(91, 91, 91, 1));
  }

  Widget radioButton(int value, String title) {
    return ListTile(
        title: Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
        leading: Radio(
          value: value,
          groupValue: group,
          activeColor: Color.fromRGBO(243, 102, 34, 1),
          onChanged: (value) {
            setState(() {
              this.group = value;
            });
          },
        ));
  }
}

class GenderSelectArguments {
  final GoogleSignInAccount googleSignInAccount;

  GenderSelectArguments(this.googleSignInAccount);
}
