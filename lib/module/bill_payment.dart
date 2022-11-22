import 'package:flutter/material.dart';
import '../theme.dart';

class BillPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget amountRow(String name, String price,
        {FontWeight fontWeight = FontWeight.w500}) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UI.text(name, 16, fontWeight, UI.secondary),
          //TODO:
          UI.text(price, 16, fontWeight, UI.dark),
        ],
      );
    }

    Widget amountItem() {
      return Container(
        child: Column(
          children: [
            //TODO: amount dyn
            amountRow("Price", "11.99"),
            amountRow("Fee", "11.99"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Divider(
                height: 1,
                color: UI.whiteGrey,
              ),
            ),
            //TODO: tootsoj gargah
            amountRow("Total", "13.98", fontWeight: FontWeight.w700),
          ],
        ),
      );
    }

    Widget body() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: UI.H(context) - 120,
          width: UI.W(context),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: UI.white,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: UI.bWhite,
                    ),
                    child: Image.asset(
                      "assets/logo/image1.png",
                      width: 30,
                      height: 30,
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        //TODO: upwork dynamic bna and color change
                        UI.text("Upwork", 16, FontWeight.w500, UI.black,
                            alignment: Alignment.centerLeft),
                        const SizedBox(height: 8),
                        UI.text("Today", 13, FontWeight.w400, UI.secondary,
                            alignment: Alignment.centerLeft),
                      ],
                    ),
                  )
                ],
              ),
              amountItem(),
            ],
          ),
        ),
      );
    }

    return Container(
      color: UI.white,
      child: Stack(
        children: [
          UI.topBackground(),
          UI.headerWidget("Bill Details"),
          body(),
        ],
      ),
    );
  }
}
