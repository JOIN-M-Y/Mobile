import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:join/common/ui.dart';
import 'package:join/const/strings.dart';

class DetailJobPage extends StatefulWidget {
  final DetailJobPageArguments arguments;

  DetailJobPage(this.arguments);

  List<DetailJobItem> items = [];

  @override
  State<StatefulWidget> createState() => _DetailJogPage();
}

class _DetailJogPage extends State<DetailJobPage> {
  bool value = false;
  int group = 1;
  List<DetailJobItem> items = [];

  @override
  void dispose() {
    items.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (items.length == 0) {
      switch (widget.arguments.position) {
        case "develop":
          items.add(DetailJobItem("웹 개발", false));
          items.add(DetailJobItem("서버 개발", false));
          items.add(DetailJobItem("모바일 개발", false));
          items.add(DetailJobItem("데이터사이언스", false));
          items.add(DetailJobItem("게임 개발", false));
          items.add(DetailJobItem("IoT 개발", false));
          break;
        case "design":
          items.add(DetailJobItem("BX 디자인", false));
          items.add(DetailJobItem("UX/UI 디자인", false));
          items.add(DetailJobItem("영상 디자인", false));
          items.add(DetailJobItem("3D 디자인", false));
          items.add(DetailJobItem("일러스트레이터", false));
          break;
        case "planning":
          items.add(DetailJobItem("GA 기획", false));
          items.add(DetailJobItem("UX 기획", false));
          items.add(DetailJobItem("역 기획", false));
          items.add(DetailJobItem("마케팅 기획", false));
          break;
      }
    }
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
                            "관심분야 선택", "추천스터디를 위하여 필요합니다.\n자신의 직업을 선택해주세요")),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: items.map((item) {
                                return Column(
                                  children: <Widget>[
                                    ListTile(
                                        title: Text(item.title,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18)),
                                        leading: CircularCheckBox(
                                            value: item.getIsChecked(),
                                            activeColor:
                                                Color.fromRGBO(243, 102, 34, 1),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize.padded,
                                            onChanged: (bool x) {
                                              print(item.isChecked);
                                              setState(() {
                                                item.setIsChecked(x);
                                              });
                                            })),
                                    division()
                                  ],
                                );
                              }).toList(),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 32, right: 28),
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                color: Colors.white,
                                iconSize: 52,
                                onPressed: () {
                                  Navigator.pushNamed(context, Routes.MAIN);
                                },
                                icon: Image.asset(
                                    "images/btn_login_disabled.png",
                                    color: Colors.white),
                                enableFeedback: false,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ])),
        ),
      ),
    );
  }

  Widget division() {
    return Container(
        width: double.infinity,
        height: 1,
        margin: const EdgeInsets.only(right: 28),
        color: Color.fromRGBO(91, 91, 91, 1));
  }

  Widget checkButton(DetailJobItem item) {
    return Column(
      children: <Widget>[
        ListTile(
            title: Text(item.title,
                style: TextStyle(color: Colors.white, fontSize: 18)),
            leading: CircularCheckBox(
                value: item.getIsChecked(),
                activeColor: Color.fromRGBO(243, 102, 34, 1),
                materialTapTargetSize: MaterialTapTargetSize.padded,
                onChanged: (bool x) {
                  print(item.isChecked);
                  setState(() {
                    item.setIsChecked(x);
                  });
                })),
        division()
      ],
    );
  }
}

class DetailJobItem {
  String title;
  bool isChecked;

  DetailJobItem(this.title, this.isChecked);

  void setIsChecked(bool isChecked) {
    this.isChecked = isChecked;
  }

  bool getIsChecked() {
    return isChecked;
  }
}

class DetailJobPageArguments {
  final String gender;
  final String position;

  DetailJobPageArguments(this.gender, this.position);
}
