import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:get/get.dart';
import '../theme.dart';

class HomePageController extends GetxController {}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget cardItem(Widget title, String amount, double fontSize) {
      return Container(
        child: Column(
          children: [
            title,
            //TODO: firebase calculate total
            Text(
              "${amount}",
              style: UI.text(fontSize, UI.white, FontWeight.w700),
            )
          ],
        ),
      );
    }

    Widget card() {
      return Container(
        width: 374,
        height: 201,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(47, 126, 121, 1),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                cardItem(
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 6),
                          child: Text(
                            "Total Balance",
                            style: UI.text(16, UI.white, FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                          height: 12,
                          child: Icon(
                            Icons.arrow_upward,
                            size: 10,
                            color: UI.white,
                          ),
                        )
                      ],
                    ),
                    "18840",
                    30),
                //TODO: button and change icon
                Container(
                  height: 21,
                  width: 21,
                  child: Icon(
                    Icons.corporate_fare,
                    size: 20,
                    color: UI.white,
                  ),
                )
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                cardItem(
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          margin: const EdgeInsets.only(right: 6),
                          child: Icon(
                            Icons.arrow_upward,
                            size: 20,
                            color: UI.white,
                          ),
                        ),
                        Text(
                          "Income",
                          style: UI.text(16, UI.white, FontWeight.w600),
                        ),
                      ],
                    ),
                    "18840",
                    20),
                cardItem(
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          margin: const EdgeInsets.only(right: 6),
                          child: Icon(
                            Icons.arrow_upward,
                            size: 20,
                            color: UI.white,
                          ),
                        ),
                        Text(
                          "Expenses",
                          style: UI.text(16, UI.white, FontWeight.w600),
                        ),
                      ],
                    ),
                    "284",
                    20)
              ],
            ),
          ],
        ),
      );
    }

    return Container(
      color: UI.white,
      child: Stack(
        children: [
          UI.topBackground(),
          Container(
            padding: const EdgeInsets.fromLTRB(24, 30, 24, 8),
            height: 80,
            width: UI.W(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Good afternoon,",
                        style: UI.text(14, UI.white, FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    //TODO: firebase get username
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Enjelin Morgeana",
                        style: UI.text(20, UI.white, FontWeight.w600),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                //TODO: notifcation button
                SizedBox(
                  width: 24,
                  height: 24,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: UI.buttonStyle(Colors.transparent),
                    child: Icon(
                      Icons.notifications_outlined,
                      size: 24,
                      color: UI.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: const Alignment(0, -0.5),
            child: card(),
          )
        ],
      ),
    );
  }
}
