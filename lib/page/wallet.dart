import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:get/get.dart';
import '../module/pay_item.dart';
import '../module/transactions_item.dart';
import '../theme.dart';

class WalletContoller extends GetxController {
  RxInt switchIndex = 0.obs;
}

class Wallet extends StatelessWidget {
  WalletContoller ctrl = Get.put(WalletContoller());
  @override
  Widget build(BuildContext context) {
    Widget iconItem(IconData iconData, String text) {
      //TODO: border color and icon color liner gradient bna
      return Container(
        width: 60,
        height: 85,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: UI.jungleGreen),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                iconData,
                size: 24,
                color: UI.jungleGreen,
              ),
            ),
            UI.text(text, 14, FontWeight.w400, UI.black,
                alignment: Alignment.center),
          ],
        ),
      );
    }

    Widget transactionsItem() {
      return Column(
        children: [
          TransactionsItem(),
          TransactionsItem(),
          TransactionsItem(),
        ],
      );
    }

    Widget upcomingBillsItem() {
      return Column(
        children: [
          PayItem(),
          PayItem(),
          PayItem(),
        ],
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 30, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child: UI.text(
                          "Total Balance", 16, FontWeight.w400, UI.secondary,
                          alignment: Alignment.center),
                    ),
                    const SizedBox(height: 6),
                    //TODO: une dynamic bna.
                    SizedBox(
                      width: 200,
                      child: UI.text("2.948.00", 30, FontWeight.w700, UI.black,
                          alignment: Alignment.center),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: UI.W(context) - 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconItem(Icons.add, "Add"),
                    iconItem(Icons.qr_code, "Pay"),
                    iconItem(Icons.send, "Send"),
                  ],
                ),
              ),
              Container(
                width: 374,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: UI.whiteGrey,
                ),
                margin: const EdgeInsets.symmetric(vertical: 12),
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                child: ToggleSwitch(
                  minWidth: 180.0,
                  minHeight: 40,
                  cornerRadius: 40.0,
                  activeBgColors: [
                    [UI.white],
                    [UI.white],
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.transparent,
                  inactiveFgColor: Colors.white,
                  initialLabelIndex: ctrl.switchIndex.value,
                  totalSwitches: 2,
                  labels: const ['Transactions', 'Upcoming Bills'],
                  customTextStyles: [
                    UI.textStyle(14, UI.secondary, FontWeight.w600)
                  ],
                  radiusStyle: true,
                  onToggle: (index) {
                    ctrl.switchIndex.value = index!;
                    print('switched to: $index');
                  },
                ),
              ),
              Obx(() => ctrl.switchIndex.value == 0
                  ? transactionsItem()
                  : upcomingBillsItem())
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
          UI.headerWidget(context, "Wallet", Ionicons.notifications_outline),
          body(),
        ],
      ),
    );
  }
}
