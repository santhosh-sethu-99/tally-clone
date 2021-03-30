import 'package:flutter/material.dart';

Color stringToColor(String color) {
  Color resultColor = Colors.white;
  if (color == "redAccent") {
    resultColor = Colors.redAccent;
  } else if (color == "amber") {
    resultColor = Colors.amber;
  } else if (color == "green") {
    resultColor = Colors.green;
  } else if (color == "blue") {
    resultColor = Colors.blue;
  } else if (color == "pink") {
    resultColor = Colors.pink;
  } else if (color == "yellow") {
    resultColor = Colors.yellow;
  } else if (color == "deepOrange") {
    resultColor = Colors.deepOrange;
  } else if (color == "indigo") {
    resultColor = Colors.indigo;
  } else if (color == "red") {
    resultColor = Colors.red;
  }
  return resultColor;
}

String colorToString(Color color) {
  String result = "white";
  if (color == Colors.redAccent) {
    result = "redAccent";
  } else if (color == Colors.amber) {
    result = "amber";
  } else if (color == Colors.blue) {
    result = "blue";
  } else if (color == Colors.pink) {
    result = "pink";
  } else if (color == Colors.green) {
    result = "green";
  } else if (color == Colors.yellow) {
    result = "yellow";
  } else if (color == Colors.deepOrange) {
    result = "deepOrange";
  } else if (color == Colors.red) {
    result = "red";
  } else if (color == Colors.indigo) {
    result = "indigo";
  }
  return result;
}
