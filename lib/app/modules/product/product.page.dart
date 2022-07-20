// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wafaeats/app/controllers/products/cart.controller.dart';
import 'package:wafaeats/app/core/constants/app.colors.dart';
import 'package:wafaeats/app/core/constants/app.fonts.dart';
import 'package:wafaeats/app/modules/product/product.list.dart';
import 'package:wafaeats/app/modules/product/products.widgets/product.categories.widgets.dart';
import 'package:wafaeats/app/modules/widgets/badges/badge.widget.dart';
import 'package:wafaeats/app/modules/widgets/leading/back.leading.icon.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appBackgroundColor,
          centerTitle: true,
          title: Text(
            'Helpyfood',
            style: getTitleStye(),
          ),
          leading: BackLeadingIcon(),
          actions: [
            Obx(
              () => Badge(
                top: 8,
                right: 8,
                value: CartController.to.products.length.toString(),
                child: IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: appBlackOpacityColor,
                  ),
                  onPressed: () {
                    Get.toNamed("/cart");
                  },
                ),
              ),
            ),
          ],
        ),
        body: ProductPageBody(),
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

class ProductPageBody extends StatefulWidget {
  const ProductPageBody({Key? key}) : super(key: key);

  @override
  State<ProductPageBody> createState() => _ProductPageBodyState();
}

class _ProductPageBodyState extends State<ProductPageBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProductCategories(),
            ProductList(),
          ],
        ),
      ),
    );
  }
}
