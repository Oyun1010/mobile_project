import 'package:app/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:get/get.dart';
import '../theme.dart';

class BasicPage extends StatefulWidget {
  @override
  BasicPageState createState() => BasicPageState();
}

class BasicPageState extends State<BasicPage> {
  int bottomNavIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarItem bottomNavigationBarItem(IconData iconData) {
      return BottomNavigationBarItem(
        icon: Icon(
          iconData,
          size: 30,
          color: UI.grey,
        ),
        label: 'Home',
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: UI.white,
        body: widgetOptions[bottomNavIndex],
        floatingActionButton: FloatingActionButton(
          backgroundColor: UI.jungleGreen,
          onPressed: () {},
          child: Icon(
            Icons.add,
            color: UI.white,
            size: 24,
          ),
          //params
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: const [
            Icons.home,
            Icons.table_chart,
            Icons.wallet,
            Icons.portable_wifi_off_outlined
          ],
          inactiveColor: UI.ligthgrey,
          iconSize: 30,
          activeColor: UI.jungleGreen,
          activeIndex: bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) => setState(() => bottomNavIndex = index),
          //other params
        ),
      ),
    );
  }
}
