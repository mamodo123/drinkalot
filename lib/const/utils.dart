
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'consts.dart';

// boas opções de fonte:
// * shortStack
// * walterTurncoat

TextStyle mainTextStyle(Color color, double fontSize, {double? height}) {
  return GoogleFonts.walterTurncoat(
    textStyle: TextStyle(
      color: color,
      fontSize: fontSize,
      height: height,
    ),
  );
}

TextStyle cardTextStyle(Color color, double fontSize, {double? height}) {
  return GoogleFonts.justAnotherHand(
    textStyle: TextStyle(
      color: color,
      fontSize: fontSize,
      height: height,
    ),
  );
}

TextStyle appNameTextStyle(Color color, double fontSize) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontFamily: font,
  );
}