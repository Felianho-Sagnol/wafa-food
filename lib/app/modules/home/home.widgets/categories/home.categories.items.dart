// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wafaeats/app/controllers/categories.controller.dart';
import 'package:wafaeats/app/core/constants/app.colors.dart';
import 'package:wafaeats/app/core/constants/app.fonts.dart';

class CategoryItem extends StatefulWidget {
  CategoryItem({
    required this.id,
    required this.title,
    required this.url,
    this.isActive = false,
  });
  int id;
  bool isActive;
  String title;
  String url;

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          setState(() {
            CategoriesController.to.currentSelectedId.value = widget.id;
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
                  backgroundImage: AssetImage(widget.url),
                  radius: 220,
                ),
              ),
              SizedBox(width: 10),
              Text(
                widget.title,
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
      color:
          getIsActive() ? HexColor("#AB734C") : Colors.black.withOpacity(0.7),
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle getTextStyle() {
    return TextStyle(
      color: getIsActive() ? Colors.white : Colors.black.withOpacity(0.7),
      fontWeight: FontWeight.bold,
    );
  }

  bool getIsActive() {
    return CategoriesController.to.currentSelectedId.value == widget.id;
  }
}

class CategoryItem2 extends StatefulWidget {
  CategoryItem2({
    required this.id,
    required this.title,
    required this.url,
    this.isActive = false,
  });
  int id;
  bool isActive;
  String title;
  String url;

  @override
  State<CategoryItem2> createState() => _CategoryItem2State();
}

class _CategoryItem2State extends State<CategoryItem2> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          setState(() {
            print(CategoriesController.to.currentSelectedId.value);
            CategoriesController.to.currentSelectedId.value = widget.id;
          });
        },
        child: Padding(
          padding: EdgeInsets.only(top: 1, left: 20, right: 15),
          child: Container(
            child: Column(
              children: [
                Image.asset(
                  widget.url,
                  height: 40,
                  width: 40,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    color: getIsActive()
                        ? HexColor("#AB734C")
                        : HexColor("#F3EFEB"),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color:
                          getIsActive() ? Colors.white : appBlackOpacityColor,
                      fontFamily: appPrincipalFont,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool getIsActive() {
    return CategoriesController.to.currentSelectedId.value == widget.id;
  }
}
