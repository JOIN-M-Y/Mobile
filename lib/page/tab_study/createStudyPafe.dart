import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:join/common/ui.dart';
import 'package:join/network/baseDio.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';

class CreateStudy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CreateStudy();
}

class _CreateStudy extends State<CreateStudy> {
  bool value = false;
  int secretGroup = 1;
  int categoryGroup = 2;
  String _dateTime = "DD/MM/YYYY";
  Dio dio = createDio();
  
  @override
  void initState() {
    super.initState();
    getAddress();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 27, 38, 2),
      body: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 28, right: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    toolbar(),
                    studyTitle(),
                    studyTitleInputBox(),
                    studyPlan(),
                    studyPlanInputBox(),
                    SizedBox(height: 28),
                    studyRecruitCountText(),
                    SizedBox(height: 8),
                    studyRecruitCount(),
                    SizedBox(height: 28),
                    studyScheduleText(),
                    studySchedule(),
                    SizedBox(height: 28),
                    studySecretSettingText(),
                    SizedBox(height: 8),
                    studySecretSetting(),
                    SizedBox(height: 8),
                    studySecretSettingDescription(),
                    SizedBox(height: 28),
                    studyAreaText(),
                    SizedBox(height: 8),
                    studyArea(),
                    SizedBox(height: 28),
                    studyCategoryText(),
                    studyCategory()
                  ],
                ),
              ),
            ),
          ),
          createStudyButton()
        ],
      )),
    );
  }

  Widget studyCategory() {
    return Theme(
      data: ThemeData.dark(),
      child: Row(
        children: <Widget>[
          Radio(
            value: 1,
            groupValue: categoryGroup,
            activeColor: Color.fromRGBO(243, 102, 34, 1),
            onChanged: (value) {
              setState(() {
                this.categoryGroup = value;
              });
            },
          ),
          Text("기획",
              style: TextStyle(
                  fontSize: 15, color: Color.fromRGBO(177, 177, 177, 1))),
          Radio(
            value: 2,
            groupValue: categoryGroup,
            activeColor: Color.fromRGBO(243, 102, 34, 1),
            onChanged: (value) {
              setState(() {
                this.categoryGroup = value;
              });
            },
          ),
          Text("디자인",
              style: TextStyle(
                  fontSize: 15, color: Color.fromRGBO(177, 177, 177, 1))),
          Radio(
            value: 3,
            groupValue: categoryGroup,
            activeColor: Color.fromRGBO(243, 102, 34, 1),
            onChanged: (value) {
              setState(() {
                this.categoryGroup = value;
              });
            },
          ),
          Text("개발",
              style: TextStyle(
                  fontSize: 15, color: Color.fromRGBO(177, 177, 177, 1))),
        ],
      ),
    );
  }

  Widget studyCategoryText() => Text("카테고리 선택",
      style: TextStyle(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold));

  Future<List<String>> getAddress() async{
    try {
      final response = await addInterceptors(dio).get("/address");
      print(response);
    } catch (e) {
      print(e);
      return null;
    }
  }
  
  Widget studyArea() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(47, 51, 55, 1))),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 12, right: 12, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("도",
                      style: TextStyle(
                          fontSize: 13,
                          color: Color.fromRGBO(141, 140, 143, 1))),
                  Icon(Icons.arrow_drop_down, color: Colors.white)
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 13),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(47, 51, 55, 1))),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 12, right: 12, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("시",
                      style: TextStyle(
                          fontSize: 13,
                          color: Color.fromRGBO(141, 140, 143, 1))),
                  Icon(Icons.arrow_drop_down, color: Colors.white)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget studyAreaText() => Text("지역",
      style: TextStyle(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold));

  Widget studySecretSettingDescription() =>
      Text("※비공개일 경우, 방장이 링크/카카오톡 공유를 전달한상대만 \n초대가능니다.",
          style: TextStyle(color: Colors.white, fontSize: 12));

  Widget studySecretSetting() {
    return Theme(
      data: ThemeData.dark(),
      child: Row(
        children: <Widget>[
          Radio(
            value: 1,
            groupValue: secretGroup,
            activeColor: Color.fromRGBO(243, 102, 34, 1),
            onChanged: (value) {
              setState(() {
                this.secretGroup = value;
              });
            },
          ),
          Text("공개 스터디",
              style: TextStyle(
                  fontSize: 15, color: Color.fromRGBO(177, 177, 177, 1))),
          Radio(
            value: 2,
            groupValue: secretGroup,
            activeColor: Color.fromRGBO(243, 102, 34, 1),
            onChanged: (value) {
              setState(() {
                this.secretGroup = value;
              });
            },
          ),
          Text("비공개 스터디",
              style: TextStyle(
                  fontSize: 15, color: Color.fromRGBO(177, 177, 177, 1))),
        ],
      ),
    );
  }

  Widget studySecretSettingText() {
    return Text("공개 설정",
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold));
  }

  Future selectDate() async {
    DateTime picked = await showDatePicker(
      context: context,
      locale: const Locale('ko', 'KO'),
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );
    if (picked != null) setState(() => _dateTime = picked.toString().substring(0,10));
  }

  Widget studySchedule() {
    return GestureDetector(
      onTap: () {
        selectDate();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(47, 55, 51, 1))),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 11, bottom: 11, left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(_dateTime,
                  style: TextStyle(
                      fontSize: 13, color: Color.fromRGBO(141, 140, 143, 1))),
              Icon(Icons.calendar_today,
                  color: Color.fromRGBO(141, 140, 143, 1))
            ],
          ),
        ),
      ),
    );
  }

  Widget studyScheduleText() {
    return Text("스터디 모집기간",
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold));
  }

  Widget studyRecruitCount() {
    return Row(
      children: <Widget>[
        InkWell(
          child: Icon(Icons.remove, color: Color.fromRGBO(47, 55, 51, 1)),
        ),
        SizedBox(width: 12),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(47, 55, 51, 1))),
          alignment: Alignment.center,
          width: 48,
          height: 40,
          child: Text("0",
              style: TextStyle(
                  color: Color.fromRGBO(141, 140, 143, 1), fontSize: 15)),
        ),
        SizedBox(width: 12),
        InkWell(
          child: Icon(Icons.add, color: Colors.white),
        ),
      ],
    );
  }

  Widget studyRecruitCountText() {
    return Text("모집 인원",
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold));
  }

  Widget toolbar() {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Image.asset("images/arrow_left.png"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Text(
          "스터디 만들기",
          style: TextStyle(color: Colors.white, fontSize: 15),
        )
      ],
    );
  }

  Widget createStudyButton() {
    return Container(
      color: Color.fromRGBO(165, 165, 165, 1),
      alignment: Alignment.bottomCenter,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text("스터디 개설하기",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget studyTitle() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        children: <Widget>[
          Text(
            "스터디 제목",
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 4),
          Text(
            "(0/20)",
            style: TextStyle(
                color: Color.fromRGBO(177, 177, 177, 1), fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget studyTitleInputBox() {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(top: 8),
      child: new Theme(
          data: new ThemeData(
              primaryColor: Color.fromRGBO(47, 55, 51, 1),
              hintColor: Colors.yellow),
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(10),
                hintText: "제목",
                hintStyle: TextStyle(color: Color.fromRGBO(141, 140, 143, 1)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(47, 55, 51, 1),
                    style: BorderStyle.solid,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    style: BorderStyle.solid,
                  ),
                )),
          )),
    );
  }

  Widget studyPlan() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        children: <Widget>[
          Text(
            "활동 계획",
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 4),
          Text(
            "(0/20)",
            style: TextStyle(
                color: Color.fromRGBO(177, 177, 177, 1), fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget studyPlanInputBox() {
    return Container(
      height: 260,
      margin: const EdgeInsets.only(top: 8),
      child: new Theme(
        data: new ThemeData(
            primaryColor: Color.fromRGBO(47, 55, 51, 1),
            hintColor: Colors.yellow),
        child: TextField(
          expands: true,
          maxLines: null,
          maxLength: 200,
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
              hintText: "활동 계획을 입력해주세요",
              counterText: "",
              hintStyle: TextStyle(color: Color.fromRGBO(141, 140, 143, 1)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(47, 55, 51, 1),
                  style: BorderStyle.solid,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  style: BorderStyle.solid,
                ),
              )),
        ),
      ),
    );
  }
}
