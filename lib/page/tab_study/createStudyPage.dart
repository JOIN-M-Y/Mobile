import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:join/common/ui.dart';
import 'package:join/model/address_model.dart';
import 'package:join/network/baseDio.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';

class CreateStudy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CreateStudy();
}

class _CreateStudy extends State<CreateStudy> {
  bool value = false;
  int secretGroup = 1;
  int categoryGroup = 1;
  String _dateTime = "DD/MM/YYYY";
  Dio dio = createDio();
  var firstAddressList = [];
  var secondAddressList = [];
  String firstAddress = "도";

  String secondAddress = "시";
  int recruitCount = 0;

  String _interestStudyType = "스터디 상세 카테고리를 선택해주세요";
  var devStudy = ["웹 개발","서버 개발","모바일 개발","데이터사이언스","게임 개발","IoT 개발"];
  var designStudy = ["BX 디자인","UX/UI 디자인","영상 디자인","3D 디자인","일러스트레이터"];
  var planningStudy = ["GA 기획","UX 기획","역 기획","3D 디자인","마케팅 기획"];


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
                    studyArea(context),
                    SizedBox(height: 28),
                    studyCategoryText(),
                    SizedBox(height: 11),
                    studyCategory(),
                    SizedBox(height: 29),
                    interestStudyTypeText(),
                    SizedBox(height: 9),
                    interestStudyType(),
                    SizedBox(height: 40)
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

  void selectInterestStudyType(){
    var currentStudyItems = [];
    switch(categoryGroup){
      case 1 :
        currentStudyItems = planningStudy;
        break;
      case 2:
        currentStudyItems = designStudy;
        break;
      case 3:
        currentStudyItems = devStudy;
        break;
    }
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: currentStudyItems.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        _interestStudyType = currentStudyItems[index];
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(currentStudyItems[index],
                          style: TextStyle(fontSize: 20)),
                    ));
              });
        });
  }

  Widget interestStudyType(){
    return GestureDetector(
      onTap: () {
        selectInterestStudyType();
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
              Text(_interestStudyType,
                  style: TextStyle(
                      fontSize: 13,
                      color: (_interestStudyType == "스터디 상세 카테고리를 선택해주세요")
                          ? Color.fromRGBO(141, 140, 143, 1)
                          : Colors.white)),
              Icon(Icons.arrow_drop_down,
                  color: Color.fromRGBO(141, 140, 143, 1))
            ],
          ),
        ),
      ),
    );
  }

  Widget interestStudyTypeText() => Text("관심 분야 선택",
      style: TextStyle(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold));

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

  Future<Address> getAddress() async {
    try {
      final response = await addInterceptors(dio).get("/address");
      Address name = Address.fromJson(response.data);
      setState(() {
        firstAddressList.clear();
        firstAddressList.addAll(name.address);
      });
      name.address.forEach((f) {
        print(f);
      });
      return Address.fromJson(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  bool isLoading = false;

  Future<Address> getSecondAddress(String address) async {
    try {
      isLoading = true;
      final response = await addInterceptors(dio)
          .get("/address/${Uri.encodeComponent(address)}");
      Address name = Address.fromJson(response.data);
      setState(() {
        secondAddressList.clear();
        secondAddressList.addAll(name.address);
      });
      isLoading = false;
      name.address.forEach((f) {
        print(f);
      });
      return Address.fromJson(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Widget studyArea(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              _showFirstAddressBottomSheet(context);
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(47, 51, 55, 1))),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(firstAddress,
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromRGBO(141, 140, 143, 1))),
                    Icon(Icons.arrow_drop_down, color: Colors.white)
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 13),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              if (secondAddressList.isEmpty) {
                Fluttertoast.showToast(
                    msg: "지역을 먼저 선택해주세요.",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    textColor: Colors.white,
                    fontSize: 16.0);
              } else {
                _showSecondAddressBottomSheet(context);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(47, 51, 55, 1))),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(secondAddress,
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromRGBO(141, 140, 143, 1))),
                    Icon(Icons.arrow_drop_down, color: Colors.white)
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void _showFirstAddressBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: firstAddressList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      getSecondAddress(firstAddressList[index]);
                      setState(() {
                        firstAddress = firstAddressList[index];
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(firstAddressList[index],
                          style: TextStyle(fontSize: 20)),
                    ));
              });
        });
  }

  void _showSecondAddressBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          if (isLoading) {
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: secondAddressList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        setState(() {
                          secondAddress = secondAddressList[index];
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(secondAddressList[index],
                            style: TextStyle(fontSize: 20)),
                      ));
                });
          }
        });
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
    if (picked != null)
      setState(() => _dateTime = picked.toString().substring(0, 10));
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
                      fontSize: 13,
                      color: (_dateTime == "DD/MM/YYYY")
                          ? Color.fromRGBO(141, 140, 143, 1)
                          : Colors.white)),
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
          onTap: () {
            if (recruitCount > 0) {
              setState(() {
                --recruitCount;
              });
            }
          },
          child: Icon(Icons.remove,
              color: (recruitCount > 0)
                  ? Colors.white
                  : Color.fromRGBO(47, 55, 51, 1)),
        ),
        SizedBox(width: 12),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(47, 55, 51, 1))),
          alignment: Alignment.center,
          width: 48,
          height: 40,
          child: Text("$recruitCount",
              style: TextStyle(
                  color: (recruitCount > 0)
                      ? Colors.white
                      : Color.fromRGBO(141, 140, 143, 1),
                  fontSize: 15)),
        ),
        SizedBox(width: 12),
        InkWell(
          onTap: () {
            setState(() {
              recruitCount++;
            });
          },
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
            style: TextStyle(fontSize: 13,color: Colors.white),
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
            "(0/200)",
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
          style: TextStyle(fontSize: 13,color: Colors.white),
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
