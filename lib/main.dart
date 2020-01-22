import 'dart:io';

import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:join/page/joinMainPage.dart';
import 'package:join/page/loginPage.dart';

import 'const/strings.dart';
import 'page/signUpEmailPage.dart';

void main() {
  if (Platform.isIOS) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ));
  }
  runApp(JoinApp());
}

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
        next: (context) => LoginPage(),
        startAnimation: "intro",
        until: () => Future.delayed(Duration(seconds: 2)),
      ),
      routes: {
        Routes.HOME: (_) => JoinMainPage(),
        Routes.SIGN_UP: (_) => SignUpEmailPage()
      },
    );
  }
}
