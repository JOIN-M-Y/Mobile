import 'package:flutter/material.dart';
import 'package:join/page/joinMainPage.dart';

void main() => runApp(JoinApp());

class JoinApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JoinMainPage(),
    );
  }
}
