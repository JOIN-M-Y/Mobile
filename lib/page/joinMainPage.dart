import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:join/blocs/google_auth_bloc.dart';

class JoinMainPage extends StatefulWidget {
  @override
  _JoinMainPageState createState() => _JoinMainPageState();
}

class _JoinMainPageState extends State<JoinMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Test"),
        ),
        body: Column(
          children: <Widget>[
            _builderGoogleAuth()
          ],
        ));
  }

  Widget _builderGoogleAuth() {
    return StreamBuilder(
      stream: googleAuthBloc.googleAccount,
      builder: (BuildContext context,
          AsyncSnapshot<GoogleSignInAccount> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            child: RaisedButton(
                child: const Text("Sign in"),
                onPressed: () => googleAuthBloc.sigInGoogle()
            ),
          );
        } else {
          //Test
          return Container(child: Text(snapshot.data.email));
        }
      },
    );
  }
}
