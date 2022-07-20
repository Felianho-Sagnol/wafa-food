// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:wafaeats/app/controllers/restaurant/restaurant.controller.dart';
import 'package:wafaeats/app/modules/home/home.widgets/categories/home.categories.dart';
import 'package:wafaeats/app/modules/home/home.widgets/search/search.widget.dart';
import 'package:wafaeats/app/modules/restaurant/popularswidgets/restaurant.popular.widget.dart';
import 'package:wafaeats/app/modules/restaurant/restaurant.list.dart';
import 'package:wafaeats/app/modules/restaurant/restaurant.widgets/restaurant.morebaner.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SearchWidget(),
            Categories(),
            RestaurantPopularWidget(),
            SizedBox(height: 25),
            MoreRestaurantBaner(),
            SizedBox(height: 20),
            RestaurantList(
              restaurants: RestaurantController.to.restaurants,
            ),
          ],
        ),
      ),
    );
  }
}
