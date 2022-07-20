// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

class AppRating extends StatelessWidget {
  AppRating({Key? key, required this.rating, this.size = 16}) : super(key: key);
  double rating;
  double? size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: getIcons(rating),
    );
  }

  List<Icon> getIcons(double rating) {
    List<Icon> icons = [];
    if (rating > 5) rating = 5.0;
    int ratingIntValue = rating.toInt();

    for (int i = 0; i < ratingIntValue; i++) {
      icons.add(Icon(
        Icons.star,
        size: size,
        color: Colors.orange,
      ));
    }

    double difference = rating - ratingIntValue;
    if (difference >= 0.5) {
      icons.add(Icon(
        Icons.star_half,
        size: size,
        color: Colors.orange,
      ));
      ratingIntValue += 1;
    }

    if (ratingIntValue < 5)
      for (int j = 0; j < 5 - ratingIntValue; j++) {
        icons.add(Icon(
          Icons.star_outline,
          size: size,
          color: Colors.orange,
        ));
      }

    return icons;
  }
}
