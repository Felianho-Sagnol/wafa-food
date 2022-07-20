// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wafaeats/app/controllers/products/product.controller.dart';
import 'package:wafaeats/app/core/constants/app.colors.dart';
import 'package:wafaeats/app/core/constants/app.fonts.dart';
import 'package:wafaeats/app/data/models/product/product.model.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
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
            //fontWeight: FontWeight.bold,
            color: appBlackOpacityColor,
            fontFamily: appPrincipalFont,
          ),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (Product product in ProductController.to.favorites)
                FavoriteItem(
                  product: product,
                ),
            ],
          ),
        )
      ],
    );
  }
}

class FavoriteItem extends StatelessWidget {
  FavoriteItem({Key? key, required this.product}) : super(key: key);
  Product product;

  double width = Get.width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Get.toNamed(
          "/details",
          arguments: {"product": product},
        );
      }),
      child: Container(
        padding: EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
        margin: EdgeInsets.only(right: 10),
        width: width * 0.45,
        constraints: BoxConstraints(minHeight: 230),
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
                  image: AssetImage(product.url),
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              product.name,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 13,
                fontFamily: appPrincipalFont,
              ),
            ),
            SizedBox(height: 20),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.grade,
                      color: Colors.orange,
                      size: 15,
                    ),
                    Icon(
                      Icons.grade,
                      color: Colors.orange,
                      size: 15,
                    ),
                    Icon(
                      color: Colors.orange,
                      Icons.grade,
                      size: 15,
                    ),
                    Icon(
                      color: Colors.orange,
                      Icons.grade,
                      size: 15,
                    ),
                    Icon(
                      Icons.star_border,
                      size: 15,
                      color: Colors.orange,
                    ),
                  ],
                ),
                Text(
                  "${product.price} \€",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                    fontFamily: appPrincipalFont,
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
