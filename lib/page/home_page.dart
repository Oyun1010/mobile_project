import 'package:app/data/GetData.dart';
import 'package:app/data/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import '../module/transactions_item.dart';
import '../theme.dart';

class HomePageController extends GetxController {
  RxList<T_ransactions> transactions = <T_ransactions>[].obs;
  HomePageController() {
    GetData.transactionsHistory().then((value) => transactions.value = value);
  }
}

class HomePage extends StatelessWidget {
  HomePageController ctrl = HomePageController();
  @override
  Widget build(BuildContext context) {
    Widget cardItem(Widget title, String amount, double fontSize) {
      return Column(
        children: [
          title,
          //TODO: firebase calculate total
          UI.text(amount, fontSize, FontWeight.w700, UI.white)
        ],
      );
    }

    Widget card() {
      return Container(
        width: 374,
        height: 200,
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
                          child: Icon(Ionicons.chevron_up,
                              size: 10, color: UI.white),
                        ),
                      ],
                    ),
                    "18840",
                    30),
                //TODO: button and change icon
                Container(
                  height: 21,
                  width: 21,
                  child: Icon(Ionicons.ellipsis_horizontal,
                      size: 20, color: UI.white),
                )
              ],
            ),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                cardItem(
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          margin: const EdgeInsets.only(right: 6),
                          child: Icon(Ionicons.arrow_down_outline,
                              size: 20, color: UI.white),
                        ),
                        UI.text("Income", 16, FontWeight.w600, UI.white)
                      ],
                    ),
                    "18840",
                    20),
                cardItem(
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        margin: const EdgeInsets.only(right: 6),
                        child: Icon(Ionicons.arrow_up_outline,
                            size: 20, color: UI.white),
                      ),
                      UI.text("Expenses", 16, FontWeight.w600, UI.white)
                    ],
                  ),
                  "284",
                  20,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget title(String text) {
      return Container(
        height: 35,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UI.text(text, 16, FontWeight.w600, UI.black),
            UI.text("See all", 14, FontWeight.w400, UI.secondary),
          ],
        ),
      );
    }

    Widget avatar(String img) {
      return SizedBox(
        width: 62,
        height: 62,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(img, width: 62, height: 62, fit: BoxFit.cover),
        ),
      );
    }

    return Container(
      color: UI.white,
      child: Stack(
        children: [
          UI.topBackground(),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 8),
            margin: const EdgeInsets.only(top: 20),
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      UI.text("Good afternoon,", 14, FontWeight.w500, UI.white),
                      UI.text(
                          "Enjelin Morgeana", 20, FontWeight.w600, UI.white),
                      //TODO: firebase get username
                    ],
                  ),
                ),
                //TODO: notifcation button
                SizedBox(
                  width: 40,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: UI.buttonStyle(Colors.transparent),
                    child: Icon(Ionicons.notifications_outline,
                        size: 24, color: UI.white),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                height: UI.H(context) - 120,
                child: Column(
                  children: [
                    card(),
                    title("Transactions History"),
                    //TODO : firebase list eer guigene
                    Obx(() => ctrl.transactions.isNotEmpty
                        ? Column(
                            children: ctrl.transactions
                                .map((element) => TransactionsItem(element))
                                .toList(),
                          )
                        : Container()),
                    title("Send Again"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        avatar(""),
                        avatar(""),
                        avatar(""),
                        avatar(""),
                        avatar(""),
                      ],
                    )
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
