// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:wafaeats/app/controllers/products/cart.controller.dart';
import 'package:wafaeats/app/core/constants/app.colors.dart';
import 'package:wafaeats/app/core/constants/app.fonts.dart';
import 'package:wafaeats/app/data/models/product/product.model.dart';
import 'package:wafaeats/app/modules/widgets/badges/badge.widget.dart';
import 'package:wafaeats/app/modules/widgets/dialog/detail.dialog.dart';
import 'package:wafaeats/app/modules/widgets/progressindicators/details.indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Product? product;
  bool isLoading = true;
  double iconContainerPadding = 5;
  int quantity = 0;
  @override
  void initState() {
    print(Get.arguments);
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        product = Get.arguments["product"];
        quantity = CartController.to.getProductQuantity(product!.id!);
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
                        product!.url,
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
                                              "${product!.rating} ",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: appPrincipalFont,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (quantity != 0)
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap: (() {
                                                CartController.to
                                                    .modifyProductAndGetQuantity(
                                                  product!.id!,
                                                  action: 2,
                                                )
                                                    .then((value) {
                                                  setState(() {
                                                    quantity = value;
                                                  });
                                                });
                                              }),
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                  top: iconContainerPadding,
                                                  bottom: iconContainerPadding,
                                                  left: iconContainerPadding,
                                                  right: iconContainerPadding,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: appPrincipalColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(100),
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.remove_circle,
                                                      color: Colors.amber,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              "${quantity}",
                                              style: TextStyle(
                                                color: appBlackOpacityColor,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: appPrincipalFont,
                                                fontSize: 18,
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            GestureDetector(
                                              onTap: (() async {
                                                CartController.to
                                                    .modifyProductAndGetQuantity(
                                                  product!.id!,
                                                )
                                                    .then((value) {
                                                  setState(() {
                                                    quantity = value;
                                                  });
                                                });
                                              }),
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                  top: iconContainerPadding,
                                                  bottom: iconContainerPadding,
                                                  left: iconContainerPadding,
                                                  right: iconContainerPadding,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: appPrincipalColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(100),
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.add_circle,
                                                      color: Colors.amber,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (quantity == 0)
                                        GestureDetector(
                                          onTap: (() async {
                                            await CartController.to.addProduct(
                                              product!.id!,
                                            );
                                            setState(() {
                                              quantity = 1;
                                            });
                                          }),
                                          child: Container(
                                            padding: EdgeInsets.only(
                                              // top: 10,
                                              // bottom: 10,
                                              // left: 10,
                                              // right: 10,
                                              top: iconContainerPadding + 2,
                                              bottom: iconContainerPadding + 2,
                                              left: iconContainerPadding + 2,
                                              right: iconContainerPadding + 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: appPrincipalColor,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(100),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.add_shopping_cart,
                                                  color: Colors.amber,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    child: Text(
                                      "${product!.name}",
                                      style: TextStyle(
                                        color: appBlackOpacityColor,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: appPrincipalFont,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: product!.description != null
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text:
                                                          getTruncatedDescription(
                                                        product!.description!,
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
                                                product!.description!,
                                              )) ...[
                                                SizedBox(height: 5),
                                                GestureDetector(
                                                  onTap: () {
                                                    DetailDialog
                                                        .showDetailDialog(
                                                      product!.name,
                                                      product!.description!,
                                                      type: 2,
                                                    );
                                                  },
                                                  child: Text(
                                                    "Lire plus",
                                                    style: TextStyle(
                                                      color: Colors.red
                                                          .withOpacity(0.5),
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
                                                "Aucune description pour ce produit.",
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(), //to keep the ingredient text at the start
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: "Ingredients",
                                            style: TextStyle(
                                              color: appBlackOpacityColor
                                                  .withOpacity(0.7),
                                              fontSize: 15,
                                              fontFamily: appPrincipalFont,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding: const EdgeInsets.only(),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      for (int i = 0; i < 5; i++)
                                        IngredientWidget(
                                          product: product!,
                                        ),
                                    ],
                                  ),
                                ),
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
                                          "${product!.price} \€",
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
                                      Get.toNamed("/cart");
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
    int defaultLength = 50;
    if (description.length > defaultLength) {
      truncatedDescription = description.substring(0, defaultLength) + "...";
    }

    return truncatedDescription;
  }

  bool canReadMore(String description) {
    bool canReadMore = false;
    int defaultLength = 50;
    if (description.length > defaultLength) {
      canReadMore = true;
    }

    return canReadMore;
  }
}

class IngredientWidget extends StatelessWidget {
  IngredientWidget({Key? key, required this.product}) : super(key: key);
  Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {}),
      child: Container(
        margin: EdgeInsets.only(right: 5),
        width: Get.width * 0.25,
        decoration: BoxDecoration(
          color: HexColor("#EBEDEF"),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
            padding: EdgeInsets.only(top: 5, right: 5, left: 5, bottom: 8),
            child: Column(
              children: [
                Image(
                  image: AssetImage(product.url),
                  height: 60,
                  width: 70,
                ),
                Icon(
                  Icons.add_circle,
                  size: 20,
                ),
              ],
            )),
      ),
    );
  }
}
