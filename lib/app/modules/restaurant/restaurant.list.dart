// ignore_for_file: unused_local_variable, prefer_const_constructors, avoid_unnecessary_containers

import 'package:wafaeats/app/controllers/restaurant/restaurant.controller.dart';
import 'package:wafaeats/app/data/models/restaurent/restaurant.model.dart';
import 'package:wafaeats/app/modules/restaurant/restaurant.item.dart';
import 'package:flutter/material.dart';

class RestaurantList extends StatefulWidget {
  RestaurantList({Key? key, required this.restaurants}) : super(key: key);
  List<Restaurant> restaurants;

  @override
  State<RestaurantList> createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var restaurant in RestaurantController.to.restaurants)
          RestaurantItem(
            restaurant: restaurant,
          ),
      ],
    );
  }
}
