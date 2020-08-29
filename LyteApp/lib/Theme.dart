import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Colors {
  const Colors();

  static const Color appBarTitle = const Color(0xFFFFFFFF);
  static const Color appBarIconColor = const Color(0xFFFFFFFF);
  static const Color appBarDetailBackground = const Color(0x00FFFFFF);
  static const Color appBarGradientStart = const Color(0xFF3383FC);
  static const Color appBarGradientEnd = const Color(0xFF00C6FF);

  //static const Color alertCard = const Color(0xFF434273);
  static Color alertCard = Hexcolor('#5f3092');
  //static const Color alertListBackground = const Color(0xFF3E3963);
  static const Color alertPageBackground = const Color(0xFF00000000);
  static const Color alertTitle = const Color(0xFFFFFFFF);
  static const Color alertLocation = const Color(0x66FFFFFF);
  static const Color alertDistance = const Color(0x66FFFFFF);
}

class Dimens {
  const Dimens();

  static const alertWidth = 120.0;
  static const alertHeight = 120.0;
}

class TextStyles {
  const TextStyles();

  static const TextStyle appBarTitle = const TextStyle(
      color: Colors.appBarTitle,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 36.0);

  static const TextStyle alertTitle = const TextStyle(
      color: Colors.alertTitle,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 15.0);

  static const TextStyle alertLocation = const TextStyle(
      color: Colors.alertLocation,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 10.0);

  static const TextStyle alertDistance = const TextStyle(
      color: Colors.alertDistance,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 12.0);
}
