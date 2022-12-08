import 'package:app/data/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class GetData {
  static Future<List<T_ransactions>> transactionsHistory() async {
    List<T_ransactions> transactions = [];

    final data =
        await FirebaseFirestore.instance.collection("transaction").get();
    for (int i = 0; i < data.docs.length; i++) {
      final res = await FirebaseFirestore.instance
          .collection("transaction")
          .doc(data.docs[i].id)
          .withConverter(
              fromFirestore: T_ransactions.fromFirestore,
              toFirestore: (T_ransactions transactions, _) =>
                  transactions.toFirestore())
          .get();
      transactions.add(res.data()!);
    }
    print(transactions);

    return transactions;
  }

  static Future<List<UpComingBill>> upComingBills() async {
    List<UpComingBill> upcomingBills = [];

    final data =
        await FirebaseFirestore.instance.collection("transaction").get();
    for (int i = 0; i < data.docs.length; i++) {
      final res = await FirebaseFirestore.instance
          .collection("transaction")
          .doc(data.docs[i].id)
          .withConverter(
              fromFirestore: UpComingBill.fromFirestore,
              toFirestore: (UpComingBill upComingBill, _) =>
                  upComingBill.toFirestore())
          .get();
      upcomingBills.add(res.data()!);
    }
    print(upcomingBills);

    return upcomingBills;
  }
}
