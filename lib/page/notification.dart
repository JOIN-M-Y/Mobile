import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:join/const/strings.dart';

class NotificationPage extends StatefulWidget {
  @override
  State createState() => _Notification();
}

class _Notification extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 27, 38, 2),
      body: Column(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(right: 28, left: 28),
              child: Column(
                children: <Widget>[
                  topToolbar(),
                  notificationTab(),
                  unReadCount(),
                  Container(
                    width: double.infinity,
                    height: 2,
                    margin: const EdgeInsets.only(top: 8),
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget topToolbar() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: <Widget>[
          Image(image: AssetImage('images/arrow_left.png')),
          Text(
            Strings.NOTIFICATION_TITLE,
            style: TextStyle(color: Colors.white, fontSize: 16),
          )
        ],
      ),
    );
  }

  Widget notificationTab() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(top: 31),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Align(
                alignment: Alignment.centerRight,
                child: Text(Strings.NOTIFICATION_NOTICE,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(165, 165, 165, 1),
                        fontSize: 30))),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.only(top: 6),
                          alignment: Alignment.topRight,
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(243, 102, 34, 1),
                            shape: BoxShape.circle,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Text(Strings.NOTIFICATION_TITLE,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 30)),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget unReadCount() {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("2",
              style: TextStyle(
                  fontSize: 17,
                  color: Color.fromRGBO(243, 102, 34, 1),
                  fontWeight: FontWeight.w400)),
          Text(Strings.NOTIFICATION_UNREAD_COUNT,
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
