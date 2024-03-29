import 'package:app/data/GetData.dart';
import 'package:app/data/model.dart';
import 'package:app/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:get/get.dart';
import '../module/pay_item.dart';
import '../module/transactions_item.dart';
import '../theme.dart';

class WalletContoller extends GetxController {
  RxInt switchIndex = 0.obs;
  RxList<T_ransactions> transactions = <T_ransactions>[].obs;
  RxList<UpComingBill> upComingBills = <UpComingBill>[].obs;

  WalletContoller() {
    GetData.transactionsHistory().then((value) => transactions.value = value);
    GetData.upComingBills().then((value) => upComingBills.value = value);
  }
}

class Wallet extends StatelessWidget {
  WalletContoller ctrl = Get.put(WalletContoller());
  HomePageController amount = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    Widget iconItem(IconData iconData, String text) {
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
      return Obx(
        () => Column(
          children: ctrl.transactions
              .map((element) => TransactionsItem(element))
              .toList(),
        ),
      );
    }

    Widget upcomingBillsItem() {
      return Column(
        children:
            ctrl.upComingBills.map((element) => PayItem(element)).toList(),
      );
    }

    Widget body() {
      return Column(
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
                Obx(
                  () => SizedBox(
                    width: 200,
                    child: UI.text("\$${amount.total.value}", 30,
                        FontWeight.w700, UI.black,
                        alignment: Alignment.center),
                  ),
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
              minWidth: 170.0,
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
      );
    }

    return UI.screen(
        context,
        UI.headerWidget(context, "Wallet", Ionicons.notifications_outline),
        body());
  }
}
