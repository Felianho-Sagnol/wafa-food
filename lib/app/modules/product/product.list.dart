// ignore_for_file: unused_local_variable, prefer_const_constructors


import 'package:flutter/widgets.dart';
import 'package:wafaeats/app/controllers/products/product.controller.dart';
import 'package:wafaeats/app/modules/product/product.item.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        for (var product in ProductController.to.products)
          ProductItem(
            product: product,
          ),
      ],
    );
  }
}
