import 'package:flutter/material.dart';
import '../page/basic_page.dart';
import 'theme.dart';
// Import the generated file
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
  @override
  void initState() {
    if (splash) {
      Future.delayed(const Duration(seconds: 5), () {
        setState(() {
          splash = false;
        });
      });
    } else {
      setState(() {
        splash = true;
      });
    }
  }

  Widget splashScreen() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: UI.linearGradient(),
      ),
      child: UI.text("mono", 50, FontWeight.bold, UI.white,
          alignment: Alignment.center),
    );
  }

  Widget body() {
    return SizedBox(
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
            child: Container(
              width: 280,
              margin: const EdgeInsets.only(top: 80),
              child: Stack(
                children: [
                  Align(
                    alignment: const Alignment(-0.4, -0.9),
                    child:
                        Image.asset("assets/Coint.png", width: 65, height: 65),
                  ),
                  Align(
                    alignment: const Alignment(0.5, -0.7),
                    child:
                        Image.asset("assets/Donut.png", width: 65, height: 65),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/Man.png",
                      height: 400,
                      width: 300,
                    ),
                  ),
                ],
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
      child: splash ? splashScreen() : body(),
    );
  }
}
