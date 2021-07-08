import 'package:flutter/material.dart';

class ThemeClass{
  static final primaryFontFamily = "GT Walsheim";


  static TextStyle style_regular_14() {
    return TextStyle(
        fontFamily: ThemeClass.primaryFontFamily,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white);
  }

  static TextStyle style_bold_14() {
    return TextStyle(
        fontFamily: ThemeClass.primaryFontFamily,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white);
  }

  static TextStyle style_regular_12() {
    return TextStyle(
        fontFamily: ThemeClass.primaryFontFamily,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.white);
  }
  static TextStyle style_bold_12() {
    return TextStyle(
        fontFamily: ThemeClass.primaryFontFamily,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.white);
  }
}