import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/app/theme/colors/light_colors.dart';

class TopContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final EdgeInsets? padding;
  final bool? redondo;
  const TopContainer(
      {super.key,
      this.height,
      this.width,
      this.redondo = true,
      this.child,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
      decoration: BoxDecoration(
        color: LightColors.kDarkYellow,
        borderRadius: redondo == true
            ? const BorderRadius.only(
                bottomRight: Radius.circular(40.0),
                bottomLeft: Radius.circular(40.0),
              )
            : BorderRadius.zero,
      ),
      height: height,
      width: width,
      child: child,
    );
  }
}
