// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:wafaeats/app/controllers/restaurant/restaurant.controller.dart';
import 'package:wafaeats/app/core/constants/app.colors.dart';
import 'package:wafaeats/app/data/models/restaurent/restaurant.model.dart';
import 'package:wafaeats/app/modules/widgets/rating/app.rating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantPopularWidget extends StatefulWidget {
  const RestaurantPopularWidget({Key? key}) : super(key: key);

  @override
  State<RestaurantPopularWidget> createState() =>
      _RestaurantPopularWidgetState();
}

class _RestaurantPopularWidgetState extends State<RestaurantPopularWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          "Populaires",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: appBlackOpacityColor,
            fontFamily: "RobotoCondensedRegular",
          ),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (Restaurant restaurant
                  in RestaurantController.to.getPopularRestaurants())
                RestaurantPopularItem(
                  restaurant: restaurant,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class RestaurantPopularItem extends StatelessWidget {
  RestaurantPopularItem({Key? key, required this.restaurant}) : super(key: key);
  Restaurant restaurant;

  double width = Get.width;

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
        padding: EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
        margin: EdgeInsets.only(right: 10),
        width: width * 0.45,
        constraints: BoxConstraints(minHeight: 220),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 20,
              color: Color(0xFFB0CCE1).withOpacity(0.32),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image(
                  image: AssetImage(restaurant.imageUrl),
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              restaurant.name,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 13,
                fontFamily: "RobotoCondensedRegular",
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppRating(
                  rating: restaurant.rating,
                ),
                Text(
                  "${restaurant.minPrice} \€",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                    fontFamily: "RobotoCondensedRegular",
                  ),
                ),
              ],
            )
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
