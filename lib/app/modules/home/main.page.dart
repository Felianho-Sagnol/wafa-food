// ignore_for_file: prefer_const_constructors, deprecated_member_use, must_call_super, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wafaeats/app/controllers/bottom.nav.controller.dart';
import 'package:wafaeats/app/core/constants/app.bottomnavitems.dart';
import 'package:wafaeats/app/core/constants/app.colors.dart';
import 'package:wafaeats/app/core/constants/app.pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isChecking = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false, //to avoid ios app bottom tab bar to hide our tab
      child: Scaffold(
        extendBody: true,
        body: Obx(() => pages[BottomNavController.to.currentIndex.value]),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: appBlackOpacityColor,
          unselectedItemColor: Colors.grey.withOpacity(0.4),
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: bottomNavItems,
          currentIndex: BottomNavController.to.currentIndex.value,
          onTap: onTap,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          type: BottomNavigationBarType.fixed, //to show the background color
          backgroundColor: appBackgroundColor,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void onTap(int index) {
    setState(() {
      BottomNavController.to.currentIndex.value = index;
    });
  }
}
