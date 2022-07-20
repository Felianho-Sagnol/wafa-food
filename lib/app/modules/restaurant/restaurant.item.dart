// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:wafaeats/app/core/constants/app.colors.dart';
import 'package:wafaeats/app/data/models/restaurent/restaurant.model.dart';
import 'package:wafaeats/app/modules/widgets/rating/app.rating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantItem extends StatelessWidget {
  const RestaurantItem({Key? key, required this.restaurant}) : super(key: key);
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Get.toNamed(
          "/restaurant-details",
          arguments: {"restaurant": restaurant},
        );
      }),
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 2, bottom: 2),
        decoration: BoxDecoration(
          color: appContainerBackgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: appPrincipalColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image(
                  image: AssetImage(restaurant.imageUrl),
                  height: 60,
                  width: 60,
                ),
              ),
            ),
            SizedBox(width: 15),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    getName(restaurant.name),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppRating(
                        rating: restaurant.rating,
                        size: 18,
                      ),
                      SizedBox(width: 30),
                      Text(
                        '${restaurant.minPrice} \€',
                        style: TextStyle(
                          color: appBlackOpacityColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: "RobotoCondensedRegular",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    '${restaurant.distance} km',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontSize: 17,
                      fontFamily: "RobotoCondensedRegular",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getName(String name) {
    String str = name;

    if (name.length > 30) {
      str = name.substring(0, 30) + "...";
    }

    return str;
  }
}
