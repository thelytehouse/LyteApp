import 'dart:ui' show Color;

import 'package:flutter/material.dart';

class LytehouseColors {
  LytehouseColors._();

  static const MaterialColor purple = MaterialColor(
    _lyteHousePurplePrimaryValue,
    <int, Color>{
      50: Color(0xFF5f3092),
      100: Color(0xFF5f3092),
      200: Color(0xFF5f3092),
      300: Color(0xFF5f3092),
      400: Color(0xFF5f3092),
      500: Color(_lyteHousePurplePrimaryValue),
      600: Color(0xFF5f3092),
      700: Color(0xFF5f3092),
      800: Color(0xFF5f3092),
      900: Color(0xFF5f3092),
    },
  );
  static const int _lyteHousePurplePrimaryValue = 0xFF5f3092;

  static const MaterialColor yellow = MaterialColor(
    _lyteHouseYellowPrimaryValue,
    <int, Color>{
      50: Color(0xFFfee156),
      100: Color(0xFFfee156),
      200: Color(0xFFfee156),
      300: Color(0xFFfee156),
      400: Color(0xFFfee156),
      500: Color(_lyteHouseYellowPrimaryValue),
      600: Color(0xFFfee156),
      700: Color(0xFFfee156),
      800: Color(0xFFfee156),
      900: Color(0xFFfee156),
    },
  );
  static const int _lyteHouseYellowPrimaryValue = 0xFFfee156;
}
