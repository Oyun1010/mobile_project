import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../theme.dart';

class AddExpenseController extends GetxController {
  RxBool showClear = false.obs;
  RxString selected = "".obs;
}

class AddExpense extends StatelessWidget {
  TextEditingController amount = TextEditingController();
  TextEditingController dateTime = TextEditingController();
  AddExpenseController ctrl = Get.put(AddExpenseController());
  Widget title(String txt) {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 12),
      child: UI.text(txt, 12, FontWeight.w500, UI.secondary),
    );
  }

  Widget textFeild(TextEditingController controller, String hintText,
      {Widget? suffix, bool isSuffix = false}) {
    return Container(
      width: 318,
      child: TextField(
        controller: controller,
        style: UI.textStyle(14, UI.jungleGreen, FontWeight.w600),
        onChanged: ((value) {
          if (controller.text.isNotEmpty) {
            ctrl.showClear.value = true;
          } else {
            ctrl.showClear.value = false;
          }
        }),
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: UI.borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: UI.jungleGreen),
          ),
          suffixIcon: isSuffix
              ? suffix
              : Obx(
                  () => (ctrl.showClear.value ? suffix! : const SizedBox()),
                ),
        ),
      ),
    );
  }

  // List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  // Widget dropdown() {
  //   ctrl.selected.value = list[0];
  //   return Container(
  //     width: 318,
  //     height: 48,
  //     decoration: BoxDecoration(
  //         border: Border.all(color: UI.grey),
  //         borderRadius: BorderRadius.circular(8)),
  //     padding: const EdgeInsets.symmetric(horizontal: 12),
  //     child: DropdownButton<String>(
  //         value: ctrl.selected.value,
  //         icon: const Icon(Icons.arrow_downward),
  //         elevation: 16,
  //         style: const TextStyle(color: Colors.deepPurple),
  //         onChanged: (String? value) {
  //           ctrl.selected.value = value!;
  //         },
  //         underline: null,
  //         items: list.map<DropdownMenuItem<String>>((String value) {
  //           return DropdownMenuItem<String>(
  //             value: value,
  //             child: Text(value),
  //           );
  //         }).toList(),
  //         selectedItemBuilder: (context) => [
  //               Container(
  //                 width: 260,
  //                 child: Text(
  //                   ctrl.selected.value,
  //                   style: UI.textStyle(16, UI.secondary, FontWeight.bold),
  //                 ),
  //               )
  //             ]),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    Widget child() {
      return Column(
        children: [
          title("NAME"),
          // dropdown(),
          textFeild(
            amount,
            "Name",
            suffix: Icon(Ionicons.chevron_down, color: UI.darkGrey, size: 20),
            isSuffix: true,
          ),
          title("Amount"),
          textFeild(
            amount,
            "Amount",
            suffix: SizedBox(
              width: 30,
              height: 18,
              child: ElevatedButton(
                onPressed: () {
                  //TODO:
                  amount.clear();
                  ctrl.showClear.value = false;
                },
                style: UI.buttonStyle(Colors.transparent),
                child: UI.text("Clear", 12, FontWeight.w500, UI.jungleGreen),
              ),
            ),
          ),
          title("DATE"),
          textFeild(dateTime, "Tue, 22 Feb 2022",
              suffix: Icon(
                Ionicons.calendar_clear,
                color: UI.darkGrey,
                size: 20,
              ),
              isSuffix: true),
          title("INVOICE"),
          Container(
            width: 318,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                //TODO:
              },
              style: UI.buttonStyle(UI.white, borderRadius: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //TODO:
                  Icon(Ionicons.add_circle, size: 20, color: UI.secondary),
                  const SizedBox(width: 12),
                  UI.text("Add Invoice", 14, FontWeight.w500, UI.secondary,
                      alignment: Alignment.center),
                ],
              ),
            ),
          )
        ],
      );
    }

    return UI.screen(
        context,
        UI.headerWidget(context, "Add Expense", Ionicons.ellipsis_horizontal),
        child());
  }
}
