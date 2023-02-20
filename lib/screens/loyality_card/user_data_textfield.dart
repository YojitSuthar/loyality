import 'package:assign_1/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:assign_1/resources/resources.dart';

class userDataField extends StatelessWidget {
  TextEditingController card_controller = TextEditingController();
  TextEditingController vendor_contrller = TextEditingController();
  TextEditingController program_controller = TextEditingController();
  TextEditingController website_controller = TextEditingController();
  TextEditingController notes_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 5).r,
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "New Card",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                            "Scan your card barcode or QR code and enter the following info as you prefer to link it to your card"),
                        padding: EdgeInsets.only(
                            top: 40, bottom: 40, left: 45, right: 45)
                            .w,
                      ),
                      Container(
                        child: Icon(
                          Icons.qr_code_2,
                          size: 100,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          card(label: "+ Card front", icons: Icons.credit_card),
                          card(label: "+ Card back", icons: Icons.credit_card),
                        ],
                      ),
                    ],
                  ),
                  card_from_field(
                    controller: card_controller,
                    label: "Card number",
                  ),
                  card_from_field(
                    controller: vendor_contrller,
                    label: "Vendor Card",
                  ),
                  card_from_field(
                    controller: program_controller,
                    label: "Program Name",
                  ),
                  card_from_field(
                    controller: website_controller,
                    label: "Website URl",
                  ),
                  card_from_field(
                    controller: notes_controller,
                    label: "Notes",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 15,right: 15),
                      child:
                          ElevatedButton(style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            padding: EdgeInsets.all(20),
                          ),onPressed: () {}, child: Text("Save")))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class card_from_field extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  card_from_field({required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10).r,
      padding: EdgeInsets.only(left: 20, top: 5, bottom: 5).r,
      decoration: BoxDecoration(
          border: Border.all(color: GradientColorManager.g2_color),
          borderRadius: BorderRadius.circular(14.w)),
      child: TextFormField(
        controller: controller,
        decoration:
            InputDecoration(hintText: "$label", border: InputBorder.none),
      ),
    );
  }
}

class card extends StatelessWidget {
  final String label;
  final IconData icons;

  card({required this.label, required this.icons});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DottedBorder(
          color: Colors.black,
          radius: Radius.circular(20),
          strokeWidth: 1,
          dashPattern: [
            2,
            4,
          ],
          child: Container(
            height: 73,
            width: 124,
            child: Center(
                child: Icon(
              icons,
              size: 50,
            )),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "$label",
          style: newgetTextStyle(
              15.0, FontWeightManager.super_bold, ColorManager.green),
        ),
      ],
    );
  }
}
