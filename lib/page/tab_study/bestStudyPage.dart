import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:join/blocs/recommend_bloc.dart';

class BestStudyPage extends StatefulWidget {
  final RecommendStudy study;

  const BestStudyPage({Key key, this.study}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BestStudyPage();
}

class _BestStudyPage extends State<BestStudyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Image(image: AssetImage('images/img.png'), fit: BoxFit.fitWidth));
  }
}
