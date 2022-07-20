// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:wafaeats/app/controllers/categories.controller.dart';
import 'package:wafaeats/app/modules/home/home.widgets/categories/home.categories.items.dart';

final double spaceBetweenCategoriesItem = 15;

bool getIsActive(int id) {
  return CategoriesController.to.currentSelectedId.value == id;
}

final categoriesItems = <Widget>[
  CategoryItem(
    id: 0,
    title: "Burger",
    url: "assets/images/burger.png",
    isActive: getIsActive(0),
  ),
  CategoryItem(
    id: 1,
    title: "Salade & Fruites",
    url: "assets/test_images/salad.png",
    isActive: getIsActive(1),
  ),
  CategoryItem(
    id: 2,
    title: "Menus",
    url: "assets/test_images/burger.png",
    isActive: getIsActive(2),
  ),
  CategoryItem(
    id: 3,
    title: "Boisons",
    url: "assets/test_images/salad.png",
    isActive: getIsActive(3),
  ),
];

final categories2Items = <Widget>[
  CategoryItem2(
    id: 0,
    title: "Burger",
    url: "assets/images/burger.png",
    isActive: getIsActive(0),
  ),
  SizedBox(width: spaceBetweenCategoriesItem),
  CategoryItem2(
    id: 1,
    title: "Salade & Fruites",
    url: "assets/test_images/salad.png",
    isActive: getIsActive(1),
  ),
  SizedBox(width: spaceBetweenCategoriesItem),
  CategoryItem2(
    id: 2,
    title: "Menus",
    url: "assets/test_images/burger.png",
    isActive: getIsActive(2),
  ),
];
