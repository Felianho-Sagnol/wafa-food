import 'package:flutter/material.dart';
import 'package:wafaeats/app/controllers/products/product.controller.dart';

final favoritesItems = <Widget>[
  for (var p in ProductController.to.favorites) Text("Hello"),
];
