import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class NewStudyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewStudyPage();
}

class _NewStudyPage extends State<NewStudyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 60),
        child: Column(children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 28, right: 28),
            width: double.infinity,
            color: Colors.white,
            height: 1,
          ),
          Container(
              margin: const EdgeInsets.only(
                top: 13,
                left: 28,
                right: 28,
              ),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("신규 스터디",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    GestureDetector(
                        onTap: () {},
                        child: Row(children: <Widget>[
                          Icon(Icons.add,
                              size: 13, color: Color.fromRGBO(243, 102, 34, 1)),
                          Text("더보기",
                              style: TextStyle(
                                  color: Color.fromRGBO(216, 216, 216, 1),
                                  fontSize: 12))
                        ]))
                  ])),
          Container(
            margin: const EdgeInsets.only(top: 24),
            width: double.infinity,
            height: 400,
            child: Swiper(
                containerWidth: MediaQuery.of(context).size.width,
                itemWidth: MediaQuery.of(context).size.width - 30,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                viewportFraction: 0.8,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: double.infinity,
                    height: 280,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                                margin: const EdgeInsets.only(right: 20),
                                child: Image(
                                    width: 307,
                                    height: 260,
                                    image: AssetImage('images/img.png'),
                                    fit: BoxFit.fill)),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 15, right: 8, top: 250, bottom: 4),
                              width:
                                  (MediaQuery.of(context).size.width / 2) / 2,
                              alignment: Alignment.center,
                              color: Colors.grey,
                              height: 24,
                              child: Text("UX Planning",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 24),
                          child: Text("전 외국계 앱회사 대표의\n한국 데이팅앱 시장과 기획자를 위한",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17)),
                        )
                      ],
                    ),
                  );
                }),
          ),
          Container(
            margin: const EdgeInsets.only(left: 28, right: 28),
            width: double.infinity,
            color: Colors.white,
            height: 0.5,
          ),
          SizedBox(height: 32),
          GridView.count(
            shrinkWrap: true,
            mainAxisSpacing: 40,
            crossAxisCount: 2,
            children: List.generate(5, (index) {
              return Container(
                margin: const EdgeInsets.only(top: 12, left: 28, right: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Image(
                        width: 152,
                        height: 140,
                        image: AssetImage('images/img.png'),
                        fit: BoxFit.fill),
                    Expanded(
                      child: Container(
                        child: Text("BX Design",
                            style: TextStyle(
                                color: Color.fromRGBO(211, 211, 211, 1),
                                fontSize: 10)),
                        margin: const EdgeInsets.only(top: 12),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Text("나무13과 함께 레트로 아이패드 드로잉",
                            style: TextStyle(color: Colors.white, fontSize: 13)),
                        margin: const EdgeInsets.only(top: 11),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          child: Text("나무13과 함께 레트로 아이패드 드로잉",
                              style: TextStyle(
                                  color: Color.fromRGBO(211, 211, 211, 1),
                                  fontSize: 11)),
                          margin: const EdgeInsets.only(top: 4)),
                    )
                  ],
                ),
              );
            }),
          ),
        ]));
  }
}
