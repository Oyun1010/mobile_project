import 'package:app/module/transactions_histroty_item.dart';
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

            UI.text(amount, fontSize, FontWeight.w700, UI.white)
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
                          child: UI.text(
                              "Total Balance", 16, FontWeight.w600, UI.white),
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
            const SizedBox(height: 20),
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
                        UI.text("Income", 16, FontWeight.w600, UI.white)
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
                        UI.text("Expenses", 16, FontWeight.w600, UI.white)
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
            height: 40,
            width: UI.W(context) - 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    UI.text("Good afternoon,", 14, FontWeight.w500, UI.white),
                    UI.text("Enjelin Morgeana", 20, FontWeight.w600, UI.white),
                    //TODO: firebase get username
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
            alignment: const Alignment(0, -0.4),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                height: UI.W(context) - 150,
                child: Column(
                  children: [
                    card(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          UI.text("Transactions History", 16, FontWeight.w600,
                              UI.black),
                          UI.text("See all", 14, FontWeight.w400, UI.secondary),
                        ],
                      ),
                    ), //TODO : firebase lite orj irne
                    TransactionsHistoryItem(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
