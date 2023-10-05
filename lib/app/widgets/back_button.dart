import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/app/theme/colors/light_colors.dart';
import 'package:get/get.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: true,
      tag: 'backButton',
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: LightColors.kDarkBlue,
          ),
        ),
      ),
    );
  }
}
