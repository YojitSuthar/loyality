import 'package:flutter/material.dart';
import 'package:assign_1/screens/package_resources/package_resources.dart';


class SearchSection extends StatelessWidget {
  static String id = "search";
  TextEditingController textSearchController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ViewDesign(
            label: "Search College",
            height: 200,
          ),
          SizedBox(
            height: 10.h,
          ),
          Form(
            key: FormService.formKey,
            child: Column(
              children: [
                UserTextField(
                    label: "Search college",
                    icon: Icons.home,
                    disabled: false,
                    tController: textSearchController),
                Buttons(
                  label: "Search",
                  navigation: "null",
                  formKey: FormService.formKey,
                  eController: textSearchController,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

