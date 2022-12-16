import 'package:app/data/GetData.dart';
import 'package:app/data/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import '../module/transactions_item.dart';
import '../theme.dart';

class HomePageController extends GetxController {
  RxList<T_ransactions> transactions = <T_ransactions>[].obs;
  RxInt total = 0.obs;
  HomePageController() {
    GetData.transactionsHistory().then((value) => {
          transactions.value = value,
          for (int i = 0; i < value.length; i++)
            {
              print(value[i].amount),
              if (value[i].amount.substring(0, 1) == "-")
                {
                  total.value -= int.parse(
                      value[i].amount.substring(1, value[i].amount.length)),
                }
              else if (value[i].amount.substring(0, 1) == "+")
                {
                  total.value += int.parse(
                      value[i].amount.substring(1, value[i].amount.length)),
                }
            }
        });
  }
}

class HomePage extends StatelessWidget {
  HomePageController ctrl = HomePageController();
  @override
  Widget build(BuildContext context) {
    Widget cardItem(Widget title, String amount, double fontSize,
        {double padding = 0}) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: const Alignment(-0.5, 0),
            child: Container(
              width: 130,
              height: 30,
              child: title,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child:
                UI.text("\$${amount}.00", fontSize, FontWeight.w700, UI.white),
          )
        ],
      );
    }

    Widget card() {
      return Container(
        width: 400,
        height: 200,
        margin: const EdgeInsets.fromLTRB(2, 10, 2, 14),
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
                Obx(
                  () => cardItem(
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                      ctrl.total.value.toString(),
                      30),
                ),
                Container(
                  height: 21,
                  width: 21,
                  child: Icon(Ionicons.ellipsis_horizontal,
                      size: 20, color: UI.white),
                )
              ],
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                cardItem(
                    Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          margin: const EdgeInsets.only(right: 6),
                          child: Icon(Ionicons.arrow_down_circle,
                              size: 28, color: Colors.white.withOpacity(0.2)),
                        ),
                        Text(
                          "Income",
                          style: UI.textStyle(16, UI.white, FontWeight.w600),
                        ),
                      ],
                    ),
                    "1840",
                    20,
                    padding: 5),
                cardItem(
                    Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          margin: const EdgeInsets.only(right: 6),
                          child: Icon(Ionicons.arrow_up_circle,
                              size: 28, color: Colors.white.withOpacity(0.2)),
                        ),
                        UI.text("Expenses", 16, FontWeight.w600, UI.white)
                      ],
                    ),
                    "284",
                    20,
                    padding: 5),
              ],
            ),
          ],
        ),
      );
    }

    Widget title(String text) {
      return Container(
        height: 45,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UI.text(text, 18, FontWeight.w600, UI.black),
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

    Widget header() {
      return Container(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 8),
        margin: const EdgeInsets.only(top: 40),
        height: 90,
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
                  const SizedBox(height: 4),
                  UI.text("Enjelin Morgeana", 20, FontWeight.w600, UI.white),
                ],
              ),
            ),
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
      );
    }

    Widget body() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            height: UI.H(context) - 120,
            child: Column(
              children: [
                card(),
                title("Transactions History"),
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
                    avatar("assets/image1.png"),
                    avatar("assets/image2.png"),
                    avatar("assets/image3.png"),
                    avatar("assets/image4.png"),
                    avatar("assets/image5.png"),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }

    return Container(
      color: UI.white,
      child: Stack(
        children: [UI.topBackground(), header(), body()],
      ),
    );
  }
}
