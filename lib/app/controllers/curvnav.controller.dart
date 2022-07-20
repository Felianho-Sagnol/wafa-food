import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CurvNavController extends GetxController {
  static CurvNavController get to => Get.find();
  var currentIndex = 0.obs;
  var previousIndex = 0.obs;

  final curvKey = GlobalKey<CurvedNavigationBarState>();
}

/*
to programaticaly change the tab selected item , we use the Key,
in some function , 
final navigationState = curvKey.currentState!;
then navigationState.setPage(index);

youtube video : https://www.youtube.com/watch?v=TX2x41h47fE
*/