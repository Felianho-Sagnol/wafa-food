// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorSnackbar {
  static void errorSnackbar(String message) {
    Get.snackbar(
      "Erreur !",
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      borderRadius: 0,
      margin: EdgeInsets.all(8),
      colorText: Colors.white,
      duration: Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
