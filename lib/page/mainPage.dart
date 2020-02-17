import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:join/blocs/recommend_bloc.dart';
import 'package:join/common/ui.dart';
import 'package:join/page/tab_profile/profilePage.dart';
import 'package:join/page/tab_study/bestStudyPage.dart';
import 'package:join/page/tab_study/recommendStudyPage.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  var currentTopTap = "전체";
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(28, 27, 38, 2),
      body: SafeArea(
        child: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    topHeader(),
                    topSubHeader(),
                    division(),
                    topSelect(),
                    bestStudy(),
                    recommendStudyType()
                  ],
                ),
              ),
              Container(color: Colors.red,),
              Container(color: Colors.green,),
              ProfilePage()
            ],
          ),
          ),
      ),
      bottomNavigationBar: JoinBottomNavigation(
        backgroundColor: Color.fromRGBO(28, 27, 38, 2),
        selectedIndex: _currentIndex,
        showElevation: false,
        itemCornerRadius: 6,
        curve: Curves.decelerate,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: [
          JoinBottomNavigationItem(
            icon: Image(
                width: 22,
                height: 22,
                image: AssetImage("images/ic_home.png")),
            title: Text('홈'),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          ),
          JoinBottomNavigationItem(
            icon: Image(
                width: 22,
                height: 22,
                image: AssetImage("images/ic_search.png")),
            title: Text('검색'),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          ),
          JoinBottomNavigationItem(
            icon: Image(
                width: 22,
                height: 22,
                image: AssetImage("images/ic_create_study.png")),
            title: Text('작성'),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          ),
          JoinBottomNavigationItem(
            icon: Image(
                width: 22,
                height: 22,
                image: AssetImage("images/ic_mypage.png")),
            title: Text('내정보'),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget recommendStudyType() {
    return Container(
      margin: const EdgeInsets.only(left: 28, right: 28, top: 60),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            color: Colors.white,
            height: 1,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("추천 스터디",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                GestureDetector(
                  onTap: () {

                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.plus_one,
                            color: Color.fromRGBO(243, 102, 34, 1)),
                        Text("더보기", style: TextStyle(
                            color: Color.fromRGBO(216, 216, 216, 1),
                            fontSize: 12))
                      ])),
              ],),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 32),
            child: Row(children: <Widget>[
              Text("Developer",
                  style: TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.bold)),
              Text(" (4)", style: TextStyle(
                  color: Color.fromRGBO(165, 165, 165, 1), fontSize: 18))
            ],),
          ),
          SizedBox(height: 15),
          Container(
            child: StreamBuilder(
                stream: blocStudy.streamRecommendStudy,
                builder: (BuildContext context,
                    AsyncSnapshot<
                        List<RecommendStudy>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return RecommendStudyPage(
                              study: snapshot.data[index]);
                        });
                  } else {
                    List<RecommendStudy> items = List<
                        RecommendStudy>();
                    items.add(RecommendStudy(
                        "리액트", "타이틀", "서브타이틀", 3, 1));
                    items.add(RecommendStudy(
                        "리액트", "타이틀", "서브타이틀", 3, 2));
                    items.add(RecommendStudy(
                        "리액트", "타이틀", "서브타이틀", 3, 3));
                    blocStudy.addAllRecommendStudy(items);
                    return CircularProgressIndicator();
                  }
                }
            ),
          )
        ],
      ),
    );
  }

  Widget bestStudy() {
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 32),
          height: 232,
          child: Swiper(
              containerWidth: double.infinity,
              itemWidth: double.infinity,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              autoplay: true,
              loop: true,
              itemBuilder: (BuildContext context, int index) {
                return StreamBuilder(
                    stream: blocStudy.streamBestStudy,
                    builder: (BuildContext context,
                        AsyncSnapshot<
                            List<RecommendStudy>> snapshot) {
                      if (snapshot.hasData) {
                        return BestStudyPage(study: snapshot.data[index]);
                      } else {
                        List<RecommendStudy> items = List<
                            RecommendStudy>();
                        items.add(RecommendStudy(
                            "리액트", "타이틀", "서브타이틀", 3, index));
                        items.add(RecommendStudy(
                            "리액트", "타이틀", "서브타이틀", 3, index));
                        items.add(RecommendStudy(
                            "리액트", "타이틀", "서브타이틀", 3, index));
                        blocStudy.addAllBestStudy(items);
                        return Text("없다");
                      }
                    }
                );
              }),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 24, left: 28),
          width: 132,
          color: Color.fromRGBO(243, 102, 34, 1),
          height: 24,
          child: Text("BEST 5 ∙ React Study",
              style: TextStyle(color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400)),
        ),
        Container(
            margin: const EdgeInsets.only(top: 250, left: 28),
            child: Text("React 애플리케이션 웹 개발스터디",
                style: TextStyle(color: Colors.white, fontSize: 20)))
      ],
    );
  }

  Widget topToolbar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.notifications, color: Colors.white))
        ],
      ),
    );
  }

  Widget topHeader() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 28),
      width: double.infinity,
      child: Text(
        "어떤 스터디를\n생각하고 계신가요?",
        style: TextStyle(
            fontSize: 28, color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget topSubHeader() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 12, left: 28),
      child: Text(
        "원하는 스터디 조인에서 찾아보세요",
        style: TextStyle(
            fontSize: 14,
            color: Color.fromRGBO(203, 203, 203, 1),
            fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget division() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 36, left: 28),
      height: 1,
      color: Colors.white,
    );
  }

  Widget bottomNavigation() {
    return BottomNavigationBar();
  }

  Widget topSelect() {
    List<MainTopSelected> items = List();
    items.add(MainTopSelected("전체", false));
    items.add(MainTopSelected("기획자", false));
    items.add(MainTopSelected("디자이너", false));
    items.add(MainTopSelected("개발자", false));

    return Container(
      height: 20,
      margin: const EdgeInsets.only(top: 8, left: 28),
      child: Row(
        children: items
            .map((item) =>
            GestureDetector(
              onTap: () {
                setState(() {
                  currentTopTap = item.title;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(right: 16),
                child: Text(item.title,
                    style: TextStyle(
                        fontSize: 14,
                        decoration: (currentTopTap == item.title)
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        color: (currentTopTap == item.title)
                            ? Colors.white
                            : Color.fromRGBO(165, 165, 165, 1))),
              ),
            ))
            .toList(),
      ),
    );
  }
}

class MainTopSelected {
  String title;
  bool isSelected = false;

  MainTopSelected(this.title, this.isSelected);
}
