import 'package:assign_1/models/_loyalti_card_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:assign_1/resources/resources.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/Loyalcard.dart';

class loyal_card extends StatefulWidget {
  @override
  State<loyal_card> createState() => _loyal_cardState();
}

class _loyal_cardState extends State<loyal_card> {

  Loyalcard cardMainData=Loyalcard();
  LoyaltyCardListModel? model;

  @override
  void initState() {
    super.initState();
    getLoyaltyCardData();
  }

  Future<void> getLoyaltyCardData() async {
    var currentUser=FirebaseAuth.instance.currentUser?.email;
    await FirebaseFirestore.instance.collection(currentUser!).get().then((QuerySnapshot carddata){

      Map<String,dynamic> maindata={};
      List<Map<String, dynamic>>? list = [];

      list = carddata.docs.map((doc) => doc.data() ).cast<Map<String, dynamic>>().toList();
      print(list[0]['programName']);
      maindata.addAll({"list": list});
      //model= LoyaltyCardListModel.fromJson(maindata);
      setState(() {
        model= LoyaltyCardListModel.fromJson(maindata);
      });
       print(model?.list?[1].url);
     //  cardd=model;

      //print(list);
   /*    carddata.docs.toList();
     //  print(carddata.docs.first.data().toString());
       List<Map<dynamic, dynamic>> list = [];

       carddata.docs.forEach((element) {
         list.add(element.data());
   *//* print(element.data().toString());
});*/
     //  var model= LoyaltyCardModel.fromJson(carddata.docs.first);
      // print(model.url);

      //debugPrint(carddata.toString());


      // list = snapshot.docs.map((doc) => doc.data() ).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black, blurStyle: BlurStyle.inner)
                ],
              ),
              margin: const EdgeInsets.only(top: 5).r,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 5).r,
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
                              "Loyalty Cards",
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10).r,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.search,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            const Icon(
                              Icons.document_scanner_outlined,
                              size: 30,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                    ).r,
                    child: Row(
                      children: [
                        Container(
                          //It show the loaction of the shop
                          margin: const EdgeInsets.only(
                            left: 1,
                            top: 5,
                          ).r,
                          height: 23.h,
                          child: Image.asset(
                            //image of location icon
                            IconAssets.location_icon,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Johan - TW12 44GH - Londan",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeightManager.medium),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /*cardd.list?.length==0 ? Center(
              child: CircularProgressIndicator(

              ),
            ):*/
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                // implement GridView.builder
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 6 / 5,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemCount: model?.list?.length, //cardd.list?.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Column(
                        children: [
                          Expanded(
                            child: Card(
                              color: Colors.cyan,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        child: PopupMenuButton(
                                          icon: Icon(Icons.more_vert),
                                          // Callback that sets the selected popup menu item.
                                          itemBuilder: (BuildContext context) =>
                                              <PopupMenuEntry>[
                                            PopupMenuItem(
                                              child: TextButton(
                                                  onPressed: () {
                                                    Navigator.pushNamed(
                                                        context, "userDataField");
                                                  },
                                                  child: Text("Edit")),
                                            ),
                                            PopupMenuItem(
                                              child: TextButton(
                                                  onPressed: () {},
                                                  child: Text("Delete")),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const CircleAvatar(
                                    radius: 30,
                                    child: Icon(Icons.rounded_corner),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Text(model?.list![index].programName??'d'),
                        //  Text(cardMainData[index].programName),
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.pushNamed(context, "userDataField");
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}


