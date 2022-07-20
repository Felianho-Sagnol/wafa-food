// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:wafaeats/app/core/constants/app.colors.dart';
import 'package:wafaeats/app/core/constants/app.fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailDialog {
  static showDetailDialog(String name, String description, {int? type = 1}) {
    Get.dialog(
      AlertDialog(
        title: RichText(
          text: TextSpan(
            text: 'Description du ' +
                ((type == 1) ? "restaurant" : "produit") +
                " : ",
            style: TextStyle(
              color: appBlackOpacityColor.withOpacity(0.4),
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[
              TextSpan(
                text: name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: appBlackOpacityColor,
                ),
              ),
            ],
          ),
        ),
        content: SingleChildScrollView(
          child: RichText(
            text: TextSpan(
              text: description,
              style: TextStyle(
                color: appBlackOpacityColor.withOpacity(0.6),
                fontSize: 15,
                fontFamily: appPrincipalFont,
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
              child: Text(
                "Ok",
                style: TextStyle(
                  color: appBlackOpacityColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () async {
                Get.back();
              }),
        ],
      ),
    );
  }
}
