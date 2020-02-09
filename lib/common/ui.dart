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

class JoinBottomNavigationItem {
  final Icon icon;
  final Text title;
  final Color activeColor;
  final Color inactiveColor;
  final TextAlign textAlign;

  JoinBottomNavigationItem({
    @required this.icon,
    @required this.title,
    this.activeColor = Colors.blue,
    this.textAlign,
    this.inactiveColor,
  });
}

//bottom navigation
class JoinBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final double iconSize;
  final Color backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<JoinBottomNavigationItem> items;
  final ValueChanged<int> onItemSelected;
  final MainAxisAlignment mainAxisAlignment;
  final double itemCornerRadius;
  final double containerHeight;
  final Curve curve;

  JoinBottomNavigation({
    Key key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 22,
    this.backgroundColor,
    this.itemCornerRadius = 50,
    this.containerHeight = 56,
    this.animationDuration = const Duration(milliseconds: 270),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    @required this.items,
    @required this.onItemSelected,
    this.curve = Curves.linear,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = (backgroundColor == null)
        ? Theme
        .of(context)
        .bottomAppBarColor
        : backgroundColor;
    return Container(
      decoration: BoxDecoration(color: bgColor),
      child: SafeArea(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: containerHeight,
              margin: const EdgeInsets.only(bottom: 12),
              child: Row(
                  mainAxisAlignment: mainAxisAlignment,
                  children: items.map((item) {
                    var index = items.indexOf(item);
                    return GestureDetector(
                      onTap: () => onItemSelected(index),
                      child: NavigationItem(
                        item: item,
                        iconSize: iconSize,
                        isSelected: index == selectedIndex,
                        backgroundColor: bgColor,
                        itemCornerRadius: itemCornerRadius,
                        animationDuration: animationDuration,
                        curve: curve,
                      ),
                    );
                  }).toList()))),
    );
  }
}

class NavigationItem extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final JoinBottomNavigationItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final Curve curve;

  const NavigationItem({
    Key key,
    @required this.item,
    @required this.isSelected,
    @required this.backgroundColor,
    @required this.animationDuration,
    @required this.itemCornerRadius,
    @required this.iconSize,
    this.curve = Curves.linear,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: MediaQuery.of(context).size.width/4,
      height: isSelected ? 54 : 50,
      duration: animationDuration,
      curve: curve,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          height: 54,
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: DefaultTextStyle.merge(
                  style: TextStyle(
                      color: item.activeColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                  ),
                  maxLines: 1,
                  textAlign: item.textAlign,
                  child: isSelected ? item.title : Text(""),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(top: 8),
                child: IconTheme(
                    data: IconThemeData(
                      size: isSelected ? 8 : iconSize,
                      color: isSelected
                          ? item.activeColor.withOpacity(1)
                          : item.inactiveColor == null
                          ? item.activeColor
                          : item.inactiveColor,
                    ),
                    child: isSelected ? Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
                    ) : item.icon
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
