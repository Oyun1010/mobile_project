import 'package:app/module/pay_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import '../theme.dart';

class SuccessFully extends StatelessWidget {
  PayController ctrl = Get.put(PayController());
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    Widget amountRow(String name, String price,
        {FontWeight fontWeight = FontWeight.w500}) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UI.text(name, 16, fontWeight, UI.secondary),
            const SizedBox(height: 4),
            UI.text("\$ ${price}", 16, fontWeight, UI.dark),
          ],
        ),
      );
    }

    Widget divider() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Divider(
          height: 1,
          color: UI.darkGrey,
        ),
      );
    }

    Widget amountItem() {
      return Column(
        children: [
          //TODO: amount dyn
          amountRow(
            "Price",
            ctrl.selected.value.amount
                .substring(1, ctrl.selected.value.amount.length),
          ),
          amountRow("Fee", "1.99"),
          divider(),
          //TODO: tootsoj gargah
          amountRow("Total",
              "${double.parse(ctrl.selected.value.amount.substring(1, ctrl.selected.value.amount.length)) + 1.99}",
              fontWeight: FontWeight.w700),
        ],
      );
    }

    Widget tDetailsRow(
      String name,
      Color color,
      Widget item, {
      double fontSize = 16,
    }) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UI.text(name, fontSize, FontWeight.w500, color),
            item,
          ],
        ),
      );
    }

    Widget transactionDetails() {
      return Column(
        children: [
          tDetailsRow(
            "Transaction details",
            UI.dark,
            SizedBox(
              width: 20,
              height: 20,
              child: Icon(Ionicons.chevron_up, size: 20, color: UI.darkGrey),
            ),
            fontSize: 18,
          ),
          tDetailsRow(
            "Payment method",
            UI.secondary,
            UI.text("Debit Card", 16, FontWeight.w500, UI.dark),
          ),
          tDetailsRow(
            "Status",
            UI.secondary,
            UI.text("Completed", 16, FontWeight.w500, UI.jungleGreen),
          ),
          tDetailsRow(
            "Time",
            UI.secondary,
            UI.text("${now.hour.toString().padLeft(2, "0")}:${now.minute} AM",
                16, FontWeight.w500, UI.dark),
          ),
          tDetailsRow(
            "Date",
            UI.secondary,
            UI.text("Feb 28, 2022", 16, FontWeight.w500, UI.dark),
          ),
          tDetailsRow(
            "Transaction ID",
            UI.secondary,
            Row(
              children: [
                UI.text("2092913832472.. ", 16, FontWeight.w500, UI.dark),
                Icon(Ionicons.copy, size: 24, color: UI.jungleGreen)
              ],
            ),
          ),
        ],
      );
    }

    Widget child() {
      return Column(
        children: [
          Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.only(top: 20, bottom: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: UI.bWhite,
              ),
              child: Icon(Ionicons.checkmark_circle,
                  color: UI.jungleGreen, size: 40)),
          UI.text("Payment Successfully", 22, FontWeight.w600, UI.jungleGreen,
              alignment: Alignment.center, textAlign: TextAlign.center),
          const SizedBox(height: 8),
          UI.text(ctrl.selected.value.name, 16, FontWeight.w500, UI.secondary,
              alignment: Alignment.center, textAlign: TextAlign.center),
          const SizedBox(height: 24),
          transactionDetails(),
          divider(),
          amountItem(),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 358,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  //TODO:
                  ctrl.selected.refresh();
                  Navigator.pushNamed(context, '/');
                },
                style: UI.buttonStyle(
                  UI.white,
                  side: BorderSide(color: UI.jungleGreen),
                ),
                child: UI.text(
                    "Share Receipt", 18, FontWeight.w600, UI.jungleGreen,
                    alignment: Alignment.center),
              ),
            ),
          )
        ],
      );
    }

    return UI.screen(
        context,
        UI.headerWidget(
          context,
          "Bill Payment",
          Ionicons.ellipsis_horizontal,
          func: () {
            Navigator.pop(context);
          },
        ),
        child());
  }
}
