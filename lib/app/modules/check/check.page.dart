// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wafaeats/app/modules/home/main.page.dart';

class CheckPage extends StatelessWidget {
  const CheckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return !AuthService.isLoggedIn() ? LoginSignupScreen() : HomePage();
    return MainPage();
  }
}
