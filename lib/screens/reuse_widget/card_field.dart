import 'package:flutter/material.dart';
import 'package:assign_1/screens/package_resources/package_resources.dart';

/*
Card From Field Widget, we use to get data of the card from user input and its reuse in edit button in pop menu we used this
widget for Edit and insert data
*/
class CardFromField extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const CardFromField(
      {super.key, required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10).r,
      padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5).r,
      decoration: BoxDecoration(
          border: Border.all(color: GradientColorManager.g2Color),
          borderRadius: BorderRadius.circular(14.w)),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(hintText: label, border: InputBorder.none),
      ),
    );
  }
}