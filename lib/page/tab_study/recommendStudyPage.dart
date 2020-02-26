import 'package:flutter/material.dart';
import 'package:join/blocs/recommend_bloc.dart';

class RecommendStudyPage extends StatefulWidget {
  final RecommendStudy study;
  final bool isLastPosition;

  const RecommendStudyPage({Key key, this.study, this.isLastPosition})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _RecommendStudyPage();
}

class _RecommendStudyPage extends State<RecommendStudyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 10),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Image(
                    image: AssetImage('images/img.png'),
                    fit: BoxFit.fitWidth,
                    height: 152,
                    width: double.infinity,
                  ),
                ),
                Wrap(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 4, bottom: 4),
                      color: Color.fromRGBO(72, 111, 65, 1),
                      height: 24,
                      child: Text("Android",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400)),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 16),
              child: Text("2시간만에 앱 만들면서 코딩 맛보기!",
                  style: TextStyle(color: Colors.white))),
          Container(
              margin: const EdgeInsets.only(top: 4),
              child:
                  Text("강남구 평일오후/16주", style: TextStyle(color: Colors.white))),
          Container(
            margin: const EdgeInsets.only(top: 16),
            height: 0.5,
            color: (widget.isLastPosition) ? Colors.transparent : Colors.white,
          )
        ],
      ),
    );
  }
}
