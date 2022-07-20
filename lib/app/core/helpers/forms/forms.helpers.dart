// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wafaeats/app/core/constants/app.palette.colors.dart';

InputDecoration buildInputDecoration(
  IconData icon,
  String hintText,
) {
  return InputDecoration(
    prefixIcon: Icon(
      icon,
      color: Palette.iconColor,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Palette.textColor1),
      borderRadius: BorderRadius.all(Radius.circular(35.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Palette.textColor1),
      borderRadius: BorderRadius.all(Radius.circular(35.0)),
    ),
    contentPadding: EdgeInsets.all(10),
    hintText: hintText,
    hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
  );
}
