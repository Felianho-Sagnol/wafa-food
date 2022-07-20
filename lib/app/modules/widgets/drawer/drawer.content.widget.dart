// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, dead_code

import 'package:wafaeats/app/controllers/auth.controller.dart';
import 'package:wafaeats/app/controllers/products/cart.controller.dart';
import 'package:wafaeats/app/core/constants/app.colors.dart';
import 'package:wafaeats/app/modules/widgets/badges/badge.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerContentWidget extends StatefulWidget {
  const DrawerContentWidget({Key? key}) : super(key: key);

  @override
  State<DrawerContentWidget> createState() => _DrawerContentWidgetState();
}

class _DrawerContentWidgetState extends State<DrawerContentWidget> {
  double paddingTop = 15;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25),
      child: Obx(
        () => Column(
          children: [
            Material(
              //color: true ? Colors.grey[300] : Colors.transparent,
              child: InkWell(
                onTap: () {
                  Get.back();
                  setState(() {});
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Icon(
                          Icons.home,
                          size: 20,
                          color: appBlackOpacityColor,
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Text(
                          "Accueil",
                          style: itemStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Material(
              //color: true ? Colors.grey[300] : Colors.transparent,
              child: InkWell(
                onTap: () {
                  Get.back();
                  Get.toNamed('/restaurants');
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0, top: paddingTop),
                  child: Row(
                    children: [
                      Expanded(
                        child: Icon(
                          Icons.restaurant,
                          size: 20,
                          color: appBlackOpacityColor,
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Text(
                          "Restaurants",
                          style: itemStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (AuthController.to.isAuthenticated.value)
              Material(
                //color: true ? Colors.grey[300] : Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Get.back();
                    setState(() {});
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, top: paddingTop),
                    child: Row(
                      children: [
                        Expanded(
                          child: Icon(
                            Icons.person,
                            size: 20,
                            color: appBlackOpacityColor,
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Text(
                            "Profile",
                            style: itemStyle(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            Material(
              //color: true ? Colors.grey[300] : Colors.transparent,
              child: InkWell(
                onTap: () {
                  Get.back();
                  setState(() {});
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0, top: paddingTop),
                  child: Row(
                    children: [
                      Expanded(
                        child: Icon(
                          Icons.dinner_dining,
                          size: 20,
                          color: appBlackOpacityColor,
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Text(
                          "Mes commandes",
                          style: itemStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (AuthController.to.isAuthenticated.value)
              Material(
                //color: true ? Colors.grey[300] : Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Get.back();
                    setState(() {
                      AuthController.to.setIsAuthenticated(false);
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, top: paddingTop),
                    child: Row(
                      children: [
                        Expanded(
                          child: Icon(
                            Icons.logout,
                            size: 20,
                            color: appBlackOpacityColor,
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Text(
                            "Déconnexion",
                            style: itemStyle(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            Material(
              //color: true ? Colors.grey[300] : Colors.transparent,
              child: InkWell(
                onTap: () {
                  Get.back();
                  setState(() {});
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0, top: paddingTop),
                  child: Row(
                    children: [
                      Expanded(
                        child: Badge(
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
                      Expanded(
                        flex: 6,
                        child: Text(
                          "Mon Panier",
                          style: itemStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Material(
              //color: true ? Colors.grey[300] : Colors.transparent,
              child: InkWell(
                onTap: () {
                  Get.back();
                  setState(() {});
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0, top: paddingTop),
                  child: Row(
                    children: [
                      Expanded(
                        child: Icon(
                          Icons.info,
                          size: 20,
                          color: appBlackOpacityColor,
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Text(
                          "Termes & Conditions",
                          style: itemStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle itemStyle() {
    return TextStyle(
      color: appBlackOpacityColor,
      fontSize: 16,
      fontFamily: "RobotoCondensedRegular",
    );
  }
}
