import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:join/blocs/recommend_bloc.dart';

class RecommendPage extends StatefulWidget {
  final RecommendStudy study;

  const RecommendPage({Key key, this.study}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RecommendPage();
}

class _RecommendPage extends State<RecommendPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Image(image: AssetImage('images/img.png'), fit: BoxFit.fitWidth));
  }
}
