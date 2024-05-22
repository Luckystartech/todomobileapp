import 'package:flutter/material.dart';

class AppStyle {
  static const heading1 = TextStyle(fontSize: 22, fontWeight: FontWeight.w600);
  static const heading1White = TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white);
  static const heading2 = TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  static const heading3 = TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
  static const heading2White =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white);
  static const bodyTextGrey = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black45);
  static const bodyTextBlack =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
  static const bodyTextWhite =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white);
  static const bodyTextLight = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white54);

  // Shadow style
  static const cardShadow = BoxShadow(
      color: Colors.black12,
      spreadRadius: 0.2,
      blurRadius: 10,
      offset: Offset(5, 4));
  static const primaryColor = Color(0xFF0093E8);
}
