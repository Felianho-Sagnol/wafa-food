// ignore_for_file: prefer_const_constructors

import 'package:wafaeats/app/core/constants/app.colors.dart';
import 'package:flutter/material.dart';

class DetailProgressIndicator extends StatelessWidget {
  const DetailProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appBackgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 20),
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey,
                  color: appPrincipalColor,
                  // strokeWidth: 10,
                  strokeWidth: 5,
                ),
              ),
              // SizedBox(height: 25),
              // Text(
              //   "Chargement ...",
              //   style: TextStyle(
              //     fontFamily: appPrincipalFont,
              //     color: appBlackOpacityColor,
              //     fontWeight: FontWeight.bold,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
