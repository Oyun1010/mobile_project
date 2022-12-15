import 'package:app/module/pay_item.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:get/get.dart';
import '../theme.dart';

class BillPayment extends StatelessWidget {
  PayController ctrl = Get.put(PayController());
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
          UI.text("\$${price}", 16, fontWeight, UI.dark),
        ],
      );
    }

    Widget amountItem() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Obx(
          () => Column(
            children: [
              //TODO: amount dyn
              amountRow(
                "Price",
                ctrl.selected.value.amount
                    .substring(1, ctrl.selected.value.amount.length),
              ),
              const SizedBox(height: 8),
              amountRow("Fee", "1.99"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Divider(
                  height: 1,
                  color: UI.darkGrey,
                ),
              ),
              //TODO: tootsoj gargah
              amountRow("Total",
                  "${double.parse(ctrl.selected.value.amount.substring(1, ctrl.selected.value.amount.length)) + 1.99}",
                  fontWeight: FontWeight.w700),
            ],
          ),
        ),
      );
    }

    Widget child() {
      return Column(
        children: [
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.only(top: 30, bottom: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: UI.bWhite,
            ),
            child:
                Image.network(ctrl.selected.value.image, width: 40, height: 40),
          ),
          SizedBox(
            width: 250,
            //TODO: upwork dynamic bna and color change
            // child: UI.text(
            //     "You will pay Youtube Premium for one month with BCA OneKlik",
            //     16,
            //     FontWeight.w600,
            //     UI.black,
            //     alignment: Alignment.center,
            //     textAlign: TextAlign.center)
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UI.text("You will pay ", 16, FontWeight.w400, UI.black),
                    UI.text(ctrl.selected.value.name, 16, FontWeight.w400,
                        UI.jungleGreen),
                  ],
                ),
                const SizedBox(height: 6),
                UI.text("for one month with BCA OneKlik", 16, FontWeight.w400,
                    UI.black)
              ],
            ),
          ),
          amountItem(),
          const SizedBox(height: 150),
          Align(
            child: UI.button("Confirm and Pay", UI.white, () {
              //TODO:
              Navigator.pushNamed(context, '/successfully');
            }),
          ),
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
