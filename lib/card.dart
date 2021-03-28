import 'package:flutter/material.dart';
import 'constants.dart';

void addCards(String title, Color color) {
  cards.add(
    Padding(
      padding: const EdgeInsets.all(3),
      child: InkWell(
        onLongPress: () {
          print("Long Press");
        },
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 5000),
          opacity: 1.0,
          child: Container(
            height: 200,
            width: 200,
            child: Card(
              color: color,
              child: Stack(
                children: [
                  Center(
                    child: Text(title),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
