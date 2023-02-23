import 'package:assign_1/models/_loyalti_card_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:assign_1/resources/resources.dart';
import 'loyallity_card.dart';

class UserDataField extends StatefulWidget {
  String label;
  String value;
  String? id;
  UserDataField({super.key, required this.label, required this.value, this.id});

  @override
  State<UserDataField> createState() => UserDataTextFieldState();
}

class UserDataTextFieldState extends State<UserDataField> {
  var db = FirebaseFirestore.instance
      .collection(FirebaseAuth.instance.currentUser!.email!);

  LoyaltyCardListModel? model;

  TextEditingController cardController = TextEditingController();

  TextEditingController vendorController = TextEditingController();

  TextEditingController programController = TextEditingController();

  TextEditingController websiteController = TextEditingController();

  TextEditingController notesController = TextEditingController();

  String dropDownValue = 'Rupay Card';

  var items = [
    'Rupay Card',
    'Visa Card',
    'Credit Card',
    'None',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setCardData();
  }

  Future<void> setCardData() async {
    await db.doc(widget.id).get().then((DocumentSnapshot snap) async {
      if (snap.exists) {
        cardController.text = snap['cardNumber'];
        programController.text = snap['programName'];
        websiteController.text = snap['url'];
        notesController.text = snap['notes'];
        dropDownValue = snap['vendorList'];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 5).r,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, "loyal_card");
                          },
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          widget.label,
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
                        padding: const EdgeInsets.only(
                                top: 40, bottom: 40, left: 45, right: 45)
                            .w,
                        child: const Text(
                            "Scan your card barcode or QR code and enter the following info as you prefer to link it to your card"),
                      ),
                      const Icon(
                        Icons.qr_code_2,
                        size: 100,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          CardTemplate(label: "+ Card front", icons: Icons.credit_card),
                          CardTemplate(label: "+ Card back", icons: Icons.credit_card),
                        ],
                      ),
                    ],
                  ),
                  CardFromField(
                    controller: cardController,
                    label: "Card number",
                  ),
                  Container(
                      height: 60,
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      padding: const EdgeInsets.only(
                          left: 20, top: 5, bottom: 5, right: 20),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: GradientColorManager.g2Color),
                          borderRadius: BorderRadius.circular(14)),
                      child: Center(
                          child: DropdownButton(
                        // Initial Value
                        value: dropDownValue,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),
                        isExpanded: true,
                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        isDense: true,
                        underline: Container(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropDownValue = newValue!;
                            // widget.a=dropdownvalue;
                          });
                        },
                      ))),
                  CardFromField(
                    controller: programController,
                    label: "Program Name",
                  ),
                  CardFromField(
                    controller: websiteController,
                    label: "Website URl",
                  ),
                  CardFromField(
                    controller: notesController,
                    label: "Notes",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.all(20),
                          ),
                          onPressed: () {
                            if (widget.value.contains("Save")) {
                              addDataFirestore();
                            } else if (widget.value.contains("Update")) {
                              updateData();
                            }
                          },
                          child: Text(widget.value)))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> updateData() async {
    final loyaltyCard = {
      "id": widget.id,
      "frontCardImg": "",
      "backCardImg": "",
      "cardNumber": cardController.text,
      "programName": programController.text,
      "url": websiteController.text,
      "notes": notesController.text,
      "vendorList": dropDownValue,
    };

    db.doc(widget.id).update(loyaltyCard).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoyalCard()));
      print("yes");
    });
  }

  Future<void> addDataFirestore() async {
    final loyaltyCard = {
      "id": "",
      "frontCardImg": "",
      "backCardImg": "",
      "cardNumber": cardController.text,
      "programName": programController.text,
      "url": websiteController.text,
      "notes": notesController.text,
      "vendorList": dropDownValue,
    };

    db.add(loyaltyCard).then((value) {
      db.doc(value.id).update({"id": value.id});
    });

    //var loyalModel= LoyaltyCardModel.fromJson(json);

    List<LoyaltyCardModel> listdata = [];

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoyalCard()));

    /*   db.get().then((value) {
      listdata.clear();
      listdata= value.docs.map((e) => LoyaltyCardModel.fromJson(e as Map<String, dynamic>)).toList();
    //  listdata.addAll(value as Iterable<LoyaltyCardModel>);
    //  LoyaltyCardModel data=LoyaltyCardModel.fromJson(value) ;
   //   print(listdata[0].url);
      print(listdata[0].url);
    });*/

    //
    //  FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser!.email!).doc().get().then((DocumentSnapshot snap) async{

    //print(snap.data().toString());
    //   }
    // });
  }
}

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
          style: newgetTextStyle(
              15.0, FontWeightManager.superBold, ColorManager.green),
        ),
      ],
    );
  }
}
