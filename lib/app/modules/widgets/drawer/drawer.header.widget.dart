// ignore_for_file: prefer_const_constructors

import 'package:wafaeats/app/controllers/auth.controller.dart';
import 'package:wafaeats/app/core/constants/app.colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class DrawerHeaderWidget extends StatefulWidget {
  const DrawerHeaderWidget({Key? key}) : super(key: key);

  @override
  State<DrawerHeaderWidget> createState() => _DrawerHeaderWidgetState();
}

class _DrawerHeaderWidgetState extends State<DrawerHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: appPrincipalColor,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/drawerHeaderbg.png"),
          fit: BoxFit.fill,
        ),
      ),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 15.0),
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 15),
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/profile.png'),
                ),
              ),
            ),
            if (!AuthController.to.isAuthenticated.value) ...[
              Center(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      // AuthController.to.setIsAuthenticated(
                      //   !AuthController.to.isAuthenticated.value,
                      // );
                      Get.back();
                      Get.toNamed('/login');
                    },
                    child: Container(
                      height: 40,
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          //color: Colors.white.withOpacity(0.7),
                          color: appContainerBackgroundColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(width: 20),
                              //flex: 3,
                              Icon(
                                Icons.login,
                                size: 20,
                                color: Colors.black.withOpacity(0.6),
                              ),
                              //flex: 6,
                              Text(
                                "Se connecter",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "RobotoCondensedRegular",
                                ),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
            if (AuthController.to.isAuthenticated.value) ...[
              Text(
                "Josi TONLOD",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 20,
                  fontFamily: "RobotoCondensedRegular",
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "info@rapidtech.dev",
                style: TextStyle(
                  color: Colors.grey.withOpacity(0.8),
                  fontSize: 14,
                  fontFamily: "RobotoCondensedRegular",
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  TextStyle itemStyle() {
    return TextStyle(
      color: Colors.black.withOpacity(0.6),
      fontSize: 16,
    );
  }
}
