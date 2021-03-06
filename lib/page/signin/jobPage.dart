import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:join/common/ui.dart';
import 'package:join/const/strings.dart';

import 'detailJobPage.dart';

class JobPage extends StatefulWidget {
  final JobPageArguments arguments;

  JobPage(this.arguments);

  @override
  State<StatefulWidget> createState() => _JobPage();
}

class _JobPage extends State<JobPage> {
  bool value = false;
  int group = 1;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
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
                            "직업 선택", "추천스터디를 위하여 필요합니다.\n자신의 직업을 선택해주세요")),
                    radioButton(1, "개발자"),
                    division(),
                    radioButton(2, "디자이너"),
                    division(),
                    radioButton(3, "기획자"),
                    division(),
                    Container(
                      margin: const EdgeInsets.only(top: 32),
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        color: Colors.white,
                        iconSize: 52,
                        onPressed: () {
                          var position;
                          switch (group) {
                            case 1:
                              position = "develop";
                              break;
                            case 2:
                              position = "design";
                              break;
                            case 3:
                              position = "planning";
                              break;
                          }
                          Navigator.pushNamed(context, Routes.DETAIL_JOB,
                              arguments: DetailJobPageArguments(
                                  widget.arguments.gender,
                                  position,
                                  widget.arguments.googleSignInAccount));
                        },
                        icon: Image.asset("images/btn_login_disabled.png",
                            color: Colors.white),
                        enableFeedback: false,
                      ),
                    )
                  ])),
        ),
      ),
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

class JobPageArguments {
  final String gender;
  final GoogleSignInAccount googleSignInAccount;

  JobPageArguments(this.gender, this.googleSignInAccount);
}
