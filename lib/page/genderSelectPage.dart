import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:join/common/ui.dart';
import 'package:join/custom/SIgnupRadioButton.dart';

class GenderSelectPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GenderSelectPage();
}

class _GenderSelectPage extends State<GenderSelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child:
                      topDescription("성별 선택", "추천스터디를 위하여 필요합니다.\n성별을 선택해주세요")),
              radioButton("123")
            ],
          ),
        )));
  }

  Widget radioButton(String title) {
    return RadioButton(RadioModel(true, title));
  }
}
