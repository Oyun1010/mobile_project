import 'package:app/data/model.dart';
import 'package:app/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayController extends GetxController {
  Rx<UpComingBill> selected = UpComingBill('', '', '', '').obs;
}

class PayItem extends StatelessWidget {
  UpComingBill upComingBill;
  PayItem(this.upComingBill, {super.key});
  PayController controller = Get.put(PayController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                    color: UI.bWhite, borderRadius: BorderRadius.circular(8)),
                child: Image.network(
                  upComingBill.image,
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
                    UI.text(upComingBill.name, 16, FontWeight.w500, UI.black,
                        alignment: Alignment.centerLeft),
                    const SizedBox(height: 8),
                    UI.text(upComingBill.dateTime, 13, FontWeight.w400,
                        UI.secondary,
                        alignment: Alignment.centerLeft),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            width: 100,
            height: 36,
            child: ElevatedButton(
              onPressed: () {
                //TODO:
                // Get.toNamed("connectWallet");
                controller.selected.value = upComingBill;
                Navigator.pushNamed(context, "/connectWallet");
              },
              style: UI.buttonStyle(UI.greenWhite),
              child: UI.text(
                "Pay",
                16,
                FontWeight.w500,
                UI.jungleGreen,
                alignment: Alignment.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
