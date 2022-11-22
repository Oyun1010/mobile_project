import 'dart:math';

import 'package:app/theme.dart';
import 'package:flutter/material.dart';

class TransactionsHistoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  //TODO: upwork dynamic bna and color change
                  UI.text("Upwork", 16, FontWeight.w500, UI.black),
                  UI.text("Today", 13, FontWeight.w400, UI.secondary),
                ],
              )
            ],
          ),
          SizedBox(
            width: 100,
            height: 36,
            child: ElevatedButton(
              onPressed: () {
                //TODO:
              },
              style: UI.buttonStyle(UI.greenWhite),
              child: UI.text("Pay", 16, FontWeight.w500, UI.jungleGreen),
            ),
          )
        ],
      ),
    );
  }
}
