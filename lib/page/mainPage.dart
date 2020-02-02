import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(28, 27, 38, 2),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            topToolbar(context),
            topHeader(),
            topSubHeader(),
            division(),
            topSelect()
          ],
        ),
      ),
    );
  }

  Widget topToolbar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.notifications, color: Colors.white))
        ],
      ),
    );
  }

  Widget topHeader() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 28),
      width: double.infinity,
      child: Text(
        "어떤 스터디를\n생각하고 계신가요?",
        style: TextStyle(
            fontSize: 28, color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget topSubHeader() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 12, left: 28),
      child: Text(
        "원하는 스터디 조인에서 찾아보세요",
        style: TextStyle(
            fontSize: 14, color: Color.fromRGBO(203, 203, 203, 1), fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget division() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 36, left: 28),
      height: 1,
      color: Colors.white,
    );
  }

  Widget bottomNavigation() {
    return BottomNavigationBar();
  }

  Widget topSelect() {
    List<MainTopSelected> items = List();
    items.add(MainTopSelected("전체", false));
    items.add(MainTopSelected("기획자", false));
    items.add(MainTopSelected("디자이너", false));
    items.add(MainTopSelected("개발자", true));
    return Container(
      margin: const EdgeInsets.only(top: 12, left: 28),
      child: Row(
        children: items.map((item) =>
            GestureDetector(
              child: Container(
                margin: const EdgeInsets.only(right: 16),
                child: Text(item.title, style: TextStyle(fontSize: 14,
                    decoration: item.isSelected
                        ? TextDecoration.underline
                        : TextDecoration.none,
                    color: item.isSelected ? Colors.white : Color.fromRGBO(
                        165, 165, 165, 1))),
              ),
            )).toList(),
      ),
    );
  }
}

class MainTopSelected {
  String title;
  bool isSelected = false;

  MainTopSelected(this.title, this.isSelected);
}