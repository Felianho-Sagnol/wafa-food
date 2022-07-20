// ignore_for_file: prefer_const_constructors, deprecated_member_use, must_call_super
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final items = [
//     Icon(Icons.home, size: 20),
//     Icon(Icons.search, size: 20),
//     Icon(Icons.favorite, size: 20),
//     Icon(Icons.settings, size: 20),
//     Icon(Icons.person, size: 20),
//   ];

//   bool isChecking = true;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: false, //to avoid ios app bottom tab bar to hide our tab
//       child: Scaffold(
//         extendBody: true,
//         body: Obx(() => pages[CurvNavController.to.currentIndex.value]),
//         bottomNavigationBar: Theme(
//           data: Theme.of(context).copyWith(
//             iconTheme: IconThemeData(color: Colors.white),
//           ),
//           child: CurvedNavigationBar(
//             height: 52,
//             index: CurvNavController.to.currentIndex.value,
//             items: items,
//             backgroundColor: Colors.transparent,
//             color: Colors.green,
//             buttonBackgroundColor: Colors.red,
//             onTap: (index) {
//               if (index == 4) {
//                 CurvNavController.to.previousIndex.value =
//                     CurvNavController.to.currentIndex.value;
//                 //CurvNavController.to.currentIndex.value = index;

//                 Get.offAllNamed("/login");
//               } else {
//                 CurvNavController.to.currentIndex.value = index;
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//   }
// }
