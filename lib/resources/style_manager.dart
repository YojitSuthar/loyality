import 'package:flutter/material.dart';

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight super_bold = FontWeight.w900;
}

TextStyle newgetTextStyle(double fontSize, FontWeight fontweight, Color color) {
  return TextStyle(fontSize: fontSize, fontWeight: fontweight, color: color);
}

TextStyle getTextStyle(double fontSize,String fontFamily, Color color) {
  return TextStyle(fontSize: fontSize, fontFamily: fontFamily, color: color);


}