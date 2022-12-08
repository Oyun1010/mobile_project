import 'package:app/module/transactions_item.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class T_ransactions {
  String amount;
  String dateTime;
  String image;
  String name;

  T_ransactions(this.amount, this.dateTime, this.image, this.name);
  factory T_ransactions.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return T_ransactions(
      data?["amount"],
      data?["dateTime"],
      data?["image"],
      data?["name"],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (amount != null) 'amount': amount,
      if (dateTime != null) 'dateTime': dateTime,
      if (image != null) 'image': image,
      if (name != null) 'name': name,
    };
  }
}

class UpComingBill {
  String amount;
  String dateTime;
  String image;
  String name;

  UpComingBill(this.amount, this.dateTime, this.image, this.name);
  factory UpComingBill.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return UpComingBill(
      data?["amount"],
      data?["dateTime"],
      data?["image"],
      data?["name"],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (amount != null) 'amount': amount,
      if (dateTime != null) 'dateTime': dateTime,
      if (image != null) 'image': image,
      if (name != null) 'name': name,
    };
  }
}
