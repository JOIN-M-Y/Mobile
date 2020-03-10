import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JoinDialog extends StatelessWidget {
  final String title, content;

  JoinDialog({this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3.5,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(title,
                          style: TextStyle(color: Colors.black, fontSize: 20)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: Text(content,
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                          textAlign: TextAlign.center),
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              print("clic");
              Navigator.of(context).pop();
            },
            child: Container(
              width: double.infinity,
              height: (MediaQuery.of(context).size.height / 3) / 4.5,
              color: Color.fromRGBO(243, 102, 34, 1),
              alignment: Alignment.center,
              child: Text("확인",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center),
            ),
          )
        ],
      ),
    );
  }
}
