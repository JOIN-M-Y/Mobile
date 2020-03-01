import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailStudyPage extends StatefulWidget {
  final String hash;

  DetailStudyPage(this.hash);

  @override
  State<StatefulWidget> createState() => _DetailStudyPage();
}

class _DetailStudyPage extends State<DetailStudyPage> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 27, 38, 2),
      body: Container(
        width: width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Hero(
                            tag: widget.hash,
                            child: Image(
                                alignment: Alignment.topCenter,
                                height: width,
                                image: AssetImage('images/img.png'),
                                fit: BoxFit.fitHeight)),
                        InkWell(
                            child: Container(
                          margin: const EdgeInsets.only(top: 50, left: 28),
                          child: ClipRect(
                            child: Image.asset(
                              'images/ic_white_arrow_left.png',
                              width: 32,
                              height: 32,
                            ),
                          ),
                        )),
                        Container(
                          margin: EdgeInsets.only(top: width - 12, left: 28),
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 4, bottom: 4),
                          color: Color.fromRGBO(72, 111, 65, 1),
                          height: 24,
                          child: Text("Android",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 21, left: 28),
                        child: Text("네이버 개발자 뮤와 함께하는\n내 인생 첫 번째 앱 만들기",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18))),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 28, right: 28, top: 5),
                      child: Text("강남구 ∙ 평일오후 3주",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(211, 211, 211, 1))),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 28, top: 32),
                      color: Colors.white,
                      height: 0.5,
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.only(left: 28, right: 28),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                              width: 38,
                              height: 38,
                              child: InkWell(
                                onTap: () {},
                                child: Image.asset('images/profile.png'),
                              )),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(left: 8, bottom: 3),
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                text: '민경운\n',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                              TextSpan(
                                text: 'mindev@kakao.com',
                                style: TextStyle(
                                    color: Color.fromRGBO(211, 211, 211, 1),
                                    fontSize: 11),
                              )
                            ])),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin:
                            const EdgeInsets.only(top: 29, left: 28, right: 28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("활동계획",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            Container(
                                margin: const EdgeInsets.only(top: 8),
                                child: Text(
                                    "안녕하세요! 주니어 기획자입니다! 다양한 서비스 기획과\n아티클에 대해 함께 분석할 팀원을 모집합니다!",
                                    style: TextStyle(
                                        color: Color.fromRGBO(211, 211, 211, 1),
                                        fontSize: 13))),
                            SizedBox(height: 36),
                            Text("스터디 모집 기간",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            Container(
                                margin: const EdgeInsets.only(top: 8),
                                child: Text("2020. 02. 14 - 2020. 02. 22 까지",
                                    style: TextStyle(
                                        color: Color.fromRGBO(211, 211, 211, 1),
                                        fontSize: 13))),
                            SizedBox(height: 40),
                          ],
                        ))
                  ],
                ),
              ),
            ),
            Container(
                height: 52,
                color: Color.fromRGBO(243, 102, 34, 1),
                child: Center(
                  child: Text("스터디 참여하기",
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ),
                alignment: Alignment.bottomCenter),
          ],
        ),
      ),
    );
  }
}
