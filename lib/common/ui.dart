import 'package:flutter/material.dart';

Widget topToolbar(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      IconButton(
        icon: Image.asset("images/arrow_left.png"),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ],
  );
}

Widget topDescription(String topTitle, String subTitle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        topTitle,
        style: TextStyle(
            fontWeight: FontWeight.w400, color: Colors.white, fontSize: 22),
      ),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          subTitle,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(203, 203, 203, 1),
              fontSize: 14),
        ),
      ),
      Container(
        color: Colors.white,
        width: double.infinity,
        height: 1,
        margin: const EdgeInsets.only(top: 56),
      )
    ],
  );
}
