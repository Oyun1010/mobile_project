import 'package:app/data/model.dart';
import 'package:app/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionsItem extends StatefulWidget {
  T_ransactions transactions;
  TransactionsItem(this.transactions);

  @override
  TransactionsItemState createState() => TransactionsItemState(transactions);
}

class TransactionsItemState extends State<TransactionsItem> {
  T_ransactions transactions;
  TransactionsItemState(this.transactions);
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
                  borderRadius: BorderRadius.circular(6),
                  color: UI.bWhite,
                ),
                child: Image.network(
                  transactions.image,
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
                    UI.text(transactions.name, 16, FontWeight.w500, UI.black,
                        alignment: Alignment.centerLeft),
                    const SizedBox(height: 8),
                    UI.text(transactions.dateTime, 13, FontWeight.w400,
                        UI.secondary,
                        alignment: Alignment.centerLeft),
                  ],
                ),
              )
            ],
          ),
          if (transactions.amount.substring(0, 1) == '-')
            UI.text(
                "- \$ ${transactions.amount.substring(1, transactions.amount.length)}",
                18,
                FontWeight.bold,
                UI.red)
          else if (transactions.amount.substring(0, 1) == '+')
            UI.text(
                "+ \$ ${transactions.amount.substring(1, transactions.amount.length)}",
                18,
                FontWeight.bold,
                UI.green),
        ],
      ),
    );
  }
}
