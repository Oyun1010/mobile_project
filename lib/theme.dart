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

  static W(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static H(BuildContext context) {
    return MediaQuery.of(context).size.height;
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
      String text, double fontSize, FontWeight fontWeight, Color color) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(bottom: 4),
        child: Text(
          text,
          style: UI.textStyle(fontSize, color, fontWeight),
          textAlign: TextAlign.left,
        ),
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
      ], // Gradient from https://learnui.design/tools/gradient-generator.html
      tileMode: TileMode.mirror,
    );
  }

  static topBackground() {
    return Container(
      width: double.infinity,
      height: 280,
      decoration: BoxDecoration(
        color: UI.jungleGreen,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
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
          child: Text(
            text,
            style: UI.textStyle(18, color, FontWeight.w600),
          ),
        ),
      ),
    );
  }

  static buttonStyle(Color color) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(color),
      shadowColor: MaterialStateProperty.all(color),
      foregroundColor: MaterialStateProperty.all(UI.white),
      overlayColor: MaterialStateProperty.all(UI.white.withOpacity(0.2)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      fixedSize: MaterialStateProperty.all(const Size(358, 60)),
    );
  }
}
