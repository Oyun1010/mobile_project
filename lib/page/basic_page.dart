import 'package:app/module/bill_details.dart';
import 'package:app/module/bill_payment.dart';
import 'package:app/module/connect_wallet.dart';
import 'package:app/module/payment_successfully.dart';
import 'package:app/page/add_expense.dart';
import 'package:app/page/home_page.dart';
import 'package:app/page/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:ionicons/ionicons.dart';
import '../theme.dart';

class BasicPage extends StatefulWidget {
  @override
  BasicPageState createState() => BasicPageState();
}

class BasicPageState extends State<BasicPage> {
  int currentIndex = 0;

  PersistentTabController persistentTabController =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return [
        HomePage(),
        AddExpense(),
        Wallet(),
        Wallet(),
      ];
    }

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

    return SafeArea(
      child: Scaffold(
        backgroundColor: UI.white,
        body: PersistentTabView(
          context,
          controller: persistentTabController,
          screens: _buildScreens(),
          items: [
            persistentBottomNavBarItem(Ionicons.home_outline),
            persistentBottomNavBarItem(Ionicons.add_outline),
            persistentBottomNavBarItem(Ionicons.wallet_outline),
            persistentBottomNavBarItem(Ionicons.person_outline),
          ],
          resizeToAvoidBottomInset: true,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
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
      ),
    );
  }
}
