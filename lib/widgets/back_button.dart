import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/theme/colors/light_colors.dart';


class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

 

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'backButton',
        child: GestureDetector(
        onTap: (){
          Navigator.pop(context);
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