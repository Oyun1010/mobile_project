import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UI {
  static Color white = const Color.fromRGBO(255, 255, 255, 1);
  static Color jungleGreen = const Color.fromRGBO(67, 136, 131, 1);
  static Color grey = const Color.fromRGBO(68, 68, 68, 1);
  static Color ligthgrey = const Color.fromRGBO(170, 170, 170, 1);
  static Color black = const Color.fromRGBO(34, 34, 34, 1);
  static Color secondary = const Color.fromRGBO(102, 102, 102, 1);
  static Color bWhite = const Color.fromRGBO(240, 246, 245, 1);
  static Color green = const Color.fromRGBO(37, 169, 105, 1);
  static Color red = const Color.fromRGBO(249, 91, 81, 1);
  static Color greenWhite = const Color.fromRGBO(236, 249, 248, 1);
  static Color whiteGrey = const Color.fromRGBO(244, 246, 246, 1);
  static Color borderColor = const Color.fromRGBO(221, 221, 221, 1);
  static Color greyGreen = const Color.fromRGBO(67, 136, 131, 0.1);
  static Color darkGrey = const Color.fromRGBO(136, 136, 136, 1);
  static Color lilia = const Color.fromRGBO(250, 250, 250, 1);
  static Color dark = const Color.fromRGBO(0, 0, 0, 1);

  static W(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static H(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static screen(BuildContext context, Widget header, Widget child) {
    return Container(
      color: UI.white,
      child: Stack(
        children: [
          UI.topBackground(),
          header,
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: UI.H(context) - 190,
              width: UI.W(context),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: UI.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  static textStyle(double fontSize, Color color, FontWeight fontWeight) {
    return GoogleFonts.inter(
        textStyle: TextStyle(
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color,
            decoration: TextDecoration.none));
  }

  static Widget text(
      String text, double fontSize, FontWeight fontWeight, Color color,
      {TextAlign textAlign = TextAlign.left,
      Alignment alignment = Alignment.centerLeft}) {
    return Align(
      alignment: alignment,
      child: Text(
        text,
        style: UI.textStyle(fontSize, color, fontWeight),
        textAlign: textAlign,
      ),
    );
  }

  static LinearGradient linearGradient() {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color.fromRGBO(99, 181, 175, 1),
        Color.fromRGBO(67, 136, 131, 1),
      ],
      tileMode: TileMode.mirror,
    );
  }

  static topBackground() {
    return Container(
      height: 350,
      child: Stack(
        children: [
          Image.asset(
            "assets/bg.png",
            fit: BoxFit.cover,
          ),
          Image.asset(
            "assets/group.png",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  static button(String text, Color color, Function func,
      {bool gradient = true}) {
    return Container(
      width: 358,
      height: 64,
      decoration: BoxDecoration(
        gradient: gradient ? UI.linearGradient() : null,
        color: gradient ? null : UI.white,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: UI.jungleGreen),
      ),
      child: GestureDetector(
        //TODO:
        onTap: () {
          func();
        },
        child: Align(
          alignment: Alignment.center,
          child: UI.text(text, 18, FontWeight.w600, color,
              alignment: Alignment.center),
        ),
      ),
    );
  }

  static buttonStyle(
    Color color, {
    BorderSide side = BorderSide.none,
    double borderRadius = 40,
  }) {
    return ButtonStyle(
      alignment: Alignment.center,
      elevation: MaterialStateProperty.all(0),
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      backgroundColor: MaterialStateProperty.all(color),
      overlayColor: MaterialStateProperty.all(UI.white.withOpacity(0.2)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius), side: side),
      ),
    );
  }

  static Widget headerWidget(
      BuildContext context, String text, IconData iconData,
      {Function? func}) {
    return SizedBox(
      height: 250,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 8),
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  func!();
                },
                style: UI.buttonStyle(Colors.transparent),
                child: Icon(Icons.arrow_back_ios, size: 18, color: UI.white),
              ),
            ),
            SizedBox(
              width: 180,
              height: 25,
              child: UI.text(text, 18, FontWeight.w600, UI.white,
                  alignment: Alignment.center),
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  //TODO; notifcation button or ... button
                },
                style: UI.buttonStyle(Colors.transparent),
                child: Icon(iconData, size: 24, color: UI.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
