import 'package:flutter/material.dart';
import 'package:assign_1/screens/package_resources/package_resources.dart';



/* From Service class having Form key which can access global form anywhere we used for form validation in sign-in and sign-up
*/
class FormService {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
/* User Text Field reuse Widget, we use this TextFormField in Sign-in and Sign-up page for user input and check user put the value
correct or not so we From key to validate, we specify the conditions on diffferent different TeXtf fields it will works on different fields give the worning
*/

class UserTextField extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool disabled;
  final TextEditingController tController;
  const UserTextField(
      {super.key,
        required this.label,
        required this.icon,
        required this.disabled,
        required this.tController});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10).r,
      padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5).r,
      decoration: BoxDecoration(
          border: Border.all(color: GradientColorManager.g2Color),
          borderRadius: BorderRadius.circular(14.w)),
      child: TextFormField(
        controller: tController,
        textInputAction: TextInputAction.none,
        validator: (value) {
          if (label == "Password" || label == "Confirm-Password") {
            if (value == null || value.isEmpty) {
              return 'Please enter text';
            } else if (value.length < 6) {
              return 'Please enter more than 6 characters';
            }
          } else if (label == "E-mail") {
            if (value == null || value.isEmpty) {
              return 'Please enter text';
            } else if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}')
                .hasMatch(value)) {
              return 'Please enter a valid email address';
            }
          } else {
            if (value == null || value.isEmpty) {
              return 'Please enter text';
            }
          }
          return null;
        },
        obscureText: disabled,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: ColorManager.teal,
          ),
          hintText: label,
          contentPadding: const EdgeInsets.only(left: 15).r,
          border: InputBorder.none,
        ),
      ),
    );
  }
}