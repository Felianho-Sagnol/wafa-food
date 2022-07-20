// ignore_for_file: prefer_const_constructors, dead_code, use_key_in_widget_constructors, must_be_immutable, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:wafaeats/app/core/constants/categories.items.list.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          //children: categories2Items,
          children: categoriesItems,
        ),
      ),
    );
  }
}
