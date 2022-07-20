// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wafaeats/app/controllers/products/cart.controller.dart';
import 'package:wafaeats/app/core/constants/app.colors.dart';
import 'package:wafaeats/app/core/constants/app.constants.dart';
import 'package:wafaeats/app/modules/widgets/badges/badge.widget.dart';

AppBar homeAppBar(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
  return AppBar(
    centerTitle: true,
    backgroundColor: appBackgroundColor,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.menu,
        color: Colors.black,
      ),
      onPressed: () {
        scaffoldKey.currentState!.openDrawer();
      },
    ),
    title: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Helpy",
            style: TextStyle(
              color: ksecondaryColor,
              fontWeight: FontWeight.bold,
              fontFamily: "RobotoCondensedRegular",
              fontSize: 17,
            ),
          ),
          TextSpan(
            text: "Food",
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontFamily: "RobotoCondensedRegular",
              fontSize: 17,
            ),
          ),
        ],
      ),
    ),
    actions: <Widget>[
      Obx(
        () => Badge(
          top: 8,
          right: 8,
          value: CartController.to.products.length.toString(),
          child: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: appBlackOpacityColor,
            ),
            onPressed: () {
              Get.toNamed("/cart");
            },
          ),
        ),
      ),
    ],
  );
}
