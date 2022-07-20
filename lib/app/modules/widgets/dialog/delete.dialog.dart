// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:wafaeats/app/controllers/products/cart.controller.dart';
import 'package:wafaeats/app/core/constants/app.colors.dart';
import 'package:wafaeats/app/modules/widgets/snackbar/product.snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dialog {
  static showDeleteDialog(int id, String name) {
    Get.dialog(
      AlertDialog(
        title: Text(
          'Suppression de produit',
          style: TextStyle(
              color: appBlackOpacityColor,
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
        content: RichText(
          text: TextSpan(
            text: "Souhaitez-vous supprimer le produit ",
            style: TextStyle(
              color: appBlackOpacityColor,
              fontSize: 13,
            ),
            children: <TextSpan>[
              TextSpan(
                text: name + ' ',
                style: TextStyle(
                  color: appBlackOpacityColor,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: ' de votre panier ?',
                style: TextStyle(
                  color: appBlackOpacityColor,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        // Text(
        //   "Souhaitez-vous supprimer le produit : ${name} de votre panier ?",
        //   style: TextStyle(
        //     color: appBlackOpacityColor,
        //     fontSize: 12,
        //   ),
        // ),
        actions: [
          TextButton(
            child: Text(
              "NON",
              style: TextStyle(
                color: appBlackOpacityColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => Get.back(),
          ),
          TextButton(
              child: Text(
                "OUI",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () async {
                Get.back();
                await CartController.to.deletFromCart(id);
              }),
        ],
      ),
    );
  }
}
