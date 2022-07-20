import 'package:wafaeats/app/core/constants/app.colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackLeadingIcon extends StatelessWidget {
  const BackLeadingIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        GetPlatform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
        color: appBlackOpacityColor,
      ),
      onPressed: () {
        Get.back();
      },
    );
  }
}
