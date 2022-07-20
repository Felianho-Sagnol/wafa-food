// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:wafaeats/app/controllers/categories.controller.dart';
import 'package:wafaeats/app/controllers/products/product.controller.dart';
import 'package:wafaeats/app/core/constants/app.colors.dart';
import 'package:wafaeats/app/data/models/product/product.category.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class ProductCategoryItem extends StatefulWidget {
  ProductCategoryItem({
    required this.category,
  });
  ProductCategory category;

  @override
  State<ProductCategoryItem> createState() => _ProductCategoryItemState();
}

class _ProductCategoryItemState extends State<ProductCategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          setState(() {
            CategoriesController.to.currentSelectedId.value =
                widget.category.id!;
          });
        },
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 1, bottom: 1),
          margin: EdgeInsets.only(right: 10),
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: getIsActive()
                ? HexColor("#AB734C")
                : Colors.white.withOpacity(0.6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                height: 35,
                width: 35,
                child: CircleAvatar(
                  backgroundImage: AssetImage(widget.category.imageurl),
                  radius: 220,
                ),
              ),
              SizedBox(width: 10),
              Text(
                widget.category.title,
                style: getTextStyle(),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextStyle getStyle() {
    return TextStyle(
      color: getIsActive() ? HexColor("#AB734C") : appBlackOpacityColor,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle getTextStyle() {
    return TextStyle(
      color: getIsActive() ? Colors.white : appBlackOpacityColor,
      fontWeight: FontWeight.bold,
    );
  }

  bool getIsActive() {
    return CategoriesController.to.currentSelectedId.value ==
        widget.category.id!;
  }
}

class ProductCategories extends StatelessWidget {
  const ProductCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          //children: categories2Items,
          children: [
            for (ProductCategory category in ProductController.to.categories)
              ProductCategoryItem(
                category: category,
              )
          ],
        ),
      ),
    );
  }
}
