import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 27, 38, 2),
      body: Padding(
        padding: const EdgeInsets.only(left: 28, right: 28),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              height: 44,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Image(
                        width: 60,
                        height: 60,
                        image: AssetImage('images/profile.png')),
                    Positioned(
                      bottom: -5,
                      right: -5,
                      child: Image(
                          width: 30,
                          height: 30,
                          image: AssetImage('images/btn_change_profile.png')),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: '민경운\n',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    TextSpan(
                      text: 'mindev@kakao.com',
                      style: TextStyle(color: Colors.white),
                    )
                  ])),
                )
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 18, bottom: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("문의하기",
                        style: TextStyle(color: Colors.white, fontSize: 17)),
                    Image(image: AssetImage('images/ic_arrow_right.png'))
                  ],
                ),
              ),
            ),
            Container(
              height: 0.3,
              color: Colors.white,
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 18, bottom: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("이용약관",
                        style: TextStyle(color: Colors.white, fontSize: 17)),
                    Image(image: AssetImage('images/ic_arrow_right.png'))
                  ],
                ),
              ),
            ),
            Container(
              height: 0.3,
              color: Colors.white,
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 18, bottom: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("버전정보",
                        style: TextStyle(color: Colors.white, fontSize: 17)),
                    Image(image: AssetImage('images/ic_arrow_right.png'))
                  ],
                ),
              ),
            ),
            Container(
              height: 0.3,
              color: Colors.white,
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 18, bottom: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("알림설정",
                        style: TextStyle(color: Colors.white, fontSize: 17)),
                    Switch(
                        inactiveTrackColor: Colors.grey,
                        inactiveThumbColor: Color.fromRGBO(189, 189, 189, 1),
                        value: false,
                        onChanged: (status) {})
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
