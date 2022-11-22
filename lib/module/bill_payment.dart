import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
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
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            //TODO: amount dyn
            amountRow("Price", "11.99"),
            const SizedBox(height: 8),
            amountRow("Fee", "11.99"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Divider(
                height: 1,
                color: UI.darkGrey,
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
              Container(
                width: 80,
                height: 80,
                margin: const EdgeInsets.only(top: 30, bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: UI.bWhite,
                ),
                child: Image.asset(
                  "assets/logo/image1.png",
                  width: 40,
                  height: 40,
                ),
              ),
              SizedBox(
                width: 250,
                child:
                    //TODO: upwork dynamic bna and color change
                    UI.text(
                        "You will pay Youtube Premium for one month with BCA OneKlik",
                        16,
                        FontWeight.w600,
                        UI.black,
                        alignment: Alignment.center,
                        textAlign: TextAlign.center),
              ),
              amountItem(),
              const SizedBox(height: 150),
              Align(
                child: UI.button("Confirm and Pay", UI.white, () {
                  //TODO:
                  Navigator.pushNamed(context, '/successfully');
                }),
              )
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
          UI.headerWidget(
            context,
            "Bill Payment",
            Ionicons.ellipsis_horizontal,
            func: () {
              Navigator.pop(context);
            },
          ),
          body(),
        ],
      ),
    );
  }
}
