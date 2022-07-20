// ignore_for_file: prefer_const_constructors

import 'package:wafaeats/app/core/constants/app.colors.dart';
import 'package:wafaeats/app/core/constants/app.constants.dart';
import 'package:wafaeats/app/core/constants/app.fonts.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class RestaurantAllSearchWidget extends StatelessWidget {
  RestaurantAllSearchWidget({Key? key}) : super(key: key);
  final queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: appContainerBackgroundColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: ksecondaryColor.withOpacity(0.32),
          //color: appContainerBackgroundColor,
        ),
      ),
      child: TextField(
          controller: queryController,
          cursorColor: ksecondaryColor,
          decoration: InputDecoration(
            border: InputBorder.none,
            icon: IconButton(
              icon: Icon(Icons.search, color: HexColor("#AB734C")),
              onPressed: () {
                print(queryController.text);
              },
            ),
            hintText: "Rechercher ici ...",
            hintStyle: TextStyle(
              color: ksecondaryColor,
              fontFamily: appPrincipalFont,
            ),
          ),
          onChanged: (va) {
            print(va);
          }),
    );
  }
}
