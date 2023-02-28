import 'package:flutter/material.dart';
import 'package:liferary/Styles/ColorStyles.dart';
import 'package:liferary/utilities/palette.dart';

class Styles {
  //MARK: -itemName
  static TextStyle loginBoxText = const TextStyle(
      color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600);
  static TextStyle tabBarText = const TextStyle(
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600);
  static TextStyle typeBoxText = const TextStyle(
      color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600);
  static TextStyle postHeaderText =
      TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold);
  static TextStyle postContextText = TextStyle(
    color: Colors.black,
    fontSize: 15,
  );
  static TextStyle postWriterText = TextStyle(
    color: Colors.black,
    fontSize: 15,
  );

  static TextStyle userPageHeaderText = TextStyle(
    color: const Color.fromRGBO(66, 133, 244, 40),
    fontSize: 20,
  );

  static TextStyle userPageBodyText = TextStyle(
    color: Palette.blue4,
    fontSize: 25,
    fontWeight: FontWeight.w800,
  );
}
