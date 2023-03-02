import 'package:flutter/material.dart';

//this are the text styles for the styling the text in the project

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight superBold = FontWeight.w900;
}

TextStyle fontSizeWeightTextStyle(double fontSize, FontWeight weight){
  return TextStyle(fontSize: fontSize, fontWeight: weight);
}

TextStyle fontSizeWeightColorTextStyle(double fontSize, FontWeight fontweight, Color color) {
  return TextStyle(fontSize: fontSize, fontWeight: fontweight, color: color);
}

TextStyle fontSizeFamilyColorTextStyle(double fontSize,String fontFamily, Color color) {
  return TextStyle(fontSize: fontSize, fontFamily: fontFamily, color: color);

}