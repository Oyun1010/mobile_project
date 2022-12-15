import 'package:app/module/pay_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import '../theme.dart';

class BillDetailsController extends GetxController {
  RxBool debit = false.obs;
  RxBool paypal = false.obs;
}

class BillDetails extends StatelessWidget {
  BillDetailsController ctrl = Get.put(BillDetailsController());
  PayController payController = Get.put(PayController());
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

    Widget selectedItem(
        IconData iconData, String text, RxBool checked, int index) {
      return Obx(
        () => Container(
          width: 344,
          height: 80,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ElevatedButton(
            onPressed: () {
              checked.value = !checked.value;
              if (index == 0) {
                ctrl.paypal.value = false;
              } else {
                ctrl.debit.value = false;
              }
            },
            style: UI.buttonStyle(
              checked.value ? UI.greyGreen : UI.lilia,
              borderRadius: 20,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: checked.value ? UI.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        iconData,
                        size: 30,
                        color: checked.value ? UI.jungleGreen : UI.darkGrey,
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 60,
                      child: UI.text(text, 18, FontWeight.w600,
                          checked.value ? UI.jungleGreen : UI.darkGrey),
                    ),
                  ],
                ),
                checked.value
                    ? Container(
                        width: 24,
                        height: 24,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        child: Icon(
                          Icons.check_circle_rounded,
                          color: UI.jungleGreen,
                          size: 24,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      );
    }

    Widget amountItem() {
      return Container(
        margin: const EdgeInsets.only(top: 15, bottom: 20),
        child: Obx(
          () => Column(
            children: [
              amountRow(
                "Price",
                payController.selected.value.amount
                    .substring(1, payController.selected.value.amount.length),
              ),
              const SizedBox(height: 6),
              amountRow("Fee", "1.99"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Divider(
                  height: 2,
                  color: UI.darkGrey,
                ),
              ),
              amountRow(
                "Total",
                "${double.parse(payController.selected.value.amount.substring(1, payController.selected.value.amount.length)) + 1.99}",
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
      );
    }

    Widget child() {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: UI.bWhite,
                  ),
                  child: Image.network(
                    payController.selected.value.image,
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      //TODO: upwork dynamic bna and color change
                      UI.text(
                        payController.selected.value.name,
                        18,
                        FontWeight.w500,
                        UI.dark,
                        alignment: Alignment.centerLeft,
                      ),
                      const SizedBox(height: 8),
                      UI.text(
                        payController.selected.value.dateTime,
                        14,
                        FontWeight.w400,
                        UI.secondary,
                        alignment: Alignment.centerLeft,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          amountItem(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child:
                UI.text("Select payment method", 18, FontWeight.w500, UI.dark),
          ),
          selectedItem(
              CupertinoIcons.creditcard_fill, "Debit Card", ctrl.debit, 0),
          selectedItem(Icons.paypal, "Paypal", ctrl.paypal, 1),
          const SizedBox(height: 6),
          UI.button("Pay now", UI.white, () {
            Navigator.pushNamed(context, '/billPayment');
          })
        ],
      );
    }

    return UI.screen(
        context,
        UI.headerWidget(
          context,
          "Bill Details",
          Ionicons.ellipsis_horizontal,
          func: () {
            Navigator.pop(context);
          },
        ),
        child());
  }
}
