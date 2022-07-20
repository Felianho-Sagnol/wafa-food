// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors


import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wafaeats/app/core/constants/app.colors.dart';
import 'package:wafaeats/app/modules/home/home.widgets/home.content/home.appbar.dart';
import 'package:wafaeats/app/modules/home/home.widgets/home.content/home.body.dart';
import 'package:wafaeats/app/modules/widgets/drawer/drawer.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChecking = true;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: appBackgroundColor,
        appBar: homeAppBar(context, scaffoldKey),
        body: HomeBody(),
        drawer: DrawerWidget(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
