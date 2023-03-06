import 'package:flutter/material.dart';
import 'package:assign_1/screens/package_resources/package_resources.dart';
/*
Card Template widget, used to get the print of card back side and front side of a card which provides by user
*/
class CardTemplate extends StatelessWidget {
  final String label;
  final IconData icons;

  const CardTemplate({super.key, required this.label, required this.icons});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DottedBorder(
          color: Colors.black,
          radius: const Radius.circular(20),
          strokeWidth: 1,
          dashPattern: const [
            2,
            4,
          ],
          child: SizedBox(
            height: 73,
            width: 124,
            child: Center(
                child: Icon(
                  icons,
                  size: 50,
                )),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: fontSizeWeightColorTextStyle(
              15.0, FontWeightManager.superBold, ColorManager.green),
        ),
      ],
    );
  }
}