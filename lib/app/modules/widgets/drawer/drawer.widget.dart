// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:wafaeats/app/modules/widgets/drawer/drawer.content.widget.dart';
import 'package:wafaeats/app/modules/widgets/drawer/drawer.header.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              DrawerHeaderWidget(),
              DrawerContentWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
