import 'package:app/module/bill_details.dart';
import 'package:app/module/bill_payment.dart';
import 'package:app/module/connect_wallet.dart';
import 'package:app/page/basic_page.dart';
import 'package:app/page/home_page.dart';
import 'package:app/page/wallet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool splash = true;
  Widget Splash() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: UI.linearGradient(),
      ),
      child: UI.text("mono", 50, FontWeight.bold, UI.white),
    );
  }

  Widget body() {
    return Container(
      width: UI.W(context),
      child: Column(
        children: [
          Container(
            width: UI.W(context),
            height: UI.H(context) / 2 + 80,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/bg1.png",
                  ),
                  fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Image.asset(
                "assets/Man.png",
                height: UI.H(context) / 2 - 200,
              ),
            ),
          ),
          Container(
            width: 300,
            padding: const EdgeInsets.symmetric(vertical: 26),
            child: Text(
              "Spend Smarter Save More",
              style: UI.textStyle(
                36,
                UI.jungleGreen,
                FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          UI.button("Get Started", UI.white, () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => BasicPage()));
          }),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                UI.text("Already Have Account?", 14, FontWeight.w500, UI.grey),
                UI.text("Login", 14, FontWeight.w500, UI.jungleGreen),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: UI.white,
      child: body(),
    );
  }
}
