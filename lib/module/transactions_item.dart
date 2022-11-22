import 'dart:math';

import 'package:app/theme.dart';
import 'package:flutter/material.dart';

class TransactionsItem extends StatelessWidget {
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
                color: UI.bWhite,
                child: Image.asset(
                  "assets/logo/image1.png",
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
                    UI.text("Upwork", 16, FontWeight.w500, UI.black,
                        alignment: Alignment.centerLeft),
                    const SizedBox(height: 8),
                    UI.text("Today", 13, FontWeight.w400, UI.secondary,
                        alignment: Alignment.centerLeft),
                  ],
                ),
              )
            ],
          ),
          UI.text("- ₮ 850.00", 18, FontWeight.w400, UI.red)
        ],
      ),
    );
  }
}
