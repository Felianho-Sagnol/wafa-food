import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wafaeats/app/bindings/app.binding.dart';
import 'package:wafaeats/app/routes/app.routes.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'HelpyFood',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        //primarySwatch: Colors.white,
      ),
      initialRoute: '/',
      getPages: routes,
      initialBinding: AppBinding(),
    );
  }
}
