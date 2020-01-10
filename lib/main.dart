import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:join/page/joinMainPage.dart';
import 'package:join/page/notification.dart';

import 'const/strings.dart';

void main() => runApp(JoinApp());

class JoinApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen.navigate(
        name: "images/join_splash.flr",
        next: (context) => NotificationPage(),
        startAnimation: "intro",
        until: () => Future.delayed(Duration(seconds: 2)),
      ),
      routes: {Routes.HOME: (_) => JoinMainPage()},
    );
  }
}
