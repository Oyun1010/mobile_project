import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../theme.dart';

class ConnectWalletController extends GetxController {
  RxInt switchIndex = 0.obs;
  RxBool bank = false.obs;
  RxBool micro = false.obs;
  RxBool payPal = false.obs;
}

class ConnectWallet extends StatelessWidget {
  TextEditingController name_cart = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ConnectWalletController ctrl = Get.put(ConnectWalletController());

    Widget textField(
        TextEditingController controller, String label, double width) {
      return SizedBox(
        width: width,
        height: 54,
        child: TextField(
          controller: controller,
          style: UI.textStyle(14, UI.jungleGreen, FontWeight.w500),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: UI.textStyle(12, UI.secondary, FontWeight.w400),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: UI.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: UI.jungleGreen),
            ),
          ),
        ),
      );
    }

    Widget cards() {
      return Column(
        children: [
          Container(
            height: 200,
            width: 324,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 250,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: UI.linearGradient(),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0.1),
                  child: Image.asset(
                    "assets/Cards.png",
                    width: 300,
                    height: 180,
                  ),
                ),
              ],
            ),
          ),
          UI.text("Add your debit Cart", 16, FontWeight.w500, UI.black),
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 8),
            child: UI.text(
              "This card must be connected to a bank account under your name",
              13,
              FontWeight.w400,
              UI.secondary,
            ),
          ),
          textField(name_cart, "NAME ON CARD", 364),
          Row(
            children: [
              textField(name_cart, "DEBIT CARD NUMBER", 220),
              const SizedBox(width: 11),
              textField(name_cart, "CVC", 133),
            ],
          ),
          Row(
            children: [
              textField(name_cart, "EXPIRATION MM/YY", 220),
              const SizedBox(width: 11),
              textField(name_cart, "ZIP", 133),
            ],
          ),
        ],
      );
    }

    Widget accountItem(IconData iconData, String title, String txt, int index,
        RxBool checked) {
      return Container(
        width: 344,
        height: 100,
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Obx(
          () => ElevatedButton(
            onPressed: () {
              checked.value = !checked.value;
              if (index == 0) {
                ctrl.micro.value = false;
                ctrl.payPal.value = false;
              }
              if (index == 1) {
                ctrl.bank.value = false;
                ctrl.payPal.value = false;
              }
              if (index == 2) {
                ctrl.bank.value = false;
                ctrl.micro.value = false;
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
                      child: Column(
                        children: [
                          UI.text(title, 18, FontWeight.w600,
                              checked.value ? UI.jungleGreen : UI.darkGrey),
                          UI.text(txt, 12, FontWeight.w500,
                              checked.value ? UI.jungleGreen : UI.darkGrey)
                        ],
                      ),
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

    Widget accounts() {
      return Column(
        children: [
          accountItem(Icons.comment_bank, "Bank Link",
              "Connect your bank account to deposit & fund", 0, ctrl.bank),
          accountItem(CupertinoIcons.bitcoin_circle_fill, "Microdeposits",
              "Connect bank in 5-7 days", 1, ctrl.micro),
          accountItem(Icons.paypal, "Paypal", "Connect you paypal account", 2,
              ctrl.payPal),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 358,
              height: 64,
              child: ElevatedButton(
                onPressed: () {
                  //TODO:
                  Navigator.pushNamed(context, '/billDetails');
                },
                style: UI.buttonStyle(
                  UI.white,
                  side: BorderSide(color: UI.jungleGreen),
                ),
                child: UI.text("Next", 18, FontWeight.w600, UI.jungleGreen,
                    alignment: Alignment.center),
              ),
            ),
          )
        ],
      );
    }

    Widget toggleSwitch() {
      return Container(
        width: 334,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: UI.whiteGrey,
        ),
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        child: ToggleSwitch(
          minWidth: 160.0,
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
          labels: const ['Cards', 'Accounts'],
          customTextStyles: [UI.textStyle(14, UI.secondary, FontWeight.w600)],
          radiusStyle: true,
          onToggle: (index) {
            ctrl.switchIndex.value = index!;
            print('switched to: $index');
          },
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
              toggleSwitch(),
              Obx(() => ctrl.switchIndex.value == 0 ? cards() : accounts())
            ],
          ),
        ),
      );
    }

    return Scaffold(
      // color: UI.white,
      body: Stack(
        children: [
          UI.topBackground(),
          UI.headerWidget(
            context,
            "Connect Wallet",
            Ionicons.notifications_outline,
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
