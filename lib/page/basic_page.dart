import 'package:app/module/bill_details.dart';
import 'package:app/module/bill_payment.dart';
import 'package:app/module/connect_wallet.dart';
import 'package:app/module/payment_successfully.dart';
import 'package:app/page/home_page.dart';
import 'package:app/page/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
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
    HomePage(),
    Wallet(),
  ];
  PersistentTabController persistentTabController =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return [
        HomePage(),
        HomePage(),
        Wallet(),
        Wallet(),
      ];
    }

    PersistentBottomNavBarItem persistentBottomNavBarItem(IconData iconData) {
      return PersistentBottomNavBarItem(
        icon: Icon(iconData),
        // title: ("Settings"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            '/connectWallet': ((context) => ConnectWallet()),
            '/billDetails': (context) => BillDetails(),
            '/billPayment': (context) => BillPayment(),
            '/successfully': (context) => SuccessFully(),
          },
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: UI.white,
        // body: widgetOptions[bottomNavIndex],
        body: PersistentTabView(
          context,
          controller: persistentTabController,
          screens: _buildScreens(),
          items: [
            persistentBottomNavBarItem(Icons.home_outlined),
            persistentBottomNavBarItem(Icons.chat_rounded),
            persistentBottomNavBarItem(Icons.wallet),
            persistentBottomNavBarItem(Icons.usb_rounded),
          ],
          resizeToAvoidBottomInset: true,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          bottomScreenMargin: 0,
          backgroundColor: UI.white,
          decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          navBarStyle: NavBarStyle.style6,
        ),
        floatingActionButton: bottomNavIndex == 0
            ? FloatingActionButton(
                backgroundColor: UI.jungleGreen,
                onPressed: () {},
                child: Icon(
                  Icons.add,
                  color: UI.white,
                  size: 24,
                ),
                //params
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // bottomNavigationBar: AnimatedBottomNavigationBar(
        //   icons: const [
        //     Icons.home,
        //     Icons.table_chart,
        //     Icons.wallet,
        //     Icons.portable_wifi_off_outlined
        //   ],
        //   inactiveColor: UI.ligthgrey,
        //   iconSize: 30,
        //   activeColor: UI.jungleGreen,
        //   activeIndex: bottomNavIndex,
        //   gapLocation: GapLocation.center,
        //   notchSmoothness: NotchSmoothness.softEdge,
        //   onTap: (index) => setState(() => bottomNavIndex = index),
        //   //other params
        // ),
      ),
    );
  }
}
