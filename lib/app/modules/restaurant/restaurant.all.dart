// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:wafaeats/app/controllers/restaurant/restaurant.controller.dart';
import 'package:wafaeats/app/core/constants/app.colors.dart';
import 'package:wafaeats/app/core/constants/app.constants.dart';
import 'package:wafaeats/app/core/constants/app.fonts.dart';
import 'package:wafaeats/app/data/models/restaurent/restaurant.model.dart';
import 'package:wafaeats/app/modules/restaurant/restaurant.item.dart';
import 'package:wafaeats/app/modules/restaurant/restaurant.list.dart';
import 'package:wafaeats/app/modules/restaurant/restaurant.widgets/all.widgets/restaurant.all.search.widget.dart';
import 'package:wafaeats/app/modules/widgets/leading/back.leading.icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class AllRestaurantPage extends StatefulWidget {
  const AllRestaurantPage({Key? key}) : super(key: key);

  @override
  State<AllRestaurantPage> createState() => _AllRestaurantPageState();
}

class _AllRestaurantPageState extends State<AllRestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: AppBar(
          backgroundColor: appBackgroundColor,
          centerTitle: true,
          title: Text(
            'Tous nos resaurants',
            style: getTitleStye(),
          ),
          leading: BackLeadingIcon(),
        ),
        body: AllRestaurantBody(),
      ),
    );
  }

  TextStyle getTitleStye() {
    return TextStyle(
      color: appBlackOpacityColor,
      fontSize: 15,
      fontFamily: appPrincipalFont,
    );
  }
}

class AllRestaurantBody extends StatefulWidget {
  const AllRestaurantBody({Key? key}) : super(key: key);

  @override
  State<AllRestaurantBody> createState() => _AllRestaurantBodyState();
}

class _AllRestaurantBodyState extends State<AllRestaurantBody> {
  final queryController = TextEditingController();
  List<Restaurant> restaurants = [];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            searchWidget(),
            resultWidget(),
            for (var restaurant in restaurants)
              RestaurantItem(
                restaurant: restaurant,
              ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    restaurants = RestaurantController.to.restaurants;
    super.initState();
  }

  Widget searchWidget() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: appContainerBackgroundColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: ksecondaryColor.withOpacity(0.32),
        ),
      ),
      child: TextField(
          controller: queryController,
          cursorColor: ksecondaryColor,
          decoration: InputDecoration(
            border: InputBorder.none,
            icon: IconButton(
              icon: Icon(Icons.search, color: HexColor("#AB734C")),
              onPressed: () {},
            ),
            hintText: "Rechercher ici ...",
            hintStyle: TextStyle(
              color: ksecondaryColor,
              fontFamily: appPrincipalFont,
            ),
          ),
          onChanged: (value) {
            if (value.isEmpty) {
              setState(() {
                restaurants = RestaurantController.to.restaurants;
              });
            } else {
              setState(() {
                restaurants =
                    RestaurantController.to.getSearchedRestaurants(value);
              });
            }
            print(restaurants.length);
          }),
    );
  }

  Widget resultWidget() {
    return Center(
      child: Container(
        padding: EdgeInsets.only(
          top: 15,
          bottom: 20,
        ),
        child: Text(
          restaurants.isEmpty
              ? "Aucun restaurant disponible."
              : "${restaurants.length} restaurant" +
                  ((restaurants.length == 1) ? "" : "s") +
                  " disponible" +
                  ((restaurants.length == 1) ? "" : "s") +
                  " .",
          style: TextStyle(
            color: appBlackOpacityColor,
            fontFamily: appPrincipalFont,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
