import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailStudyPage extends StatefulWidget {
  final String hash;

  DetailStudyPage(this.hash);

  @override
  State<StatefulWidget> createState() => _DetailStudyPage();
}

class _DetailStudyPage extends State<DetailStudyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 27, 38, 2),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.width,
              child: Hero(
                  tag: widget.hash,
                  child: Image(
                      image: AssetImage('images/img.png'),
                      fit: BoxFit.fitWidth)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, left: 28),
              child: IconTheme(
                data: IconThemeData(color: Colors.white),
                child: IconButton(
                    iconSize: 32,
                    color: Colors.white,
                    highlightColor: Colors.white,
                    hoverColor: Colors.white,
                    icon: Icon(Icons.arrow_back),
                    onPressed: null),
              ),
            )
          ],
        ),
      ),
    );
  }
}
