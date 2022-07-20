import 'package:wafaeats/app/core/constants/app.colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class MoreRestaurantBaner extends StatelessWidget {
  const MoreRestaurantBaner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Plus de restaurants",
            style: TextStyle(
              color: appBlackOpacityColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "RobotoCondensedRegular",
            ),
          ),
          GestureDetector(
            onTap: (() {
              Get.toNamed(
                "/restaurants",
              );
            }),
            child: Text(
              "Tout voir",
              style: TextStyle(
                color: HexColor("#AB734C"),
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: "RobotoCondensedRegular",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
