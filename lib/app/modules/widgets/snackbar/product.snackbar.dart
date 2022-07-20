// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductSnackBar {
  static void addedSuccessfulySnackbar(String message) {
    Get.snackbar(
      "Ajout de produit",
      message,
      icon: Icon(
        Icons.add_shopping_cart,
        color: Colors.white,
      ),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      borderRadius: 10,
      margin: EdgeInsets.all(15),
      colorText: Colors.white,
      duration: Duration(seconds: 3),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  static void deleteProductSnackbar(String message) {
    Get.snackbar(
      "Suppression de produit",
      message,
      icon: Icon(
        Icons.delete,
        color: Colors.white,
      ),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      borderRadius: 10,
      margin: EdgeInsets.all(15),
      colorText: Colors.white,
      duration: Duration(seconds: 3),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
