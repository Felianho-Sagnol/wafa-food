// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wafaeats/app/controllers/products/cart.controller.dart';
import 'package:wafaeats/app/core/constants/app.colors.dart';
import 'package:wafaeats/app/core/constants/app.fonts.dart';
import 'package:wafaeats/app/modules/widgets/dialog/discount.dialog.dart';
import 'package:wafaeats/app/modules/widgets/leading/back.leading.icon.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: AppBar(
          backgroundColor: appBackgroundColor,
          centerTitle: true,
          title: Text(
            'Votre Panier',
            style: getTitleStye(),
          ),
          leading: BackLeadingIcon(),
        ),
        bottomNavigationBar: CartController.to.products.isEmpty
            ? null
            : Container(
                height: 250,
                padding:
                    EdgeInsets.only(right: 30, left: 30, top: 15, bottom: 15),
                decoration: BoxDecoration(
                  color: appContainerBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    BottomElementItem(
                      description: "Sous Total",
                      value: "${CartController.to.totalPrice.value} \€",
                    ),
                    BottomElementItem(
                      description: "Coupon",
                      value: "- ${CartController.to.totalPrice.value} \€",
                    ),
                    BottomElementItem(
                      description: "Frais de gestion",
                      value: "${CartController.to.totalPrice.value} \€",
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 5),
                      child: Divider(
                        thickness: 1,
                        color: appBlackOpacityColor,
                      ),
                    ),
                    BottomElementItem(
                      description: "Total",
                      value: "${CartController.to.totalPrice.value} \€",
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: CheckoutButton(),
                    ),
                  ],
                ),
              ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: CartController.to.products.isEmpty
              ? EmptyCart()
              : ListView(
                  children: [
                    for (var item in CartController.to.products.values)
                      CartElementItem(
                        cartItem: item,
                      ),
                    DiscountContainer(),
                  ],
                ),
        ),
      ),
    );
  }

  TextStyle getTitleStye() {
    return TextStyle(
      color: Colors.black.withOpacity(0.7),
      fontSize: 15,
      fontFamily: appPrincipalFont,
    );
  }
}

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(
          top: 5,
          bottom: 5,
        ),
        height: 60,
        decoration: BoxDecoration(
          color: appPrincipalColor,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Valider",
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 17,
                fontWeight: FontWeight.bold,
                fontFamily: appPrincipalFont,
              ),
            ),
            SizedBox(width: 20),
            Icon(
              Icons.arrow_forward,
              color: Colors.white.withOpacity(0.8),
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomElementItem extends StatelessWidget {
  const BottomElementItem({
    Key? key,
    required this.description,
    required this.value,
  }) : super(key: key);
  final String description;
  final String value;

  final double bottomContainerItemPaddingTop = 8;
  final double bottomContainerTextSize = 14;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: bottomContainerItemPaddingTop,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              description,
              style: TextStyle(
                fontSize: bottomContainerTextSize,
                color: appBlackOpacityColor.withOpacity(0.5),
                fontWeight: FontWeight.bold,
                fontFamily: appPrincipalFont,
              ),
            ),
          ),
          Container(
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: bottomContainerTextSize,
                    fontWeight: FontWeight.bold,
                    color: appBlackOpacityColor.withOpacity(0.5),
                    fontFamily: appPrincipalFont,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DiscountContainer extends StatelessWidget {
  const DiscountContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DiscountDialog().showDiscountDialog();
      },
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 10, right: 10),
        height: 70,
        decoration: BoxDecoration(
          color: appContainerBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.discount,
                color: appSecondaryColor,
              ),
              SizedBox(width: 20),
              Text(
                "Avez-vous un coupon ?",
                style: TextStyle(
                  color: appBlackOpacityColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartElementItem extends StatelessWidget {
  const CartElementItem({
    Key? key,
    required this.cartItem,
  }) : super(key: key);
  final dynamic cartItem;

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
                arguments: {"product": cartItem['product']},
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
                  image: AssetImage(cartItem['product'].url),
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
                  getName(cartItem['product'].name),
                  style: TextStyle(
                    fontFamily: appPrincipalFont,
                  ),
                  softWrap: false,
                  overflow: TextOverflow.fade,
                ),
                SizedBox(height: 5),
                Text(
                  '${cartItem['product'].price}  \€',
                  style: TextStyle(
                    color: appBlackOpacityColor,
                    fontFamily: appPrincipalFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        CartController.to.deleteProduct(cartItem['product'].id);
                      },
                      child: Container(
                        color: appSecondaryColor,
                        padding: EdgeInsets.all(1),
                        height: 24,
                        width: 30,
                        child: Icon(
                          Icons.remove,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "${cartItem['quantity']}",
                      style: TextStyle(
                        color: appBlackOpacityColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: appPrincipalFont,
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: (() {
                        CartController.to.addProduct(cartItem['product'].id);
                      }),
                      child: Container(
                        color: appSecondaryColor,
                        padding: EdgeInsets.all(1),
                        height: 24,
                        width: 30,
                        child: Icon(
                          Icons.add,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
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

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100),
          Text(
            "Votre panier est encore vide",
            style: TextStyle(
              fontSize: 17,
              color: appBlackOpacityColor,
              fontWeight: FontWeight.bold,
              fontFamily: appPrincipalFont,
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 25, right: 25),
            child: GestureDetector(
              onTap: () {
                Get.offAllNamed("/products");
              },
              child: Container(
                decoration: BoxDecoration(
                  color: appPrincipalColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(width: 20),
                      Icon(
                        Icons.shopping_cart,
                        size: 20,
                        color: Colors.white.withOpacity(0.7),
                      ),
                      Text(
                        "Ajouter des produits",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: appPrincipalFont,
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
