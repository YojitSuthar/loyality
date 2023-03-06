import 'package:flutter/material.dart';
import 'package:assign_1/screens/package_resources/package_resources.dart';

//USerData TextField used to get user data

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

  static TextEditingController cardController = TextEditingController();
  static TextEditingController vendorController = TextEditingController();
  static TextEditingController programController = TextEditingController();
  static TextEditingController websiteController = TextEditingController();
  static TextEditingController notesController = TextEditingController();

  String dropDownValue = 'Rupay Card';
  // option of the dropDown menu
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
  //function works to get the data from the database and set on text fields
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
  // function has work to update user data in database
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
      Navigator.pop(context);
    });
  }
  // function has work to to add the data to the database
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
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(1),
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
                              Navigator.pop(context);
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
                            CardTemplate(
                                label: "+ Card front", icons: Icons.credit_card),
                            CardTemplate(
                                label: "+ Card back", icons: Icons.credit_card),
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
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                            margin: const EdgeInsets.only(left: 15, right: 15),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  padding: const EdgeInsets.only(left: 150,right: 150,top: 20,bottom: 20),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




