// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:wafaeats/app/controllers/products/cart.controller.dart';
import 'package:wafaeats/app/core/constants/app.colors.dart';
import 'package:wafaeats/app/data/models/product/product.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 2, bottom: 2),
      decoration: BoxDecoration(
        color: appContainerBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: (() {
              Get.toNamed(
                "/product-details",
                arguments: {"product": product},
              );
            }),
            child: Container(
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
                  image: AssetImage(product.url),
                  height: 60,
                  width: 60,
                ),
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
                  getName(product.name),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    fontFamily: "RobotoCondensedRegular",
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${product.price} \€',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        fontFamily: "RobotoCondensedRegular",
                      ),
                    ),
                    SizedBox(width: 30),
                    GestureDetector(
                      onTap: (() async {
                        await CartController.to.addProduct(product.id!);
                      }),
                      child: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
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
