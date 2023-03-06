import 'package:flutter/material.dart';
import 'package:assign_1/screens/package_resources/package_resources.dart';

/*
View design widget used  in 3 different screen 1.as splash screen 2.as Login screen 3. as Create account screen, we give
hero animation to widget also
*/


class ViewDesign extends StatelessWidget {
  final String label;
  final int height;
  const ViewDesign({
    super.key,
    required this.label,
    required this.height,
  });
  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: true,
      tag: "name",
      child: Container(
        height: height.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                GradientColorManager.g1Color,
                GradientColorManager.g2Color
              ]),
          borderRadius: BorderRadius.only(
              bottomRight: const Radius.circular(30).w,
              bottomLeft: const Radius.circular(30))
              .w,
        ),
        child: Center(
          child: Text(
            label,
            style:
            fontSizeFamilyColorTextStyle(33.sp, "Orbitron", GradientColorManager.g3Color),
          ),
        ),
      ),
    );
  }
}