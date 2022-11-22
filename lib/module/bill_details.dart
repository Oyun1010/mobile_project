import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme.dart';

class BillDetailsController extends GetxController {
  RxBool debit = false.obs;
  RxBool paypal = false.obs;
}

class BillDetails extends StatelessWidget {
  BillDetailsController ctrl = Get.put(BillDetailsController());
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

    Widget selectedItem(
        IconData iconData, String text, RxBool checked, int index) {
      return Obx(
        () => Container(
          width: 344,
          height: 90,
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: ElevatedButton(
            onPressed: () {
              print("jjjjjjjjjjjjjjjjjjjjjjj");
              checked.value = !checked.value;
              index == 0 ? ctrl.debit.value = false : ctrl.paypal.value = false;
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
        child: Column(
          children: [
            //TODO: amount dyn
            amountRow("Price", "11.99"),
            const SizedBox(height: 6),
            amountRow("Fee", "1.99"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Divider(
                height: 2,
                color: UI.greyGreen,
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: UI.bWhite,
                      ),
                      child: Image.asset(
                        "assets/logo/image1.png",
                        width: 35,
                        height: 35,
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          //TODO: upwork dynamic bna and color change
                          UI.text("Upwork", 18, FontWeight.w500, UI.dark,
                              alignment: Alignment.centerLeft),
                          const SizedBox(height: 8),
                          UI.text("Today", 14, FontWeight.w400, UI.secondary,
                              alignment: Alignment.centerLeft),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              amountItem(),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 16),
                child: UI.text(
                    "Select payment method", 18, FontWeight.w500, UI.dark),
              ),
              selectedItem(Icons.wallet, "Debit Card", ctrl.debit, 0),
              selectedItem(Icons.paypal, "Paypal", ctrl.paypal, 1),
              const SizedBox(height: 6),
              UI.button("Pay now", UI.white, () {
                //TODO:
                Navigator.pushNamed(context, '/billPayment');
              })
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
