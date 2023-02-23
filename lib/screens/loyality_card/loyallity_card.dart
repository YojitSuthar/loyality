import 'package:assign_1/models/_loyalti_card_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:assign_1/resources/resources.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/Loyalcard.dart';
enum MenuOptions {
  item1,
  item2,
}
class loyal_card extends StatefulWidget {
  @override
  State<loyal_card> createState() => _loyal_cardState();
}

class _loyal_cardState extends State<loyal_card> {

  Loyalcard cardMainData=Loyalcard();
  LoyaltyCardListModel? model;
  var currentUser=FirebaseAuth.instance.currentUser?.email;

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
      maindata.addAll({"list": list});
      setState(() {
        model= LoyaltyCardListModel.fromJson(maindata);
      });

    });
  }

  Future<void> removeCard(String index) async {
    print(index);
    setState(() async {
      await FirebaseFirestore.instance.collection(currentUser!).doc(index).delete().then((value) => debugPrint("done"));
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
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                size: 30,
                              ), onPressed: () { Navigator.pop(context);},
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
                              color: Colors.green[500],
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      PopupMenuButton<MenuOptions>(
                                        icon: const Icon(Icons.more_vert),
                                        position: PopupMenuPosition.under,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                        // constraints: BoxConstraints.expand(width: 150),
                                        onSelected: (MenuOption){
                                          if(MenuOption==MenuOptions.item1){
                                            Navigator.pushNamed(context, "EdituserDataField");
                                          }
                                        },
                                        itemBuilder: (BuildContext context) =>[
                                          PopupMenuItem(child: Text('Edit',style: TextStyle(color: Colors.green),),value: MenuOptions.item1,),
                                          PopupMenuDivider(height: 1,),
                                          PopupMenuItem(
                                            child:  Text("Delete",style: TextStyle(color: Colors.lightGreen),),
                                            value: MenuOptions.item2,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                   CircleAvatar(
                                    radius: 30,
                                    child: Text(model?.list![index].programName![0].toUpperCase()??'d',style: TextStyle(fontSize: 50),),
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


