import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePage();
}
enum AppState {
  free,
  picked,
  cropped,
}
class _ProfilePage extends State<ProfilePage> {
  AppState state;
  File imageFile;
  bool _alarmSetting = false;

  @override
  void initState() {
    super.initState();
    state = AppState.free;
  }

  Future<Null> _pickImage() async {
    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      setState(() {
        state = AppState.picked;
      });
    }
  }

  void _clearImage() {
    imageFile = null;
    setState(() {
      state = AppState.free;
    });
  }

  Future<Null> _cropImage() async {
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ]
            : [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio5x3,
          CropAspectRatioPreset.ratio5x4,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
    if (croppedFile != null) {
      imageFile = croppedFile;
      setState(() {});
    }
  }

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
                    SizedBox(
                        width: 60,
                        height: 60,
                        child: InkWell(
                          onTap: () {
                            if (state == AppState.free)
                              _pickImage();
                            else if (state == AppState.picked)
                              _cropImage();
                            else if (state == AppState.cropped) _clearImage();
                          },
                          child: Image.asset('images/profile.png'),
                        )),
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
                      value: _alarmSetting,
                      onChanged: (status) {
                        setState(() {
                          this._alarmSetting = status;
                        });
                      },)
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
