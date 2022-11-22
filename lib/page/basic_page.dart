import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:ionicons/ionicons.dart';
import '../module/bill_details.dart';
import '../module/bill_payment.dart';
import '../module/connect_wallet.dart';
import '../module/payment_successfully.dart';
import '../page/add_expense.dart';
import '../page/home_page.dart';
import '../page/wallet.dart';
import '../theme.dart';

class BasicPage extends StatelessWidget {
  PersistentTabController tabCtrl = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    PersistentBottomNavBarItem persistentBottomNavBarItem(IconData iconData) {
      return PersistentBottomNavBarItem(
        icon: Icon(iconData),
        activeColorPrimary: UI.jungleGreen,
        iconSize: 30,
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

    return Scaffold(
      backgroundColor: UI.white,
      body: PersistentTabView(
        context,
        controller: tabCtrl,
        screens: [
          HomePage(),
          AddExpense(),
          Wallet(),
          Wallet(),
        ],
        items: [
          persistentBottomNavBarItem(Ionicons.home_outline),
          persistentBottomNavBarItem(Ionicons.add_outline),
          persistentBottomNavBarItem(Ionicons.wallet_outline),
          persistentBottomNavBarItem(Ionicons.person_outline),
        ],
        resizeToAvoidBottomInset: true,
        navBarHeight: kBottomNavigationBarHeight,
        bottomScreenMargin: 0,
        backgroundColor: UI.white,
        decoration: NavBarDecoration(colorBehindNavBar: UI.jungleGreen),
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
    );
  }
}
