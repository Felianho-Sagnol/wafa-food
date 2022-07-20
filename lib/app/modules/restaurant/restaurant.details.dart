// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_string_interpolations, prefer_interpolation_to_compose_strings

import 'package:wafaeats/app/controllers/products/cart.controller.dart';
import 'package:wafaeats/app/core/constants/app.colors.dart';
import 'package:wafaeats/app/core/constants/app.fonts.dart';
import 'package:wafaeats/app/data/models/restaurent/restaurant.model.dart';
import 'package:wafaeats/app/modules/widgets/badges/badge.widget.dart';
import 'package:wafaeats/app/modules/widgets/dialog/detail.dialog.dart';
import 'package:wafaeats/app/modules/widgets/progressindicators/details.indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';

class RestaurantDetailPage extends StatefulWidget {
  const RestaurantDetailPage({Key? key}) : super(key: key);

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  Restaurant? restaurant;
  bool isLoading = true;
  @override
  void initState() {
    print(Get.arguments);
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        restaurant = Get.arguments["restaurant"];
        isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? DetailProgressIndicator()
        : SafeArea(
            child: Scaffold(
              backgroundColor: appPrincipalColor,
              appBar: AppBar(
                elevation: 0,
                centerTitle: true,
                backgroundColor: appPrincipalColor,
                leading: IconButton(
                  icon: Icon(
                    GetPlatform.isAndroid
                        ? Icons.arrow_back
                        : Icons.arrow_back_ios,
                    color: appWhiteBackgroundColor,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                actions: [
                  Obx(
                    () => Badge(
                      top: 8,
                      right: 8,
                      value: CartController.to.products.length.toString(),
                      child: IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: appWhiteBackgroundColor,
                        ),
                        onPressed: () {
                          Get.toNamed("/cart");
                        },
                      ),
                    ),
                  ),
                ],
              ),
              body: Container(
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        restaurant!.imageUrl,
                        height: Get.height * 0.25,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 20,
                          left: 15,
                          right: 15,
                          bottom: 15,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                          ),
                        ),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        //height: 40,
                                        padding: EdgeInsets.only(
                                          top: 15,
                                          bottom: 15,
                                          left: 25,
                                          right: 25,
                                        ),
                                        decoration: BoxDecoration(
                                          color: appPrincipalColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              "${restaurant!.rating} ",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: appPrincipalFont,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Text(
                                                "A partir de ${restaurant!.minPrice} \€",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: appPrincipalFont,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    child: Text(
                                      "${restaurant!.name}",
                                      style: TextStyle(
                                        color: appBlackOpacityColor,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: appPrincipalFont,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    child: restaurant!.description != null
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  text:
                                                      "Bienvenu chez ${restaurant!.name}\n",
                                                  style: TextStyle(
                                                    color: appBlackOpacityColor,
                                                    fontSize: 15,
                                                    fontFamily:
                                                        appPrincipalFont,
                                                  ),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text:
                                                          getTruncatedDescription(
                                                        restaurant!
                                                            .description!,
                                                      ),
                                                      style: TextStyle(
                                                        color:
                                                            appBlackOpacityColor
                                                                .withOpacity(
                                                                    0.4),
                                                        fontSize: 14,
                                                        fontFamily:
                                                            appPrincipalFont,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (canReadMore(
                                                restaurant!.description!,
                                              )) ...[
                                                SizedBox(height: 10),
                                                GestureDetector(
                                                  onTap: () {
                                                    DetailDialog
                                                        .showDetailDialog(
                                                      restaurant!.name,
                                                      restaurant!.description!,
                                                    );
                                                  },
                                                  child: Text(
                                                    "Lire plus",
                                                    style: TextStyle(
                                                      color:
                                                          appBlackOpacityColor,
                                                      fontFamily:
                                                          appPrincipalFont,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ],
                                          )
                                        : Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Bienvenu chez ${restaurant!.name}",
                                                style: TextStyle(
                                                  color: appBlackOpacityColor
                                                      .withOpacity(0.7),
                                                  fontSize: 15,
                                                  fontFamily: appPrincipalFont,
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                "Aucune description pour ce restaurant.",
                                                style: TextStyle(
                                                  color: appBlackOpacityColor
                                                      .withOpacity(0.4),
                                                  fontSize: 14,
                                                  fontFamily: appPrincipalFont,
                                                ),
                                              ),
                                            ],
                                          ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: 5,
                                      bottom: 5,
                                      left: 15,
                                      right: 15,
                                    ),
                                    height: 60,
                                    width: Get.width * 0.43,
                                    decoration: BoxDecoration(
                                      color: HexColor("#F6DDCC"),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 2),
                                        Text(
                                          "Prix",
                                          style: TextStyle(
                                            color: appBlackOpacityColor,
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "4578 \€",
                                          style: TextStyle(
                                            color: appBlackOpacityColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (() {
                                      Get.toNamed("/products");
                                    }),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        top: 5,
                                        bottom: 5,
                                        left: 20,
                                        right: 20,
                                      ),
                                      height: 60,
                                      width: Get.width * 0.43,
                                      decoration: BoxDecoration(
                                        color: appPrincipalColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Row(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.shopping_cart,
                                            color: HexColor("#AB734C"),
                                            size: 24,
                                          ),
                                          SizedBox(width: 20),
                                          Text(
                                            "La Carte",
                                            style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.7),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              fontFamily: appPrincipalFont,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }

  String getTruncatedDescription(String description) {
    String truncatedDescription = description;
    int defaultLength = 200 - ("Bienvenu chez resto\n").length;
    if (description.length > defaultLength) {
      truncatedDescription = description.substring(0, defaultLength) + "...";
    }

    return truncatedDescription;
  }

  bool canReadMore(String description) {
    bool canReadMore = false;
    int defaultLength = 200 - ("Bienvenu chez resto\n").length;
    if (description.length > defaultLength) {
      canReadMore = true;
    }

    return canReadMore;
  }
}
