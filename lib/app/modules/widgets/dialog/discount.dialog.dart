// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables

import 'package:wafaeats/app/core/constants/app.colors.dart';
import 'package:wafaeats/app/core/constants/app.fonts.dart';
import 'package:wafaeats/app/core/constants/app.palette.colors.dart';
import 'package:wafaeats/app/core/helpers/forms/forms.helpers.dart';
import 'package:wafaeats/app/modules/widgets/snackbar/succes.snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscountDialog {
  final controller = TextEditingController();
  showDiscountDialog() {
    Get.dialog(
      AlertDialog(
        title: Center(
          child: Text(
            "Coupon de réduction",
            style: TextStyle(
              color: appBlackOpacityColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.text,
                  decoration: buildInputDecoration(
                    Icons.discount,
                    "Votre coupon ici",
                  ),
                  cursorColor: Palette.textColor1,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: GestureDetector(
                  onTap: () {
                    SuccesSnackbar.succesSnackbar(
                      controller.text.isEmpty
                          ? "une erreur est survenu"
                          : controller.text,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 50,
                    decoration: BoxDecoration(
                      color: appBlackOpacityColor,
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    child: Center(
                      child: Text(
                        "AJOUTER",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: appPrincipalFont,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: Icon(
              Icons.cancel,
              color: appBlackOpacityColor,
              size: 30,
            ),
            onPressed: () async {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
