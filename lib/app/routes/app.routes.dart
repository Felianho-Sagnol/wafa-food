// ignore_for_file: prefer_const_constructors

import 'package:wafaeats/app/modules/auth/login.signup.page.dart';
import 'package:wafaeats/app/modules/cart/cart.page.dart';
import 'package:wafaeats/app/modules/check/check.page.dart';
import 'package:wafaeats/app/modules/product/product.details.dart';
import 'package:wafaeats/app/modules/product/product.page.dart';
import 'package:wafaeats/app/modules/restaurant/restaurant.all.dart';
import 'package:wafaeats/app/modules/restaurant/restaurant.details.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

var transitionSpeed = 800;

final routes = [
  GetPage(
    name: '/',
    page: () => CheckPage(),
  ),
  GetPage(
    name: '/login',
    page: () => LoginSignupScreen(),
  ),

  GetPage(
    name: '/cart',
    page: () => CartPage(),
    transition: Transition.rightToLeft,
    transitionDuration: Duration(milliseconds: transitionSpeed),
    curve: Curves.fastOutSlowIn,
  ),

  //------------Restaurnats routing--------------------
  GetPage(
    name: '/restaurant-details',
    page: () => RestaurantDetailPage(),
    transition: Transition.rightToLeft,
    transitionDuration: Duration(milliseconds: transitionSpeed),
    curve: Curves.fastOutSlowIn,
  ),
  GetPage(
    name: '/restaurants',
    page: () => AllRestaurantPage(),
    transition: Transition.rightToLeft,
    transitionDuration: Duration(milliseconds: transitionSpeed),
    curve: Curves.fastOutSlowIn,
  ),

  //------------products routing--------------------
  GetPage(
    name: '/product-details',
    page: () => ProductDetailPage(),
    transition: Transition.rightToLeft,
    transitionDuration: Duration(milliseconds: transitionSpeed),
    curve: Curves.fastOutSlowIn,
  ),
  GetPage(
    name: '/products',
    page: () => ProductPage(),
    transition: Transition.rightToLeft,
    transitionDuration: Duration(milliseconds: transitionSpeed),
    curve: Curves.fastOutSlowIn,
  ),
];
