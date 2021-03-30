import 'package:flutter/material.dart';

Color stringToColor(String color) {
  Color resultColor = Colors.white;
  if (color == "redAccent") {
    resultColor = Colors.redAccent;
  } else if (color == "amber") {
    resultColor = Colors.amber;
  }
  return resultColor;
}

String colorToString(Color color) {
  String result = "white";
  if (color == Colors.redAccent) {
    result = "redAccent";
  } else if (color == Colors.amber) {
    result = "amber";
  }
  return result;
}
