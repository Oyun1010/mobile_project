import 'package:app/page/basic_page.dart';
import 'package:app/page/home_page.dart';
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
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: '/', page: () => MyHomePage()),
        GetPage(name: '/basic', page: () => BasicPage()),
        GetPage(name: '/home', page: () => HomePage()),
        // GetPage(name: '/wallet', page: () => Waller)
      ],
      initialRoute: '/',
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
      child: Text(
        "mono",
        style: UI.text(50, UI.white, FontWeight.bold),
      ),
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
              style: UI.text(
                36,
                UI.jungleGreen,
                FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          UI.button("Get Started", UI.white, () {
            Get.toNamed('/basic');
          }),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Already Have Account? ",
                  style: UI.text(14, UI.grey, FontWeight.w500),
                ),
                Text(
                  "Login",
                  style: UI.text(14, UI.jungleGreen, FontWeight.w500),
                ),
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
